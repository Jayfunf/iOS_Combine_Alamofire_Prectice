//
//  iOS_Combine_Alamofire_SwiftUI_PracticeApp.swift
//  iOS_Combine_Alamofire_SwiftUI_Practice
//
//  Created by Minhyun Cho on 2021/09/06.
//

import SwiftUI

@main
struct iOS_Combine_Alamofire_SwiftUI_PracticeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
