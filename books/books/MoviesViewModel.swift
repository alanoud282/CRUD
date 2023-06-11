//
//  MoviesViewModel.swift
//  books
//
//  Created by ساره المرشد on 10/06/2023.
//
import Foundation
import Combine
import FirebaseFirestore
 
class MoviesViewModel: ObservableObject {
  @Published var movies = [Movie]()
   
  private var db = Firestore.firestore()
  private var listenerRegistration: ListenerRegistration?
   
  deinit {
    unsubscribe()
  }
   
  func unsubscribe() {
    if listenerRegistration != nil {
      listenerRegistration?.remove()
      listenerRegistration = nil
    }
  }
   
  func subscribe() {
    if listenerRegistration == nil {
      listenerRegistration = db.collection("booklist").addSnapshotListener { (querySnapshot, error) in
        guard let documents = querySnapshot?.documents else {
          print("No documents")
          return
        }
         
        self.movies = documents.compactMap { queryDocumentSnapshot in
          try? queryDocumentSnapshot.data(as: Movie.self)
        }
      }
    }
  }
   
  func removeMovies(atOffsets indexSet: IndexSet) {
    let movies = indexSet.lazy.map { self.movies[$0] }
    movies.forEach { movie in
      if let documentId = movie.id {
        db.collection("booklist").document(documentId).delete { error in
          if let error = error {
            print("Unable to remove document: \(error.localizedDescription)")
          }
        }
      }
    }
  }
 
   
}

//struct MoviesViewModel_Previews: PreviewProvider {
//    static var previews: some View {
//        MoviesViewModel()
//    }
//}
