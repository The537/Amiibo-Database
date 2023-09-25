//
//  FigureView.swift
//  Amiibo Database
//
//  Created by Les Lariz on 4/5/2020.
//  Copyright © 2020 Les R Lariz. All rights reserved.
//

import SwiftUI

struct FigureView: View {
	var networkingManager: NetworkingManager = NetworkingManager()
	var urlImageModel: URlImageModel
	var amiibos = ReleaseDateModel(amiibo: amiibo1)
	@State private var searchTerm = ""
	
	init(urlString: String? ,amiibos: ReleaseDateModel) {
		urlImageModel = URlImageModel(urlString: urlString)
		self.amiibos = amiibos
		self.urlImageModel = URlImageModel(urlString: urlString)
		UISegmentedControl.appearance().selectedSegmentTintColor = .systemGreen
		UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
		UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.systemGreen], for: .normal)
	}
	
	var body: some View {
		
		NavigationView {
			
			VStack  {
				
				VStack {
					
					List(filteredAmiibo , id: \.tail ) { amiibos in
						NavigationLink(destination: AmiiboDetailView(urlString: amiibos.image, amiibos: ReleaseDateModel(amiibo: amiibos))) {
							
							HStack {
								
								UrlImageView(urlString: amiibos.image)
								HStack(alignment: .center) {
									VStack(alignment: .trailing) {
										Text("Amiibo Series:")
											.font(.custom( "SuperMarioGalaxy", size: 8))
											.fontWeight(.heavy)
										Text("Game Series:")
											.font(.custom( "SuperMarioGalaxy", size: 8))
											.fontWeight(.heavy)
										Text("Character:")
											.font(.custom( "SuperMarioGalaxy", size: 8))
											.fontWeight(.heavy)
										Text("Type:")
											.font(.custom( "SuperMarioGalaxy", size: 8))
											.fontWeight(.heavy)
										
									}
									
									VStack(alignment: .leading) {
										Text (amiibos.amiiboSeries)
											.font(.custom( "SuperMarioGalaxy", size: 8))
											.fontWeight(.heavy)
										Text(amiibos.gameSeries)
											.font(.custom( "SuperMarioGalaxy", size: 8))
											.fontWeight(.heavy)
										Text(amiibos.character)
											.font(.custom( "SuperMarioGalaxy", size: 8))
											.fontWeight(.heavy)
										Text(amiibos.type)
											.font(.custom( "SuperMarioGalaxy", size: 8))
											.fontWeight(.heavy)
										
									}
								}
							}
						}
					}.navigationBarTitle("Amiibo Database",displayMode:  .inline )
									Divider()
									Text("Number of Figures = \(filteredAmiibo.count)")
										.fontWeight(.heavy)
									Divider()
						.id(UUID())
						.animation(.default , value: searchTerm)
						.searchable(text: $searchTerm, prompt: "Filter by Character:")
				}.listStyle(InsetGroupedListStyle())
			}.navigationBarColor(.systemRed)
			
				.task {
					do {
						
					networkingManager.amiiboList = try await networkingManager.loadFigures()
						
					} catch AmiiboError.invalidURL {
						print("Invalid URL")
					} catch AmiiboError.invalidResponse {
						print ("Invalid Response")
					} catch AmiiboError.invalidData {
						print ("Invalid Data")
					} catch {
						print ("Unexpected Error")
					}
				}

		}
		
		var filteredAmiibo: [AmiiboListEntry] {
			if searchTerm.isEmpty {
				return networkingManager.amiiboList.amiibo
			} else {
				return networkingManager.amiiboList.amiibo.filter {
					$0.character.localizedCaseInsensitiveContains(searchTerm) }
				
			}
			
		}
		
	}
	struct FigureView_Previews: PreviewProvider {
		static var previews: some View {
			FigureView(urlString: nil ,amiibos: ReleaseDateModel(amiibo: amiibo1))
		}
	}
	enum AmiiboError: Error {
		case invalidURL
		case invalidResponse
		case invalidData
	}
	
}


