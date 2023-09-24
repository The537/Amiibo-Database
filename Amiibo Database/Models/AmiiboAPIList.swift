//
//  AmiiboAPIList.swift
//  Amiibo
//
//  Created by Les Lariz on 2/21/2020.
//  Copyright © 2020 Les R Lariz. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct  AmiiboAPIList:   Codable {
	
	var amiibo: [AmiiboListEntry]
	
	init(amiibo: [AmiiboListEntry]) {
        self.amiibo = amiibo
    }
	

}
struct AmiiboListEntry:   Codable {
	
	let amiiboSeries: String
	let character: String
	let gameSeries: String
	let head: String
	let image: String
	let name: String
	let release: Release
	let tail: String
	let type: String
}

struct  Release: Codable {
	
	let au: String?
	let eu: String?
	let jp: String?
	let na: String?
}
