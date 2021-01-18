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
    //State to check if there is a selected item, but default it will be empty/zero
    @State var selectedItem: Course? = nil
    //Transition out once the card is opened
    @State var isDisabled = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(courses) { item in
                        CourseItem(course: item)
                            //Allows to animate shared elements between two views
                            //!show is false because we have to make it true
                            .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                            .frame(width: 335, height: 250)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    //everytime you tap on the card it will switch between true/false
                                    show.toggle()
                                    selectedItem = item
                                    isDisabled = true
                                }
                            }
                            //Once you tap a card, you can't tap on others
                            .disabled(isDisabled)
                    }
                    
                }
                .frame(maxWidth: .infinity)
            }
            //If selectedItem is not nil
            if selectedItem != nil {
                ScrollView {
                    //Pass selectedItem into CourseItem with '!' because it will not be empty
                    CourseItem(course: selectedItem!)
                        .matchedGeometryEffect(id: selectedItem!.id, in: namespace)
                        .frame(height: 300)
                        //We need the second TapGesture so that we can move back once the card is clicked on to be opened
                        .onTapGesture {
                            withAnimation(.spring()) {
                                //everytime you tap on the card it will switch between true/false
                                show.toggle()
                                selectedItem = nil
                                //DispatchQueue allows a delay in after the click of the card 
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    isDisabled = false
                                }
                            }
                        }
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
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
