//
//  MovieDetailsView.swift
//  books
//
//  Created by ساره المرشد on 10/06/2023.
//


import SwiftUI
 
struct MovieDetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var presentEditMovieSheet = false
     
    var movie: Movie
     
    private func editButton(action: @escaping () -> Void) -> some View {
      Button(action: { action() }) {
        Text("Edit")
      }
    }
     
    var body: some View {
      Form {
        Section(header: Text("Book")) {
          Text(movie.title)
          Text(movie.description)
             
        }
         
        Section(header: Text("Year")) {
            Text(movie.year)
        }
      }
      .navigationBarTitle(movie.title)
      .navigationBarItems(trailing: editButton {
        self.presentEditMovieSheet.toggle()
      })
      .onAppear() {
        print("MovieDetailsView.onAppear() for \(self.movie.title)")
      }
      .onDisappear() {
        print("MovieDetailsView.onDisappear()")
      }
      .sheet(isPresented: self.$presentEditMovieSheet) {
        MovieEditView(viewModel: MovieViewModel(movie: movie), mode: .edit) { result in
          if case .success(let action) = result, action == .delete {
            self.presentationMode.wrappedValue.dismiss()
          }
        }
      }
    }
     
  }
 
struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let movie = Movie(title: "title book", description: "this is a sample description", year: "2021")
        return
          NavigationView {
            MovieDetailsView(movie: movie)
          }
    }
}
//struct MovieDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailsView()
//    }
//}
