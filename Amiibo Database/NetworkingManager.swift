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

@Observable class NetworkingManager {
	
	var  amiiboList = AmiiboAPIList( amiibo:[])
	
	enum AmiiboError: Error {
		case invalidURL
		case invalidResponse
		case invalidData
	}

	

}

extension NetworkingManager {
	
	
	func loadFigures() async throws -> AmiiboAPIList {
		guard let url = URL(string: "https://www.amiiboapi.com/api/amiibo/?type=figure") else {
			throw  AmiiboError.invalidURL
			
		}
		
		let (data, response) = try await URLSession.shared.data(from: url)
		
		guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
			throw AmiiboError.invalidResponse
		}
		do {
			let decoder = JSONDecoder()
			return try decoder.decode(AmiiboAPIList.self, from: data)
			
			
		} catch {
			throw  AmiiboError.invalidData
		}
	}
	
	func loadCards() async throws -> AmiiboAPIList {
		guard let url = URL(string: "https://www.amiiboapi.com/api/amiibo/?type=card") else {
			throw  AmiiboError.invalidURL
			
		}
		
		let (data, response) = try await URLSession.shared.data(from: url)
		
		guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
			throw AmiiboError.invalidResponse
		}
		do {
			let decoder = JSONDecoder()
			return try decoder.decode(AmiiboAPIList.self, from: data)
		} catch {
			throw  AmiiboError.invalidData
		}
		
	}
	func loadYarn() async throws -> AmiiboAPIList {
		guard let url = URL(string: "https://www.amiiboapi.com/api/amiibo/?type=yarn") else {
			throw  AmiiboError.invalidURL
			
		}
		
		let (data, response) = try await URLSession.shared.data(from: url)
		
		guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
			
			throw AmiiboError.invalidResponse
		}
		do {
			let decoder = JSONDecoder()
			return try decoder.decode(AmiiboAPIList.self, from: data)
			
			
		} catch {
			throw  AmiiboError.invalidData
		}
	}
}
