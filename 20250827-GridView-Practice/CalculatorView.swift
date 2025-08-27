//
//  ContentView.swift
//  20250827-GridView-Practice
//
//  Created by Da Wei Hao on 2025/8/27.
//

import SwiftUI

let calculatorInput = [
    ["AC", "+/-", "%", "÷"],
    ["7", "8", "9", "×"],
    ["4", "5", "6", "-"],
    ["1", "2", "3", "+"],
    ["0", ".", "="]
]

struct CalculatorView: View {
    var body: some View {
        VStack {
            Text("計算機")
                .font(.title)
                .bold()
        }
        
        // For Each的寫法
        VStack {
            NumberDisplayView()
        
            ForEach(calculatorInput, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { item in
                        TextButton(text: item)
                    }
                }
            }
        }.padding(.horizontal)
    }
}

struct CalculatorGridView: View {
    var body: some View {
        VStack {
            Text("計算機")
                .font(.title)
                .bold()
        }
        
        // For Each的寫法
        VStack {
            NumberDisplayView()
        
            // 用Grid的寫法，更簡潔
            Grid {
                ForEach(calculatorInput.dropLast(1), id: \.self) { inputs in
                    GridRow {
                        ForEach(inputs, id: \.self) { row in
                            TextButton(text: row)
                        }
                    }
                }
                
                GridRow {
                    // 調整0的寬度 gridCellColumns(2)可以拿來處理排版問題
                    TextButton(text: "0").gridCellColumns(2)
                    TextButton(text: ".")
                    TextButton(text: "=")
                }
            }
        }.padding(.horizontal)
    }
}



struct NumberDisplayView: View {
    var body: some View {
        Text("1")
            .padding()
            .font(.title.weight(.medium))
            .frame(maxWidth: .infinity, alignment: .trailing)
            .background(RoundedRectangle(cornerRadius: 8).foregroundStyle(.gray.gradient.opacity(0.4)))
    }
}

struct TextButton: View {
    var text: String
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        Button {
        } label: {
            Text(text)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.bordered)
    }
}

// PREVIEW
#Preview("Calculator View") {
        CalculatorView()
}

#Preview("Grid View") {
    CalculatorGridView()
}
