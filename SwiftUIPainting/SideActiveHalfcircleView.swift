//
//  SideActiveHalfcircleView.swift
//  HappyBrushPainting
//
//  Created by Oleksandr Bogdanov on 03.02.22.
//

import SwiftUI

struct SideActiveHalfcircleView: View {
    var body: some View {
        HalfcircleShape()
    }
}

struct TopRightView_Previews: PreviewProvider {
    static var previews: some View {
        HalfcircleShape()
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
