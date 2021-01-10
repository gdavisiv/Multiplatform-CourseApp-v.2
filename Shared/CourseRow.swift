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
                .renderingMode(.template)
                //Creating a frame
                .frame(width: 48.0, height: 48.0)
                //Changes the size of the icon
                .imageScale(.medium)
                //Background Color for the SfSymbol
                .background(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                .clipShape(Circle())
                //Changes the SFSymbol Color to White
                .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
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
