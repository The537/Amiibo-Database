//
//  YarnView.swift
//  Amiibo Database
//
//  Created by Les Lariz on 4/5/20.
//  Copyright © 2020 Les R Lariz. All rights reserved.
//

import SwiftUI

struct YarnView: View {
		@ObservedObject var networkingManager: NetworkingManager = NetworkingManager()
		@ObservedObject var urlImageModel: URlImageModel
		@ObservedObject var amiibos = ReleaseDateModel(amiibo: amiibo1)

	
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
					
					Divider()
					Text("Number of Yarn Figures = \(filteredAmiibo.count)")
						.fontWeight(.heavy)
					Divider()
					
					VStack {
						
						List(networkingManager.amiiboList.amiibo, id: \.tail ) { amiibos in
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
					}.listStyle(InsetGroupedListStyle()) 
				}.navigationBarColor(.systemBlue)					
			}.onAppear( perform: networkingManager.loadYarn)
				
		}
	var filteredAmiibo: [AmiiboListEntry] {
		return networkingManager.amiiboList.amiibo
	}
}

struct YarnView_Previews: PreviewProvider {
    static var previews: some View {
        YarnView(urlString: nil ,amiibos: ReleaseDateModel(amiibo: amiibo1))
    }
}
