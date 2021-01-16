//
//  CoursesView.swift
//  Multiplatform-CourseApp
//
//  Created by George Davis IV on 1/9/21.
//

import SwiftUI

struct CoursesView: View {
    @State var show = false
    //Set a collection of match elementsNeed
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 20) {
                    CourseItem()
                        //Allows to animate shared elements between two views
                        //!show is false because we have to make it true
                        .matchedGeometryEffect(id: "Card", in: namespace, isSource: !show)
                        .frame(width: 335, height: 250)
                    
                    CourseItem()
                        .frame(width: 335, height: 250)
                }
                .frame(maxWidth: .infinity)
            }
            
            if show {
                ScrollView {
                    CourseItem()
                        .matchedGeometryEffect(id: "Card", in: namespace)
                        .frame(height: 300)
                    VStack {
                        //Repeats CourseRow 20X
                        ForEach(0 ..< 20) { item in
                            CourseRow()
                        }
                    }
                    .padding()
                }
                .background(Color("Background 1"))
                //Create a transition with a define spring delay
                .transition(
                    .asymmetric(
                        insertion: AnyTransition
                                    //What kind of transition is it -> opacity
                                    .opacity
                                    //spring animation with delay
                                    .animation(Animation.spring()
                                                //Adds .3 sec delay
                                                .delay(0.3)),
                        removal: AnyTransition
                            .opacity
                            .animation(.spring()))
                    )
                .edgesIgnoringSafeArea(.all)
            }
        }
        .onTapGesture {
            withAnimation(.spring()) {
                //everytime you tap on the card it will switch between true/false
                show.toggle()
            }
        }
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
