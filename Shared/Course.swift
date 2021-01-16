//
//  Course.swift
//  Multiplatform-CourseApp
//
//  Created by George Davis IV on 1/15/21.
//

import SwiftUI

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var image: String
    var color: Color
}

var courses = [
    Course(
        title: "UI Design for iOS14",
        subtitle: "",
        image: "",
        color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
    ),
    Course(
        title: "",
        subtitle: "",
        image: "",
        color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
    ),
    Course(
        title: "",
        subtitle: "",
        image: "",
        color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
    ),
    Course(
        title: "",
        subtitle: "",
        image: "",
        color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
    ),
    Course(
        title: "",
        subtitle: "",
        image: "",
        color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
    ),
    Course(
        title: "",
        subtitle: "",
        image: "",
        color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
    ),
    Course(
        title: "",
        subtitle: "",
        image: "",
        color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
    )
]
