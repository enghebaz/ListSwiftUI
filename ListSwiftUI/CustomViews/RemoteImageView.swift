//
//  RemoteImageView.swift
//  ListSwiftUI
//
//  Created by Heba on 27/05/2022.
//

import Foundation
import SwiftUI

struct RemoteImageView: View {
    var urlString: String
    @ObservedObject var imageLoader = ImageLoaderService()
    @State var image: UIImage = UIImage()
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .onReceive(imageLoader.$image) { image in
                self.image = image
            }
            .onAppear {
                self.image = UIImage(named: "Placeholder")!
                imageLoader.loadImage(for: urlString)
            }
    }
}
