//
//  ReleaseDateModel.swift
//  Amiibo
//
//  Created by Les Lariz on 3/17/2020.
//  Copyright © 2020 Les R Lariz. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine
import Observation

@Observable class ReleaseDateModel: ObservableObject, Identifiable {
	let amiibos: AmiiboListEntry
	
	 var networkingManager: NetworkingManager = NetworkingManager()
	 var image: Image = Image("Mario")
	
	init(amiibo: AmiiboListEntry) {
		self.amiibos = amiibo
		
	}
	var imageURL: URL? {
		URL(string: self.amiibos.image)
	}
	var amiiboSeries: String {
		self.amiibos.amiiboSeries
	}
	
	var character: String {
		self.amiibos.character
	}
	
	var gameSeries: String {
		self.amiibos.gameSeries
	}
	
	var type: String {
		self.amiibos.type
	}
	var releaseAU: Date? {
		if let release = self.amiibos.release.au {
			return self.dateFormatter.date(from: release)
		}
		
		
		return nil
	}
	
	var releaseEU: Date? {
		if let release = self.amiibos.release.eu {
			return self.dateFormatter.date(from: release)
			
		}
		return nil
	}
	
	var releaseJP: Date? {
		if let release = self.amiibos.release.jp {
			return self.dateFormatter.date(from: release)
		}
		return nil
	}
	
	var releaseNA: Date? {
		if let release = self.amiibos.release.na {
			return self.dateFormatter.date(from: release)
		}
		return nil
	}
	
}
// MARK: date formatter
extension ReleaseDateModel {
	
	private var dateFormatter: DateFormatter {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		return dateFormatter
	}
	
}

// MARK: extension Date
extension Date {
	
	func toString(dateFormat format: String) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = format
		return dateFormatter.string(from: self)
	}
}


