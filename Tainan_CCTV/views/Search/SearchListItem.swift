//
//  SearchListItem.swift
//  Tainan_CCTV
//
//  Created by Voss CG on 2024/8/2.
//

import SwiftUI

struct SearchListItem: View {
    
    var title: String
    var isSelected: Bool
    
    var body: some View {
        HStack {
            
            Text(title)
            
            Spacer()
            
            if isSelected {
                Image(systemName: "checkmark.seal")
                    .foregroundColor(.accentColor)
            }
        }
    }
}

#Preview {
    SearchListItem(title: "item name", isSelected: true)
}
