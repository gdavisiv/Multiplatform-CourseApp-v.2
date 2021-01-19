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
            
            
            //If selectedItem is not nil
            //Creates Full Screen Mode
            if selectedItem != nil {
                ZStack(alignment: .topTrailing) {
                    VStack {
                        ScrollView {
                            //Pass selectedItem into CourseItem with '!' because it will not be empty
                            CourseItem(course: selectedItem!)
                                .matchedGeometryEffect(id: selectedItem!.id, in: namespace)
                                .frame(height: 300)
                                //We need the second TapGesture so that we can move back once the card is clicked on to be opened
                            VStack {
                                //Repeats CourseRow 20X
                                ForEach(0 ..< 20) { item in
                                    CourseRow()
                                }
                            }
                            .padding()
                        }
                    }
                    .background(Color("Background 1"))
                    .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                    //Creating another
                    .matchedGeometryEffect(id: "container\(selectedItem!.id)", in: namespace)
                    //Create a transition with a define spring delay
                    .edgesIgnoringSafeArea(.all)
                    
                    CloseButton()
                        .padding(.all, 10)
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
            }
        }
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
