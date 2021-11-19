//
//  FigureView.swift
//  Amiibo Database
//
//  Created by Les Lariz on 4/5/20.
//  Copyright © 2020 Les R Lariz. All rights reserved.
//

import SwiftUI

struct FigureView: View {
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
		UINavigationBar.appearance().titleTextAttributes = [
		.font : UIFont(name: "SuperMarioGalaxy", size: 20)!]
	}
	
	var body: some View {
		
		NavigationView() {
			
			VStack  {
				
				Divider()
				Text("Number of Figures = \(networkingManager.amiiboList.amiibo.count)")
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
					.id(UUID())
				}.listStyle(PlainListStyle()) 
			}.navigationBarColor(.systemGreen)
		}.onAppear( perform: networkingManager.loadFigure)
	}
}
struct FigureView_Previews: PreviewProvider {
    static var previews: some View {
        FigureView(urlString: nil ,amiibos: ReleaseDateModel(amiibo: amiibo1))
.previewInterfaceOrientation(.landscapeLeft)
    }
}
struct NavigationBarModifier: ViewModifier {
	
	var backgroundColor: UIColor?
	
	init( backgroundColor: UIColor?) {
		self.backgroundColor = backgroundColor
		let coloredAppearance = UINavigationBarAppearance()
		coloredAppearance.configureWithTransparentBackground()
		coloredAppearance.backgroundColor = .clear
		coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
		coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
		
		UINavigationBar.appearance().standardAppearance = coloredAppearance
		UINavigationBar.appearance().compactAppearance = coloredAppearance
		UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
		UINavigationBar.appearance().tintColor = .white
		
	}
	
	func body(content: Content) -> some View {
		ZStack{
			content
			VStack {
				GeometryReader { geometry in
					Color(self.backgroundColor ?? .clear)
						.frame(height: geometry.safeAreaInsets.top)
						.edgesIgnoringSafeArea(.top)
					Spacer()
				}
			}
		}
	}
}
extension View {
	
	func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
		self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
	}
	
}
