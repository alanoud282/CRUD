//
//  Movie.swift
//  books
//
//  Created by ساره المرشد on 10/06/2023.
//
import Foundation
import Foundation
import FirebaseFirestoreSwift
 
struct Movie: Identifiable, Codable {
  @DocumentID var id: String?
  var title: String
  var description: String
  var year: String
   
  enum CodingKeys: String, CodingKey {
    case id
    case title
    case description
    case year
  }
}
//
//struct Movie_Previews: PreviewProvider {
//    static var previews: some View {
//        Movie()
//    }
//}
