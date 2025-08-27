//
//  UnsizedAxesView.swift
//  20250827-GridView-Practice
//
//  Created by Da Wei Hao on 2025/8/27.
//

import SwiftUI

struct UnsizedAxesView: View {
    var body: some View {
        VStack {
            Grid {
                GridRow {
                    Color.yellow
                        .gridCellUnsizedAxes(.vertical)
                        .gridCellUnsizedAxes(.horizontal)
                    
                    Image("topGunPost")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .gridCellColumns(2)
                }
                
                GridRow {
                    Image("yt")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .gridCellColumns(2)
                        .gridCellUnsizedAxes(.vertical)
                    
                    Image("tom")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
        }
        .padding()
    }
}

#Preview {
    UnsizedAxesView()
}
