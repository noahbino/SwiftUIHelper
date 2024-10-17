//
//  CacheAsyncImage.swift
//  SwiftUIHelper
//
//  Created by Noah Iarrobino on 10/17/24.
//

import Foundation
import SwiftUI

class ImageCache {
    static let shared: ImageCache = .init()
    private var cache = NSCache<NSURL, UIImage>()
    
    func getImage(for url: URL) -> UIImage? {
        cache.object(forKey: url as NSURL)
    }
    
    func setImage(_ image: UIImage, for url: URL) {
        cache.setObject(image, forKey: url as NSURL)
    }
}

public struct AsyncImageView: View {
    @State private var image: UIImage? = nil
    @State private var isLoading: Bool = false
    
    let url: URL
    let aspectRatio: ContentMode
    
    public init(url: URL, aspectRatio: ContentMode) {
        self.url = url
        self.aspectRatio = aspectRatio
    }
    
    public var body: some View {
        Group {
            if let image: UIImage = self.image {
                imageView(image: image)
            } else if isLoading {
                SwiftUI.ProgressView()
            } else {
                errorView
            }
        }
        .onAppear {
            loadImage()
        }
    }
    
    private func imageView(image: UIImage) -> some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: aspectRatio)
    }
    
    private var errorView: some View {
        Button {
            loadImage()
        } label: {
            VStack {
                Text("An error occurred")
                Text("Tap to reload")
                    .font(.footnote)
            }
        }
    }
    
    private func loadImage() {
        if let cachedImage: UIImage = ImageCache.shared.getImage(for: url) {
            self.image = cachedImage
        } else {
            Task {
                isLoading = true
                
                do {
                    let fetchedImage: UIImage = try await downloadImage(from: url)
                    self.image = fetchedImage
                    ImageCache.shared.setImage(fetchedImage, for: url)
                } catch { }
                isLoading = false
            }
        }
    }
    
    private func downloadImage(from url: URL) async throws -> UIImage {
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let uiImage = UIImage(data: data) else { throw URLError(.badServerResponse) }
        return uiImage
    }
}
