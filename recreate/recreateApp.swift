//
//  recreateApp.swift
//  recreate
//
//  Created by Kevin Buchholz on 5/19/23.
//

import SwiftUI

@main
struct recreateApp: App {
    @StateObject var viewModel = LocalUserViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(LocalUserViewModel())
        }
    }
}
