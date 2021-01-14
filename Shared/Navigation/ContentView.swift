//
//  ContentView.swift
//  Shared
//
//  Created by George Davis IV on 1/6/21.
//

import SwiftUI

struct ContentView: View {
    @ViewBuilder
    var body: some View {
        #if os(iOS)
        SideBar()
        #else
        SideBar()
            .frame(minWidth: 1000, minHeight: 600)
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //Creates a second Contentview for Prototyping Purposes
        //ContentView()
            //Changes the second Previews height to specific dimensions
            //.previewLayout(.fixed(width: 200.0, height: 200.0))
            //Enables Dark Mode
            //.preferredColorScheme(.dark)
    }
}
