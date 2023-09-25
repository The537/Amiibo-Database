//
//  NetworkingManager.swift
//  Amiibo
//
//  Created by Les Lariz on 2/21/2020.
//  Copyright © 2020 Les R Lariz. All rights reserved.
//  Project Under Source Control 

import Foundation
import SwiftUI
import Combine

@Observable final class NetworkingManager{
	
	var  amiiboList = AmiiboAPIList( amiibo:[])
}

extension NetworkingManager {
	
	func loadFigures() {
		
		guard let url = URL(string: "https://www.amiiboapi.com/api/amiibo/?type=figure") else {  return }
		
		URLSession.shared.dataTask(with: url) { (data, _, _) in
			guard let data = data else   { return }
			let amiiboList = try! JSONDecoder().decode(AmiiboAPIList.self, from: data)
			
			DispatchQueue.main.asyncAfter(deadline: .now()) {
				self.amiiboList = amiiboList
		
			}
		} .resume()
	}
	func loadCards() {
		
		guard let url = URL(string: "https://www.amiiboapi.com/api/amiibo/?type=card") else {  return }
		
		URLSession.shared.dataTask(with: url) { (data, _, _) in
			guard let data = data else   { return }
			let amiiboList = try! JSONDecoder().decode(AmiiboAPIList.self, from: data)
			
			DispatchQueue.main.asyncAfter(deadline: .now()) {
				self.amiiboList = amiiboList

			}
		} .resume()
	}
	func loadYarn() {
		
		guard let url = URL(string: "https://www.amiiboapi.com/api/amiibo/?type=yarn") else {  return }
		
		URLSession.shared.dataTask(with: url) { (data, _, _) in
			guard let data = data else   { return }
			let amiiboList = try! JSONDecoder().decode(AmiiboAPIList.self, from: data)
			
			DispatchQueue.main.asyncAfter(deadline: .now()) {
				self.amiiboList = amiiboList
		
			}
		} .resume()
	}
	
}

