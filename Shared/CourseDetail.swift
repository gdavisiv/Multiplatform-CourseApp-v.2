//
//  CourseDetail.swift
//  Multiplatform-CourseApp
//
//  Created by George Davis IV on 1/19/21.
//

import SwiftUI

struct CourseDetail: View {
    
    var course: Course = courses[0]
    var namespace: Namespace.ID
    #if os(iOS)
    //Sets a new corner radius 22 for iOS
    var cornerRadius: CGFloat = 10
    #else
    //Set macOS to corner radius of 10
    var cornerRadius: CGFloat = 0
    #endif
    @State var showModal = false
    
    var body: some View {
        #if os(iOS)
        //Reference this in the body with 'var content: some View'
        content
        //Create a transition with a define spring delay
        .edgesIgnoringSafeArea(.all)
        
        #else
        content
        
        #endif
    }
    
    var content: some View {
        VStack {
            ScrollView {
                //Pass selectedItem into course
                CourseItem(course: course, cornerRadius: 0)
                    .matchedGeometryEffect(id: course.id, in: namespace)
                    .frame(height: 300)
                    //We need the second TapGesture so that we can move back once the card is clicked on to be opened
                VStack {
                    //Repeats CourseRow 20X
                    ForEach(courseSections) { item in
                        //Passing the Data through the component CourseRow()
                        CourseRow(item: item)
                            .sheet(isPresented: $showModal) {
                                CourseList()
                            }
                            //Set the action
                            .onTapGesture {
                                showModal = true
                            }
                        //Adds a divider through each item
                        Divider()
                    }
                }
                .padding()
            }
        }
        .background(Color("Background 1"))
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .matchedGeometryEffect(id: "container\(course.id)", in: namespace)
    }
}

struct CourseDetail_Previews: PreviewProvider {
    //To create an isolated view
    //Created static variable Namespace
    @Namespace static var namespace
    static var previews: some View {
        //Passed in namespace
        CourseDetail(namespace: namespace)
    }
}
