//
//  ContentView.swift
//  Amiibo Database
//
//  Created by Les Lariz on 4/5/20.
//  Copyright © 2020 Les R Lariz. All rights reserved.
//

import SwiftUI
import UIKit

struct ContentView: View {
	init() {
		UITabBar.appearance().backgroundColor = UIColor.systemGray
	}
	@State var selectedTab = 0
	
	var body: some View {
		TabView(selection: $selectedTab) {
			FigureView(urlString: nil ,amiibos: ReleaseDateModel(amiibo: amiibo1)).tabItem({
				Text(Constants.TabBarText.Figure).font(.largeTitle)
			}).tag(0)
			CardView(urlString: nil ,amiibos: ReleaseDateModel(amiibo: amiibo1)).tabItem({
				Text(Constants.TabBarText.Card).font(.largeTitle)
			}).tag(1)
			YarnView(urlString: nil ,amiibos: ReleaseDateModel(amiibo: amiibo1)).tabItem({
				Text(Constants.TabBarText.Yarn).font(.largeTitle)
			}).tag(2)
		}.accentColor(Color.green)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
