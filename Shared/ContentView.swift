//
//  ContentView.swift
//  Shared
//
//  Created by George Davis IV on 1/6/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 4.0){
            Image("Illustration 1")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("SwiftUI for iOS 14").fontWeight(.bold)
            Text("20 Sections").font(.footnote)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
    }
}
