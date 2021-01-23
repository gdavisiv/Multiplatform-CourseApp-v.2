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
        subtitle: "20 Sections",
        image: "Illustration 1",
        color: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
    ),
    Course(
        title: "Build a SwiftUI App for iOS 14",
        subtitle: "25 Sections",
        image: "Illustration 2",
        color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))
    ),
    Course(
        title: "UI Design for iPadOS",
        subtitle: "10 Sections",
        image: "Illustration 3",
        color: Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
    ),
    Course(
        title: "UI Design for macOS",
        subtitle: "14 Sections",
        image: "Illustration 4",
        color: Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))
    ),
    Course(
        title: "Build a SwiftUI app for iOS 13",
        subtitle: "30 Sections",
        image: "Illustration 5",
        color: Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1))
    ),
    Course(
        title: "Build a Prototype in AdobeXD",
        subtitle: "5 Sections",
        image: "Illustration 6",
        color: Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
    ),
    Course(
        title: "Learn how to Edit Video Footage with Premiere CC",
        subtitle: "40 Sections",
        image: "Illustration 7",
        color: Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))
    ),
    Course(
        title: "Edit and Design in Photoshop CC",
        subtitle: "20 Sections",
        image: "Illustration 8",
        color: Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1))
    ),
    Course(
        title: "Create Animations in After Effects CC",
        subtitle: "50 Sections",
        image: "Illustration 9",
        color: Color(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1))
    ),
    Course(
        title: "Import/Export with Media Encoder",
        subtitle: "5",
        image: "Illustration 10",
        color: Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
    ),
]
