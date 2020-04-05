//
//  NetworkingManager.swift
//  Amiibo
//
//  Created by Les Lariz on 2/21/20.
//  Copyright © 2020 Les R Lariz. All rights reserved.
//  Project Under Source Control 

import Foundation
import SwiftUI
import Combine

enum AmiiboType: Int, CaseIterable, Hashable, Identifiable {
	
	case figure
	case card
	case yarn
}
extension AmiiboType {
	
	var name: String {
		
		return "\(self)".map {
			$0.isUppercase ? " \($0)" : "\($0)" }.joined().capitalized
	}
	var id: AmiiboType {self}
}

	
final class NetworkingManager: ObservableObject   {
		
		@Published var  amiiboList = AmiiboAPIList( amiibo:[])
		
		@Published var selectedAmiibo: AmiiboType
		init() { self.selectedAmiibo = .figure}
}

extension NetworkingManager {
	
		func loadData() {
			
			guard let url = URL(string: "https://www.amiiboapi.com/api/amiibo/?type="+"\(selectedAmiibo)") else {  return }
			
			URLSession.shared.dataTask(with: url) { (data, _, _) in
				guard let data = data else   { return }
				let amiiboList = try! JSONDecoder().decode(AmiiboAPIList.self, from: data)
				
				DispatchQueue.main.asyncAfter(deadline: .now()) {
					self.amiiboList = amiiboList
				print("Amiibo Type: = \(self.selectedAmiibo.name)")
				}
			} .resume()
		}
	}

