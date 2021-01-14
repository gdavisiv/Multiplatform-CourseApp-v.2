//
//  CourseList.swift
//  Multiplatform-CourseApp
//
//  Created by George Davis IV on 1/13/21.
//

import SwiftUI

struct CourseList: View {
    @ViewBuilder
    var body: some View {
        //Makes code work on iOS Desktop Devices
        #if os(iOS)
        content
            .listStyle(InsetGroupedListStyle())
        //Code to run on iOS Desktop Devices
        #else
        content
            .frame(minWidth: 800, minHeight: 600)
        #endif
    }
    //Create a mini component
    var content: some View {
        //Creating a Simple List that iterates 20 times.
        //Calling CourseRow()
        List(0 ..< 20) { item in
            CourseRow()
        }
        //Gives content with a title Above it
        .navigationTitle("Courses")
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}
