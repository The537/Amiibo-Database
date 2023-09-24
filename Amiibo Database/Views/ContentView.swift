//
//  ContentView.swift
//  Amiibo Database
//
//  Created by Les Lariz on 4/5/2020.
//  Copyright © 2020 Les R Lariz. All rights reserved.
//

import SwiftUI
import UIKit

struct ContentView: View {
	init() {
		UITabBar.appearance().backgroundColor = UIColor.lightText
	}
	@State var selectedTab = 0
	
	var body: some View {
		TabView(selection: $selectedTab) {
			FigureView(urlString: nil ,amiibos: ReleaseDateModel(amiibo: amiibo1)).tabItem({
				Label("Figures", systemImage: "figure.wave.circle.fill")
				
				//Text(Constants.TabBarText.Figure).font(.custom( "Ariel", size: 18))
			}).tag(0)
			CardView(urlString: nil ,amiibos: ReleaseDateModel(amiibo: amiibo1)).tabItem({
				Label("Cards", systemImage: "rectangle.on.rectangle.circle.fill")
				//Text(Constants.TabBarText.Card).font(.custom( "Ariel", size: 18))
			}).tag(1)
			YarnView(urlString: nil ,amiibos: ReleaseDateModel(amiibo: amiibo1)).tabItem({
				Label("Yarn", systemImage: "seal")
				//Text(Constants.TabBarText.Yarn).font(.custom( "Ariel", size: 18))
			}).tag(2)
		}.accentColor(Color.green)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
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
					Color(self.backgroundColor ?? .lightText)
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
