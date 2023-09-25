//
//  AmiiboDetailView.swift
//  Amiibo
//
//  Created by Les Lariz on 2/26/2020.
//  Copyright © 2020 Les R Lariz. All rights reserved.
//

import SwiftUI


struct AmiiboDetailView: View {
	
	
	var networkingManager = NetworkingManager()
	var urlImageModel: URlImageModel
	var amiibos = ReleaseDateModel(amiibo: amiibo1)
	
	
	init(urlString: String? ,amiibos: ReleaseDateModel) {
		urlImageModel = URlImageModel(urlString: urlString)
		self.amiibos = amiibos
		
	}
	
	var body: some View {
		VStack {
			
			VStack(alignment: .center)  {
				
				Image(uiImage: urlImageModel.image ?? UrlImageView.defaultImage!)
					.resizable()
					.scaledToFit()
					.frame(width: 400, height: 400)
				
			}
			
						HStack {
							VStack(alignment: .trailing) {
								Text("Amiibo Series: =")
									.fontWeight(.heavy).font(.custom( "SuperMarioGalaxy", size: 16))
								Text("Game Series: =")
									.fontWeight(.heavy).font(.custom( "SuperMarioGalaxy", size: 16))
								Text("Character: =")
									.fontWeight(.heavy).font(.custom( "SuperMarioGalaxy", size: 16))
									.multilineTextAlignment(.trailing)
								Text("Type: =")
									.fontWeight(.heavy).font(.custom( "SuperMarioGalaxy", size: 16))
			
							}
			
							VStack(alignment: .leading) {
								Text(amiibos.amiiboSeries).font(.custom( "SuperMarioGalaxy", size: 16))
									.fontWeight(.heavy)
								Text(amiibos.gameSeries).font(.custom( "SuperMarioGalaxy", size: 16))
									.fontWeight(.heavy)
								Text(amiibos.character).font(.custom( "SuperMarioGalaxy", size: 16))
									.fontWeight(.heavy).font(.custom( "SuperMarioGalaxy", size: 16))
								Text(amiibos.type)
									.fontWeight(.heavy).font(.custom( "SuperMarioGalaxy", size: 16))
							}
						}
			Divider()
			Text("Release Dates")
			.font(.custom( "SuperMarioGalaxy", size: 16))
			HStack {
				
				ReleaseSchedule(country: "au", release: self.amiibos.releaseAU)
				ReleaseSchedule(country: "eu", release: self.amiibos.releaseEU)
				ReleaseSchedule(country: "jp", release: self.amiibos.releaseJP)
				ReleaseSchedule(country: "na", release: self.amiibos.releaseNA)
			}.font(.headline)
			
		}
		.navigationBarColor(.systemRed)
	}
}
struct AmiiboDetailView_Previews: PreviewProvider {
	static var previews: some View {
		AmiiboDetailView(urlString: nil ,amiibos: ReleaseDateModel(amiibo: amiibo1))
	}
}

