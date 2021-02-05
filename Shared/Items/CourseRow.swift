//
//  CourseRow.swift
//  Multiplatform-CourseApp
//
//  Created by George Davis IV on 1/9/21.
//

import SwiftUI

struct CourseRow: View {
    
    var item: CourseSection = courseSections[0]
    
    var body: some View {

        HStack(alignment: .top) {
            //Pulling in SFSymbol Icon
            Image(item.logo)
                //Allows use of the original colors
                .renderingMode(.original)
                //Creating a frame
                .frame(width: 48.0, height: 48.0)
                //Changes the size of the icon
                .imageScale(.medium)
                //Background Color for the item.logo
                .background(item.color)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 4.0) {
                Text(item.title)
                    //Sets the font as a subheading
                    .font(.subheadline)
                    .bold()
                    //Sets system Color
                    .foregroundColor(.primary)
                Text(item.subtitle)
                    //Sets the font as footnote
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
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
