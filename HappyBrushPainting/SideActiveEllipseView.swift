//
//  SideActiveEllipseView.swift
//  HappyBrushPainting
//
//  Created by Oleksandr Bogdanov on 03.02.22.
//

import SwiftUI

struct SideActiveEllipseView: View {
    var body: some View {
        EllipseShape()
    }
}

struct SideActiveEllipseView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("EllipseShape")
            EllipseShape()
                .frame(width: 66, height: 40)
                .foregroundColor(.blue)

            Text("BazierCurve")
            BazierCurveShape()
                .frame(width: 66, height: 50)
            
            Text("RelativeArcShape")
            RelativeArcShape()
                .frame(width: 66, height: 50)
            
            Text("HalfCirlcle with QuadCurve")
            HalfcircleShape()
                .frame(width: 66, height: 50)
   
        }
    }
}

private struct EllipseShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addEllipse(in: rect)
        path.move(to: CGPoint(x: 0, y: rect.height/2))
//        path.addQuadCurve(to: CGPoint(x: rect.width, y: rect.height/2), control: CGPoint(x: rect.width/2, y: rect.height/3.5))
        return path
    }
}

private struct RelativeArcShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.height/2))
        path.addQuadCurve(to: CGPoint(x: rect.width, y: rect.height/2), control: CGPoint(x: rect.width/2, y: -rect.height/2))
        return path
    }
}

private struct BazierCurveShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.height/2))
        
        path.addQuadCurve(to: CGPoint(x: rect.width/2, y: 0), control: CGPoint(x: 0, y: 0))
        
        path.addQuadCurve(to: CGPoint(x: rect.width, y: rect.height/2), control: CGPoint(x: rect.width, y: 0))
        return path
    }
}

private struct HalfcircleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.width/2, y: rect.height/2), radius: rect.width/2, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 180), clockwise: true)
        path.addQuadCurve(to: CGPoint(x: rect.width, y: rect.height/2), control: CGPoint(x: rect.width/2, y: rect.height/3.5))
        return path
    }
}
