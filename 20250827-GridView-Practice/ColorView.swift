//
//  ColorView.swift
//  20250827-GridView-Practice
//
//  Created by Da Wei Hao on 2025/8/27.
//

import SwiftUI

struct ColorView: View {
    var color: Color
    
    init(_ color: Color) { self.color = color }
    
    var body: some View {
        Rectangle()
            .fill(color.gradient)
            .overlay {
                Text(color.description)
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                    .shadow(radius: 5)
            }
    }
}

struct GridPracticeView: View {
    var body: some View {
        VStack {
            Grid(horizontalSpacing: 10, verticalSpacing: 10) {
                GridRow {
                    ColorView(.pink)
                        .gridCellColumns(2)
                    
                    Grid {
                        ColorView(.blue)
                        ColorView(.purple)
                        ColorView(.brown)
                    }
                }
                
                Grid {
                    GridRow {
                        ColorView(.orange)
                        ColorView(.indigo)
                        
                        Grid {
                            GridRow {
                                ColorView(.cyan)
                                Color(.yellow)
                            }
                            ColorView(.mint)
                            ColorView(.green)
                        }.gridCellColumns(2)
                    }
                }
            }
        }
    }
}

let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .indigo, .purple, .pink, .brown, .cyan, .mint, .teal, .gray]

#Preview("Grid Practice") {
    GridPracticeView()
}
