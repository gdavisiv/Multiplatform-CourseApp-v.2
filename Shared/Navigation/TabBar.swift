//
//  TabBar.swift
//  Multiplatform-CourseApp (iOS)
//
//  Created by George Davis IV on 1/25/21.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView() {
            NavigationView {
                CoursesView()
        }
            .tabItem {
                Image(systemName: "book.closed")
                Text("Courses")
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
