//
//  FigureView.swift
//  Amiibo Database
//
//  Created by Les Lariz on 4/5/2020.
//  Copyright © 2020 Les R Lariz. All rights reserved.
//

import SwiftUI

struct FigureView: View {
	@ObservedObject var networkingManager: NetworkingManager = NetworkingManager()
	@ObservedObject var urlImageModel: URlImageModel
	@ObservedObject var amiibos = ReleaseDateModel(amiibo: amiibo1)
	@State private  var searchTerm = ""
	
	init(urlString: String? ,amiibos: ReleaseDateModel) {
		urlImageModel = URlImageModel(urlString: urlString)
		self.amiibos = amiibos
		self.urlImageModel = URlImageModel(urlString: urlString)
		UISegmentedControl.appearance().selectedSegmentTintColor = .systemGreen
		UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
		UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.systemGreen], for: .normal)
		UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "SuperMarioGalaxy", size: 20)!]
	}
	
	var body: some View {
		
		NavigationView {
			
			VStack  {
				
				Divider()
				Text("Number of Figures = \(filteredAmiibo.count)")
					.fontWeight(.heavy)
				Divider()
				
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
						.id(UUID())
						.animation(.default , value: searchTerm)
						.searchable(text: $searchTerm,prompt: "Filter by Character:")
				}.listStyle(InsetGroupedListStyle())
				
			}.navigationBarColor(.systemGreen)
			
			
			
		}.onAppear( perform: networkingManager.loadFigures)
	
		
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

