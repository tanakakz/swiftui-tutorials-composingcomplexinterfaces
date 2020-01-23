//
//  Home.swift
//  Landmarks
//
//  Created by tkz on 2020/01/23.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    var body: some View {
        NavigationView {
            Text("Landmarks Content")
                .navigationBarTitle(Text("Featured"))
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
