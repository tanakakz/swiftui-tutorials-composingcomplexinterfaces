//
//  Home.swift
//  Landmarks
//
//  Created by tkz on 2020/01/23.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    // ランドマークの辞書配列を用意する
    // 立地カテゴリ名をkey、同key項目でグルーピングした立地リストをvalueとして初期化する
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarkData, // グルーピング対象データを指定
            by: { $0.category.rawValue } // キーに用いる項目を指定
        )
    }
    
    var featured: [Landmark] {
        landmarkData.filter { $0.isFeatured }
    }
    
    var body: some View {
        // 画面遷移対応ビューとして、立地カテゴリのリストを表示する
        NavigationView {
            List {
                FeaturedLandmarks(landmarks: featured)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationBarTitle(Text("Featured"))
        }
    }
}

struct FeaturedLandmarks: View {
    var landmarks: [Landmark]
    var body: some View {
        landmarks[0].image.resizable()
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
