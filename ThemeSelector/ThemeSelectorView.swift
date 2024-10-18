//
//  ThemeSelectorView.swift
//  ThemeSelector
//
//  Created by mac on 18/10/24.
//

import SwiftUI

struct ThemeSelectorView: View {
    @Environment(ThemeManager.self) var themeManager: ThemeManager
    @Environment(\.dismiss) var dismiss
    
    let columns = Array(repeating: GridItem(.flexible()), count: 4)
                   
    var body: some View {
        NavigationStack {
            GroupBox {
                LazyVGrid(columns: columns) {
                    ForEach(Color.themeColors, id: \.self) { color in
                        Button(action: {
                            themeManager.selectedTheme = color
                        }, label: {
                            colorBox(color)
                        })
                    }
                }
            }
            .padding()
            .navigationTitle("Select a theme")
            .toolbar {
                Button(action: {
                    self.dismiss()
                }, label: {
                    Image(systemName: "multiply.circle")
                        .font(.title)
                })
            }
        }
    }
    
    func colorBox(_ color: Color) -> some View {
        Color(color)
            .frame(height: 60)
            .border(themeManager.selectedTheme == color ? .blue: .clear, width: 5)
            .cornerRadius(8)
            .padding(10)
    }
}

#Preview {
    ThemeSelectorView()
        .environment(ThemeManager())
}
