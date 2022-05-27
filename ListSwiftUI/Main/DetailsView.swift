//
//  DetailsView.swift
//  ListSwiftUI
//
//  Created by heba on 27/05/2022.
//

import SwiftUI

struct DetailsView: View {
    
    let item: ListItem
    
    var body: some View {
        VStack(alignment: .center) {
            Text(item.name)
                .font(.title)
            
            RemoteImageView(urlString: item.imageUrls.first ?? "")
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            HStack {
                Text("Created:\(item.createdAt)")
                Spacer()
                Text(item.price)
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
        }
        .padding()
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let item = ListItem.init(createdAt: "2022-05-26", price: "0 AED", name: "Somthing", uid: "1000", imageIDS: [], imageUrls: [], imageUrlsThumbnails: [])
        DetailsView(item: item)
    }
}
