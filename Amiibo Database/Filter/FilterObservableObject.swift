//
//  FilterObservableObject.swift
//  Amiibo Database
//
//  Created by Les Lariz on 4/24/22.
//  Copyright © 2022 Les R Lariz. All rights reserved.
//

import Foundation

class FilterObservableObject: ObservableObject {
	@Published var searchTerm = ""
	@Published var data: [AmiiboListEntry] = []
	@Published var filteredData: [AmiiboListEntry] = []
	
	init() {
		
		
		
		$searchTerm
			.map { searchTerm in
				self.data.filter { amiibo in
					
					amiibo.character.lowercased().contains(searchTerm.lowercased())
				}
				
				
			}
			.assign(to: &$filteredData)
		
	}
}
