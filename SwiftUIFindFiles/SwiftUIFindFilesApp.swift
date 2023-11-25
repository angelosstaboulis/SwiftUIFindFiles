//
//  SwiftUIFindFilesApp.swift
//  SwiftUIFindFiles
//
//  Created by Angelos Staboulis on 25/11/23.
//

import SwiftUI

@main
struct SwiftUIFindFilesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(path: "").frame(width: 700,height: 500)
        }.windowResizability(.contentSize)
    }
}
