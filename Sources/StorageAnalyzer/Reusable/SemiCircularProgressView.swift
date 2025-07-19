//
//  SemiCircularProgressView.swift
//  AtomPic
//
//  Created by Oscar Castillo on 2/11/24.
//

import Foundation
import SwiftUI

// MARK: - Semi-Circular Progress View

public struct SemiCircularProgressView: View {
    let progress: Double
    
    public init(progress: Double) {
        self.progress = progress
    }
    
    public var body: some View {
        ZStack {
            // Background semi-circle
            Circle()
                .trim(from: 0.3, to: 0.9)
                .stroke(style: StrokeStyle(lineWidth: 24.0, lineCap: .round, lineJoin: .round))
                .opacity(0.3)
                .foregroundColor(Color.gray)
                .rotationEffect(.degrees(54.5))
            
            // Gradient progress semi-circle
            Circle()
                .trim(from: 0.3, to: 0.3 + progress * 0.6)
                .stroke(style: StrokeStyle(lineWidth: 24.0, lineCap: .round, lineJoin: .round))
                .fill(AngularGradient(gradient: Gradient(stops: [
                    .init(color: Color.init(hex: "32E1A0"), location: 0.3),  // Green at start
                    .init(color: Color.init(hex: "EEED56"), location: 0.48), // Yellow in the middle
                    .init(color: Color.init(hex: "EFBF39"), location: 0.6),  // Orange towards end
                    .init(color: Color.init(hex: "ED4D4D"), location: 0.9)   // Red at end
                ]), center: .center))
                .rotationEffect(.degrees(54.5))
        }
        .frame(width: 250, height: 250)
        .padding(.bottom, -90)
        .background(Color.orange)
        
    }
}

#Preview {
    SemiCircularProgressView(progress: 0.5)
}



