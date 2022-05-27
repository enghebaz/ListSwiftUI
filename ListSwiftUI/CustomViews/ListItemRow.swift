
//
//  ListItemRow.swift
//  ListSwiftUI
//
//  Created by Heba on 26/05/2022.
//

import SwiftUI

struct ListItemRow: View {
    let item: ListItem
    var body: some View {
        HStack (spacing: 12) {
            RemoteImageView.init(urlString: item.imageUrlsThumbnails.first ?? "").frame(width:50, height:50).clipShape(Circle())
            Text(item.name)
        }
        .padding(4)
        
    }
}

struct ListItemRow_Previews: PreviewProvider {
    static var previews: some View {
        let item = ListItem.init(createdAt: "2022-05-26", price: "0 AED", name: "Somthing", uid: "1000", imageIDS: [], imageUrls: [], imageUrlsThumbnails: [])
        ListItemRow(item: item)
    }
}
