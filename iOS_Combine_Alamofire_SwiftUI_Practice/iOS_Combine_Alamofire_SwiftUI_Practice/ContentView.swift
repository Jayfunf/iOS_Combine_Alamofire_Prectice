//
//  ContentView.swift
//  iOS_Combine_Alamofire_SwiftUI_Practice
//
//  Created by Minhyun Cho on 2021/09/06.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @ObservedObject var randomUserViewModel = RandomUserViewModel()
    
    var body: some View {
        
        List(randomUserViewModel.randomUsers){aRandomUser in
            RandomUserRowView(aRandomUser)
        }
//        List(0...100,id: \.self) { index in
//            RandomUserRowView()
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
