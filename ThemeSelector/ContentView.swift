//
//  ContentView.swift
//  ThemeSelector
//
//  Created by mac on 18/10/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(ThemeManager.self) var themeManager: ThemeManager
    @State var showTheme = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(themeManager.selectedTheme.gradient)
            
            Button("Show themes") {
                self.showTheme = true
            }
            .buttonStyle(.borderedProminent)
        }
        .ignoresSafeArea()
        .sheet(isPresented: $showTheme){
            ThemeSelectorView()
                .presentationDetents([.medium])
        }
    }
}

#Preview {
    ContentView()
        .environment(ThemeManager())
}

