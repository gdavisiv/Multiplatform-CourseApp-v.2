//
//  CoursesView.swift
//  Multiplatform-CourseApp
//
//  Created by George Davis IV on 1/9/21.
//

import SwiftUI

struct CoursesView: View {
    @State var show = false
    //Set a collection of match elementsNeed to create namespace to work wiht matchedGeometryEffect
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            CourseItem()
                //Allows to animate shared elements between two views
                .matchedGeometryEffect(id: "Card", in: namespace)
                .frame(width: 335, height: 250)
            VStack {
                if show {
                    CourseItem()
                        .matchedGeometryEffect(id: "Card", in: namespace)
                        .transition(.scale)
                        .edgesIgnoringSafeArea(.all)
                }
            }
        }
        .onTapGesture {
            withAnimation(.spring()) {
                //everytime you tap on the card it will switch between true/false
                show.toggle()
            }
        }
        //.animation(.spring())
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
