//
//  PROGRESS INDICATORS.swift
//  recreate
//
//  Created by Kevin Buchholz on 6/2/23.
//

import Foundation
import SwiftUI

struct SocialProgressView: View {
    let socialProgress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.orange.opacity(0.5),
                    lineWidth: 20
                )
            
            Circle()
                .trim(from: 0, to: socialProgress)
                .stroke(
                    Color.orange,
                    style: StrokeStyle(
                    lineWidth: 20,
                    lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: socialProgress)
        }
    }
}

struct RecreateProgressView: View {
    let recreateProgress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.teal.opacity(0.5),
                    lineWidth: 20
                )
            
            Circle()
                .trim(from: 0, to: recreateProgress)
                .stroke(
                    Color.teal,
                    style: StrokeStyle(
                    lineWidth: 20,
                    lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: recreateProgress)
        }
    }
}

