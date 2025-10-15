//
//  Wlmt_toggle.swift
//  SwiftUI_Oct15
//
//  Created by Koushik Reddy Kambham on 10/15/25.
//

import SwiftUI

struct Item: Hashable {
    var id: Int
    var isSelected: Bool = false
}

struct Wlmt: View {

    @State private var items: [Item] = (1...20).map { Item(id: $0) }

    var body: some View {
        List(items, id: \.id) { item in
            Text(item.isSelected ? "Hello selected \(item.id)" : "\(item.id)")
                .padding()
                .cornerRadius(10)
                .onTapGesture {
                    if let index = items.firstIndex(where: { $0.id == item.id }) {
                        items[index].isSelected.toggle()
                    }
                }
        }
    }
}

#Preview {
    Wlmt()
}
