//
//  CardView.swift
//  Amiibo Database
//
//  Created by Les Lariz on 4/5/20.
//  Copyright © 2020 Les R Lariz. All rights reserved.
//

import SwiftUI

struct CardView: View {
		@ObservedObject var networkingManager: NetworkingManager = NetworkingManager()
		@ObservedObject var urlImageModel: URlImageModel
		@ObservedObject var amiibos = ReleaseDateModel(amiibo: amiibo1)
	    @StateObject var oo = FilterObservableObject()
	    @State private var searchTerm1 = ""
	
	 	init(urlString: String? ,amiibos: ReleaseDateModel) {
			urlImageModel = URlImageModel(urlString: urlString)
			self.amiibos = amiibos
			self.urlImageModel = URlImageModel(urlString: urlString)
			UISegmentedControl.appearance().selectedSegmentTintColor = .systemGreen
			UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
			UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.systemGreen], for: .normal)
			
		}
		
		var body: some View {
			
			NavigationView() {
				
				VStack  {
					
					Divider()
					Text("Number of Cards = \(networkingManager.amiiboList.amiibo.count)")
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
												.font(.custom( "Arial", size: 8))
												 .fontWeight(.heavy)
											Text("Game Series:")
												.font(.custom( "Arial", size: 8))
												.fontWeight(.heavy)
											Text("Character:")
												.font(.custom( "Arial", size: 8))
												.fontWeight(.heavy)
											Text("Type:")
												.font(.custom( "Arial", size: 8))
												.fontWeight(.heavy)
											
										}
										
										VStack(alignment: .leading) {
											Text (amiibos.amiiboSeries)
												.font(.custom( "Arial", size: 8))
												.fontWeight(.heavy)
											Text(amiibos.gameSeries)
												.font(.custom( "Arial", size: 8))
												.fontWeight(.heavy)
											Text(amiibos.character)
												.font(.custom( "Arial", size: 8))
												.fontWeight(.heavy)
											Text(amiibos.type)
												.font(.custom( "Arial", size: 8))
												.fontWeight(.heavy)
		
										}
									}
								}
							}
						}.navigationBarTitle("Amiibo Database",displayMode:  .inline )
							.animation(.default , value: searchTerm1)
							//.searchable(text: $searchTerm1, placement: .navigationBarDrawer(displayMode: .automatic) )
						.id(UUID())
					}.listStyle(InsetGroupedListStyle()) 
				}.navigationBarColor(.systemYellow)
			}.onAppear( perform: networkingManager.loadCard)
				.onChange(of: searchTerm1) { searchTerm1 in
					oo.filterResults = oo.data.filter({amiibos in
						amiibos.character.lowercased().contains(searchTerm1.lowercased())
					})
				}
		}
	}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(urlString: nil ,amiibos: ReleaseDateModel(amiibo: amiibo1))
    }
}
