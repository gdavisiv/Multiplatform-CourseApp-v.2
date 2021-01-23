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
    
    var body: some View {
        VStack {
            ScrollView {
                //Pass selectedItem into course
                CourseItem(course: course)
                    .matchedGeometryEffect(id: course.id, in: namespace)
                    .frame(height: 300)
                    //We need the second TapGesture so that we can move back once the card is clicked on to be opened
                VStack {
                    //Repeats CourseRow 20X
                    ForEach(courseSections) { item in
                        //Passing the Data through the component CourseRow()
                        CourseRow(item: item)
                        //Adds a divider through each item
                        Divider()
                    }
                }
                .padding()
            }
        }
        .background(Color("Background 1"))
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .matchedGeometryEffect(id: "container\(course.id)", in: namespace)
        //Create a transition with a define spring delay
        .edgesIgnoringSafeArea(.all)
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
