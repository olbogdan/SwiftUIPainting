//
//  LottieAnimationView.swift
//  HappyBrushPainting
//
//  Created by Oleksandr Bogdanov on 22.02.22.
//

import SwiftUI
import Lottie

/// SwiftUI wrapper around `Lottie.AnimationView`
public struct LottieView: UIViewRepresentable {
    
    /// The animation
    let animation: Lottie.Animation?
    
    /// Flag if the animation should be played
    @Binding var play: Bool
    
    /// Loop mode of the animation provided by the `@Environment`
    ///
    /// You can set this property using `lottieLoopMode` method on `View`
    @Environment(\.lottieLoopMode) var loopMode: LottieLoopMode
    
    public init(animation: Lottie.Animation, play: Binding<Bool>) {
        self.animation = animation
        self._play = play
    }
    
    public init(name: String, play: Binding<Bool>) {
        animation = .named(name)
        self._play = play
    }

    public init(filepath: String, play: Binding<Bool>) {
        animation = .filepath(filepath)
        _play = play
    }
    
    // MARK: - UIViewRepresentable
    public func makeUIView(context: Context) -> WrapperAnimationView {
        WrapperAnimationView(animation: animation)
    }

    public func updateUIView(_ uiView: WrapperAnimationView, context: Context) {
        uiView.loopMode = loopMode
        if play {
            uiView.play { completed in
                self.play = !completed
            }
        } else {
            uiView.stop()
            play = false
        }
    }
}

extension LottieView {
    /// Convenient initializer which sets `play` to `.constant(true)`.
    public init(name: String) {
        self.init(name: name, play: .constant(true))
    }
}

struct LottieLoopModeKey: EnvironmentKey {
    static var defaultValue: LottieLoopMode = .playOnce
}

extension EnvironmentValues {
    var lottieLoopMode: LottieLoopMode {
        get { self[LottieLoopModeKey.self] }
        set { self[LottieLoopModeKey.self] = newValue }
    }
}

extension View {
    public func lottieLoopMode(_ mode: LottieLoopMode) -> some View {
        environment(\.lottieLoopMode, mode)
    }
}
