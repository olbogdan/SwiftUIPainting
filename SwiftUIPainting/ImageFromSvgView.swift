//
//  ImageFromSvgView.swift
//  HappyBrushPainting
//
//  Created by Oleksandr Bogdanov on 03.02.22.
//

import SwiftUI

struct ImageFromSvgView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.cyan.ignoresSafeArea()
            VStack {
                VStack {
                    Text("Icon SVG from Norbert:")
                        .padding().foregroundColor(.white)
                    
                    Text("foreground color")
                    HStack {
                        Image("top-front-5")
                        Image("top-front-5")
                            .renderingMode(.template)
                            .foregroundColor(.red)
                    }
                    Text("change background color to green")
                    Image("top-front-5")
                        .background(Color.green)
                    
                    Text("can be rotated, and resized")
                    Image("top-front-5")
                        .resizable()
                        .renderingMode(.template)
                        .font(.system(size: 50, weight: .light))
                        .frame(width: 100, height: 40)
                        .rotationEffect(.degrees(-34))
                    
                    Text("Icon from SF Symbols:")
                        .padding(30).foregroundColor(.white)
                    Text("foreground color")
                }
                HStack {
                    Image(systemName: "oval")
                        .foregroundColor(.red)
                        .font(.system(size: 27, weight: .light))
                    Image(systemName: "oval")
                        .foregroundColor(.white)
                        .font(.system(size: 27, weight: .light))
                    Image(systemName: "oval")
                        .foregroundColor(.green)
                        .font(.system(size: 27, weight: .light))
                }
                VStack {
                    Text("change background color to green")
                    Image(systemName: "oval")
                        .foregroundColor(.white)
                        .font(.system(size: 27, weight: .light))
                        .background(Color.green)
                    Text("other icons from SF Symbols")
                    
                    HStack {
                        Image(systemName: "oval.tophalf.filled")
                            .foregroundColor(.white)
                            .font(.system(size: 27, weight: .light))
                        Image(systemName: "oval.bottomhalf.filled")
                            .foregroundColor(.white)
                            .font(.system(size: 27, weight: .light))
                        Image(systemName: "oval.inset.filled")
                            .foregroundColor(.white)
                            .font(.system(size: 27, weight: .light))
                        Image(systemName: "oval.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 27, weight: .light))
                        Image(systemName: "oval.portrait.righthalf.filled")
                            .foregroundColor(.white)
                            .font(.system(size: 27, weight: .light))
                        Image(systemName: "oval.portrait.lefthalf.filled")
                            .foregroundColor(.white)
                            .font(.system(size: 27, weight: .light))
                        Image(systemName: "oval.portrait")
                            .foregroundColor(.white)
                            .font(.system(size: 27, weight: .light))
                        
                        
                        
                        
                    }
                    HStack {
                        Image(systemName: "circle")
                            .foregroundColor(.white)
                            .font(.system(size: 27, weight: .light))
                        Image(systemName: "circle.tophalf.filled")
                            .foregroundColor(.white)
                            .font(.system(size: 27, weight: .light))
                        Image(systemName: "circle.bottomhalf.filled")
                            .foregroundColor(.white)
                            .font(.system(size: 27, weight: .light))
                        Image(systemName: "circle.inset.filled")
                            .foregroundColor(.white)
                            .font(.system(size: 27, weight: .light))
                        Image(systemName: "record.circle.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 27, weight: .light))
                        Image(systemName: "circle.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 27, weight: .light))
                        Image(systemName: "circle.righthalf.filled")
                            .foregroundColor(.white)
                            .font(.system(size: 27, weight: .light))
                    }
                    Text("Can be rotated and resized")
                    HStack {
                        Image(systemName: "oval.portrait")
                            .foregroundColor(.white)
                            .font(.system(size: 50, weight: .light))
                            .rotationEffect(.degrees(-34))
                    }
                }
            }
        }
        
    }
}

struct ImageFromSvgView_Previews: PreviewProvider {
    static var previews: some View {
        ImageFromSvgView()
    }
}
