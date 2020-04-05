//
//  AmiiboDetailView.swift
//  Amiibo
//
//  Created by Les Lariz on 2/26/20.
//  Copyright © 2020 Les R Lariz. All rights reserved.
//

import SwiftUI


struct AmiiboDetailView: View {
	
	
	@ObservedObject var networkingManager = NetworkingManager()
	@ObservedObject var urlImageModel: URlImageModel
	@ObservedObject var amiibos = ReleaseDateModel(amiibo: amiibo1)
	
	
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
									.font(.headline)
									.fontWeight(.heavy)
								Text("Game Series: =")
									.font(.headline)
									.fontWeight(.heavy)
								Text("Character: =")
									.font(.headline)
									.fontWeight(.heavy)
									.multilineTextAlignment(.trailing)
								Text("Type: =")
									.font(.headline)
									.fontWeight(.heavy)
			
							}
			
							VStack(alignment: .leading) {
								Text(amiibos.amiiboSeries)
									.font(.headline)
									.fontWeight(.heavy)
								Text(amiibos.gameSeries)
									.font(.headline)
									.fontWeight(.heavy)
								Text(amiibos.character)
									.font(.headline)
									.fontWeight(.heavy)
								Text(amiibos.type)
									.font(.headline)
									.fontWeight(.heavy)
			
							}
						}
			Divider()
			Text("Release Dates")
				.fontWeight(.heavy)
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

