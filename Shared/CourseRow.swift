//
//  CourseRow.swift
//  Multiplatform-CourseApp
//
//  Created by George Davis IV on 1/9/21.
//

import SwiftUI

struct CourseRow: View {
    var body: some View {

        HStack(alignment: .top) {
            //Pulling in SFSymbol Icon
            Image(systemName: "paperplane.circle.fill")
                //Allows use of the multicolor option
                .renderingMode(.original)
                //Changes the size of the icon
                .imageScale(.medium)
            VStack(alignment: .leading, spacing: 4.0) {
                Text("SwiftUI")
                    //Sets the font as a subheading
                    .font(.subheadline)
                    .bold()
                Text("Description")
                    //Sets the font as footnote
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }
        //This will **Over-ride** the use of 'imageScale(.large)'
        //Will change font weight + StrokeWidth
        //.font(.system(size: 34, weight: .light, design: .rounded))

    }
}

struct CourseRow_Previews: PreviewProvider {
    static var previews: some View {
        CourseRow()
    }
}
