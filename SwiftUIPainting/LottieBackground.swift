//
//  LottieBackground.swift
//  HappyBrushPainting
//
//  Created by Oleksandr Bogdanov on 22.02.22.
//

import SwiftUI


struct LottieBackground: View {
    @State var playLottie = true
    
    var body: some View {
        ZStack {
            Color.pink
            LottieView(name: "02_HB_SmartApp-Pairing_Loop01", play: $playLottie)
                .lottieLoopMode(.loop)
            .ignoresSafeArea()
        }
    }
}


struct LottieBackground_Previews: PreviewProvider {
    static var previews: some View {
        LottieBackground()
    }
}
