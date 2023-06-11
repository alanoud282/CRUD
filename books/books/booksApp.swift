//
//  booksApp.swift
//  books
//
//  Created by ساره المرشد on 10/06/2023.
//

import SwiftUI
import Firebase

@main
struct booksApp: App {
    
   init() {
   FirebaseApp.configure()
   }
    
   var body: some Scene {
       WindowGroup {
           ContentView()
       }
   }
}
