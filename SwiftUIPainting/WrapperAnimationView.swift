//
//  WrapperAnimationView.swift
//  HappyBrushPainting
//
//  Created by Oleksandr Bogdanov on 22.02.22.
//

import UIKit
import Lottie


public final class WrapperAnimationView: UIView {
    let animationView: AnimationView!

    init(animation: Lottie.Animation?) {
        let animationView = AnimationView(animation: animation)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        self.animationView = animationView

        super.init(frame: .zero)

        addSubview(animationView)
        animationView.contentMode = .scaleAspectFit
//        animationView.translatesAutoresizingMaskIntoConstraints = false
        
//        NSLayoutConstraint.activate([
//            animationView.topAnchor.constraint(greaterThanOrEqualTo: topAnchor),
//            animationView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
//            animationView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
//            animationView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
//            animationView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            animationView.centerYAnchor.constraint(equalTo: centerYAnchor)
//        ])
        NSLayoutConstraint.activate([
            animationView.leftAnchor.constraint(equalTo: leftAnchor),
            animationView.rightAnchor.constraint(equalTo: rightAnchor),
            animationView.topAnchor.constraint(equalTo: topAnchor),
            animationView.bottomAnchor.constraint(equalTo: bottomAnchor)
           ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WrapperAnimationView {
    var loopMode: LottieLoopMode {
        get { animationView.loopMode }
        set { animationView.loopMode = newValue }
    }

    func play(completion: LottieCompletionBlock?) {
        animationView.play(completion: completion)
    }

    func stop() {
        animationView.stop()
    }
}
