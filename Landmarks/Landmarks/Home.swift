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
    
    var body: some View {
        // 画面遷移対応ビューとして、立地カテゴリのリストを表示する
        NavigationView {
            List {
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
            }
            .navigationBarTitle(Text("Featured"))
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
