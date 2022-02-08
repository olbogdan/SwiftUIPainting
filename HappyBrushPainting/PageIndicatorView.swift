//
//  PageIndicatorView.swift
//  HappyBrushPainting
//
//  Created by Oleksandr Bogdanov on 04.02.22.
//

import SwiftUI

struct PageIndicatorView: View {
    @State private var currentIndex = 0
    private let colors: [Color] = [.red, .blue, .green, .yellow, .green, .pink]
    
    var body: some View {
        TabView(selection: $currentIndex.animation()) {
            ForEach(0..<colors.count, id: \.self) { index in
                colors[index]
                    .tag(index)
                    .ignoresSafeArea()
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .overlay(CapsuleIndexView(numberOfPages: colors.count, currentIndex: currentIndex))
        .ignoresSafeArea()
    }
}

struct PageIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        PageIndicatorView()
    }
}

struct CapsuleIndexView: View {
    
    let numberOfPages: Int
    let currentIndex: Int
    
    private let circleSize: CGFloat = 8
    private let circleSpacing: CGFloat = 8
    
    private let primaryColor = Color.white
    
    var body: some View {
        HStack(spacing: circleSpacing) {
            ForEach(0..<numberOfPages) { index in
                
                if currentIndex == index {
                    Capsule().frame(width: circleSize*8, height: circleSize)
                        .foregroundColor(primaryColor)
                        .transition(AnyTransition.scale)
                } else {
                    Circle()
                        .fill(primaryColor)
                        .frame(width: circleSize, height: circleSize)
                        .id(index)
                }
            }
        }
    }
}
