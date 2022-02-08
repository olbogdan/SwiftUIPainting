//
//  TopFrontView.swift
//  HappyBrushPainting
//
//  Created by Oleksandr Bogdanov on 03.02.22.
//

import SwiftUI

struct TopFrontView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.cyan
                .ignoresSafeArea()
            VStack {
                TopFrontTView()
                
                TorpRightTView()
                
                GradientedViews()
                VStack {
                    Text("Oval drown by code using Path()")
                ZStack {
                    SideActiveEllipseView()
                        .frame(width: 32, height: 23)
                        .foregroundColor(.white)
                }}
            }
        }
    }
}

struct EllipseView: View {
    var width: CGFloat = 32
    var height: CGFloat = 23
    var body: some View {
        Ellipse()
            .inset(by: 0.8)
            .stroke(lineWidth: 1.6)
            .frame(width: width, height: height)
            .foregroundColor(.white)
    }
}

struct EllipseViewGradient: View {
    var width: CGFloat = 32
    var height: CGFloat = 23
    var body: some View {
        ZStack {
            EllipseView(width: width, height: height)
            Ellipse()
                        .inset(by: 0.8)
                        .frame(width: width, height: height)
                        .foregroundStyle(
                            LinearGradient(gradient: Gradient(stops: [
                                .init(color: .clear, location: 0.6),
                                                .init(color: .white, location: 0.7)
                                            ]), startPoint: .bottom, endPoint: .top)
                    )
        }
    }
}

struct EllipseViewCenterGradient: View {
    var width: CGFloat = 32
    var height: CGFloat = 23
    var body: some View {
        ZStack {
            EllipseView(width: width, height: height)
            Ellipse()
                        .inset(by: 0.8)
                        .frame(width: width, height: height)
                        .foregroundStyle(
                            LinearGradient(gradient: Gradient(stops: [
                                .init(color: .clear, location: 0.3),
                                .init(color: .white, location: 0.5),
                                                .init(color: .clear, location: 0.7)
                                            ]), startPoint: .bottom, endPoint: .top)
                    )
        }
    }
}

struct EllipseHalfView: View {
    var width: CGFloat = 32
    var height: CGFloat = 23
    var body: some View {
        ZStack {
            EllipseView(width: width, height: height)
            Ellipse()
                .fill(Color.white)
                .frame(width: width, height: height)
                .offset(y: -height / 2)
                .clipped()
                .offset(y: height / 2)
        }
    }
}

struct EllipseFilledView: View {
    var width: CGFloat = 32
    var height: CGFloat = 23
    var body: some View {
        Ellipse()
            .frame(width: width, height: height)
            .foregroundColor(.white)
    }
}


struct MyButtonStyle: ButtonStyle {
    public func makeBody(configuration: MyButtonStyle.Configuration) -> some View {
        configuration.label
            .compositingGroup()
            .opacity(configuration.isPressed ? 0.5 : 1.0)
    }
}

struct TopFrontView_Previews: PreviewProvider {
    static var previews: some View {
        TopFrontView()
    }
}

struct TopFrontTView: View {
    var body: some View {
        HStack(alignment: .top) {
            
            
            VStack {
                Text("Draw a manually Shape  \n (using overlay + offset + transform of second full colored ellipse)")
                
                EllipseView()
                
                EllipseFilledView()
                EllipseHalfView()
                EllipseHalfView()
                    .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
            }
        }
    }
}

struct TorpRightTView: View {
    var body: some View {
        HStack(alignment: .top) {
            
            VStack {
                Text("Norbert's svg")
                Image("top-right-4")
            }
            VStack {
                Text("Shape drown by code ")
                Text("transformation and rotation")
                
                EllipseView(width: 32, height: 25)
                    .rotationEffect(.degrees(-110))
                
                EllipseFilledView(width: 32, height: 25)
                    .rotationEffect(.degrees(-110))
                EllipseHalfView(width: 32, height: 25)
                    .rotationEffect(.degrees(-110))
                EllipseHalfView(width: 32, height: 25)
                    .rotation3DEffect(.degrees(-180), axis: (x: 1, y: 0, z: 0))
                    .rotationEffect(.degrees(-110))
            }
        }
    }
}

struct GradientedViews: View {
    var body: some View {
        VStack {
            Text("Oval drown by code using SwiftUI Ellipse")
            Text("Fill background by gradient")
            EllipseViewGradient()
                .rotationEffect(.degrees(-110))
            EllipseViewGradient()
                .rotation3DEffect(.degrees(-180), axis: (x: 1, y: 0, z: 0))
                .rotationEffect(.degrees(-110))
            EllipseViewCenterGradient()
                .rotationEffect(.degrees(-110))
            EllipseViewGradient(width: 40, height: 37)
                .rotationEffect(.degrees(-100))
            EllipseViewGradient(width: 40, height: 37)
                .rotation3DEffect(.degrees(-180), axis: (x: 1, y: 0, z: 0))
                .rotationEffect(.degrees(-100))
            EllipseViewCenterGradient(width: 40, height: 37)
                .rotationEffect(.degrees(-100))
                
        }
        
    }
}

struct ExtractedView: View {
    var body: some View {
        ExtractedView()
    }
}
