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
            //Set Platform Condition
            #if os(iOS)
            content
                .navigationBarHidden(true)
            fullContent
                //Implmented the background blur to background items
                //Set a custom Blur style
                .background(VisualEffectBlur(blurStyle: .systemMaterial).edgesIgnoringSafeArea(.all))
            
            #else
            content
            fullContent
                //Implmented the background blur to background items
                .background(VisualEffectBlur().edgesIgnoringSafeArea(.all))
            
            #endif
        }
        .navigationTitle("Courses")
    }
    
    var content: some View {
        ScrollView {
            //Lazy Grid Allows you to implement columns that will adapt to different screen sizes
            //It will try to fit as many columns as possible with a minimum width of 100
            //Depending on the size of the screen
            LazyVGrid(
                columns:
                    //Array(repeating: .init(.flexible(), spacing: 16), count: 2),
                    [
                    GridItem(.adaptive(minimum: 160), spacing: 16)
                    //GridItem(.adaptive(minimum: 160), spacing: 16)
                    ],
                    spacing: 16
            ) {
                ForEach(courses) { item in
                    VStack {
                        CourseItem(course: item)
                            //Allows to animate shared elements between two views
                            //!show is false because we have to make it true
                            .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                            .frame(height: 200)
                            .onTapGesture {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0)) {
                                    //everytime you tap on the card it will switch between true/false
                                    show.toggle()
                                    selectedItem = item
                                    isDisabled = true
                                }
                            }
                            //Once you tap a card, you can't tap on others
                            .disabled(isDisabled)
                    }
                    //Creating a container with its own ID
                    //"container\(item.id)" allows to combine a string & variable
                    .matchedGeometryEffect(id: "container\(item.id)", in: namespace, isSource: !show)
                }
                
            }
            .padding(16)
            .frame(maxWidth: .infinity)
        }
        //Ensures that the course info does not animated away behind the rest of the cards
        .zIndex(1)
    }
    
    
    @ViewBuilder
    var fullContent: some View{
        //If selectedItem is not nil
        //Creates Full Screen Mode
        if selectedItem != nil {
            ZStack(alignment: .topTrailing) {
                //Passed in the coursem and the namespace
                CourseDetail(course: selectedItem!, namespace: namespace)
                
                CloseButton()
                    .padding(16)
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
            }
            .zIndex(2)
            .frame(maxWidth: 712)
            //Created a new frame that is set to infinish
            .frame(maxWidth: .infinity)
            //Implmented the background blur to background items
            .background(VisualEffectBlur().edgesIgnoringSafeArea(.all))
        }
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
