//
//  CourseSectionDetail.swift
//  Multiplatform-CourseApp
//
//  Created by George Davis IV on 2/7/21.
//

import SwiftUI

struct CourseSectionDetail: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView {
                CourseItem(cornerRadius: 0)
                    .frame(height: 300)
            }
            
            CloseButton()
        }
    }
}

struct CourseSectionDetail_Previews: PreviewProvider {
    static var previews: some View {
        CourseSectionDetail()
    }
}
