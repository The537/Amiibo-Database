//
//  FilterObservableObject.swift
//  Amiibo Database
//
//  Created by Les Lariz on 4/24/22.
//  Copyright © 2022 Les R Lariz. All rights reserved.
//

import Foundation

class FilterObservableObject: ObservableObject {
	@Published var data: [AmiiboListEntry] = []
	@Published var filterResults: [AmiiboListEntry] = []
}
