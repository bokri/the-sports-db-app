//
//  CacheImageView.swift
//  TheSportsDBApp
//
//  Created by Aymen Bokri on 12/11/2023.
//

import SwiftUI
import Kingfisher

/**
 A SwiftUI view for displaying an image from a given URL with Kingfisher integration.

 The `CacheImageView` is a SwiftUI view designed for displaying images fetched from a remote URL using the Kingfisher library. It supports loading indicators, resizable images, and customizable placeholders for smooth image rendering.

 - Note: This view uses the Kingfisher library for image loading and caching. Make sure to add Kingfisher to your project for proper functionality.

 # Parameters:
 - `imageURL`: The URL of the image to be displayed.
 - `width`: The optional maximum width of the image view. If not provided, it defaults to the maximum available width.
 - `height`: The height of the image view.

 # See Also:
 - `KFImage`: Kingfisher's SwiftUI view for image loading.
 - `ProgressView`: A SwiftUI view for showing loading progress.
 - `Logger`: A logging utility for handling errors or issues.

 For more information on using Kingfisher with SwiftUI and customization options, refer to the Kingfisher documentation.

 */
public struct CacheImageView: View {
    
    // MARK: - Properties

    let imageURL: String
    let width: CGFloat?
    let height: CGFloat
    
    // MARK: - Constructors
    
    /**
     Initializes a `PosterImageView` with the specified parameters.
     
     - Parameters:
     - imageURL: The URL of the image to be displayed.
     - width: The optional maximum width of the image view. If not provided, it defaults to the maximum available width.
     - height: The height of the image view.
     */
    public init(imageURL: String, width: CGFloat? = nil, height: CGFloat) {
        self.imageURL = imageURL
        self.width = width
        self.height = height
    }
    
    // MARK: - SwiftUI
    
    public var body: some View {
        KFImage(URL(string: imageURL))
            .placeholder {
                ProgressView()
            }
            .resizable()
            .onSuccess { _ in }
            .onFailure { error in
                Logger.warning("Image download failed with error: \(error)")
            }
            .frame(maxWidth: width ?? .infinity, maxHeight: height)
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
    }
}

#Preview {
    let imageUrl = "https://www.thesportsdb.com/images/media/team/badge/uyhbfe1612467038.png"
    return CacheImageView(imageURL: imageUrl, width: 80, height: 120)
}
