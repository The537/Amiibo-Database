//
//  URLImageModel.swift
//  Amiibo
//
//  Created by Les Lariz on 2/25/2020.
//  Copyright © 2020 Les R Lariz. All rights reserved.
//

import Foundation
import SwiftUI

@Observable class URlImageModel {
	var networkingManager = NetworkingManager()
	var image: UIImage?
	var urlString: String?
	var imageCache = ImageCache.getImageCache()
	
	init(urlString: String?) {
		self.urlString = urlString
		loadImage()
	}
	
	func loadImage() {
		if loadImageFromCache() {
		//	print("Cache hit")
			return
		}
		
		// print("Cache miss, loading from url")
		loadImageFromURL()
	}
	
	func loadImageFromCache() -> Bool {
		guard let urlString = urlString else {
			return false
		}
		
		guard let cacheImage = imageCache.get(forKey: urlString) else {
			return false
		}
		
		image = cacheImage
		return true
	}
		
	func loadImageFromURL() {
		
		guard let urlString = urlString else {
			return
			
		}
		
		let url = URL(string: urlString)!
		let task = URLSession.shared.dataTask(with: url, completionHandler: getImageFromResponse(data:response:error:))
		task.resume()
		
	}
	
	func getImageFromResponse(data: Data?, response: URLResponse?, error: Error?) {
		guard error == nil else {
		//	print("Error: \(error!)")
			return
		}
		guard let data = data else {
		//	print("No data found")
			return
		}
		
		DispatchQueue.main.async {
			guard let loadedImage = UIImage(data: data) else {
				return
			}
			
			self.imageCache.set(forKey: self.urlString!, image: loadedImage)
			self.image = loadedImage
		}
	}
}

class ImageCache {
	var cache = NSCache<NSString, UIImage>()
	
	func get(forKey: String) -> UIImage? {
		return cache.object(forKey: NSString(string: forKey))
	}
	
	func set(forKey: String, image: UIImage) {
		cache.setObject(image, forKey: NSString(string: forKey))
	}
}
extension ImageCache {
	private static var imageCache = ImageCache()
	static func getImageCache() -> ImageCache {
		return imageCache
	}
}
