//
//  DashedDivider.swift
//  Clover-Hub
//
//  Created by Prisha Anand on 9/3/22.
//
// Code to create dashed divider to seperate elements on the screen.

import SwiftUI

struct DashedDivider: View {
    var body: some View {
        
        GeometryReader { geo in
            Path { path in
                path.move(to: CGPoint.zero)
                path.addLine(to: CGPoint(x: geo.size.width, y: 0))
            }
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
            .foregroundColor(.white)
        }
        //force reader to refrain from expanding and trying to take up all available space
        .frame(height: 1)
       
        
    }
}

struct DashedDivider_Previews: PreviewProvider {
    static var previews: some View {
        DashedDivider()
    }
}

