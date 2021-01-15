//
//  CoursesView.swift
//  Multiplatform-CourseApp
//
//  Created by George Davis IV on 1/9/21.
//

import SwiftUI

struct CoursesView: View {
    @State var show = false
    var body: some View {
        ZStack {
            CourseItem()
                .frame(width: 335, height: 250)
            VStack {
                if show {
                    CourseItem()
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
