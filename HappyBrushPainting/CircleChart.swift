//
//  CircleChart.swift
//  HappyBrushPainting
//
//  Created by Oleksandr Bogdanov on 07.02.22.
//

import SwiftUI

struct CircleChart: View {
    @State var progressValue: CGFloat = 0.10
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(.white)
                    .frame(height: 120)
                    .shadow(radius: 10)
                    .padding()
            HStack {
                RingChart(progress: self.$progressValue)
                    .frame(width: 60.0, height: 60.0)
                VStack(alignment: .leading) {
                    Text("Brushing Score")
                    Text("Wie wird das berechnet?")
                }
                .padding()
                Image(systemName: "chevron.forward")
                    .font(.title)
            }
        }
    }
}

struct CircleChart_Previews: PreviewProvider {
    static var previews: some View {
        CircleChart()
    }
}

struct RingChart: View {
    @Binding var progress: CGFloat
    private let lineWidth: CGFloat = 10.0
    
    private let gradient = AngularGradient(
        gradient: Gradient(colors: [Color.cyan, .cyan.opacity(0.5)]),
        center: .center,
        startAngle: .degrees(0),
        endAngle: .degrees(180))
    
    var body: some View {
        ZStack {
            Text("\(Int(progress*100))%")
            Circle()
                .stroke(lineWidth: lineWidth)
                .foregroundColor(.gray)
                .opacity(0.2)
            Circle()
                .trim(from: 0, to: progress)
                .rotation(Angle(degrees: -80))
                .stroke(gradient, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .animation(.linear)
            
        }
    }
}
