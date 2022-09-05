//
//  Clover_Hub_PublicApp.swift
//  Clover_Hub-Public
//
//  Created by Prisha Anand on 9/4/22.
//

import SwiftUI

@main
struct Clover_Hub_Public: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
