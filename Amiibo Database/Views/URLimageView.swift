//
//  URLimageView.swift
//  Amiibo
//
//  Created by Les Lariz on 2/25/20.
//  Copyright © 2020 Les R Lariz. All rights reserved.
//

import SwiftUI

struct UrlImageView: View {
     @ObservedObject var urlImageModel: URlImageModel
	   
	   init(urlString: String?) {
		   urlImageModel = URlImageModel(urlString: urlString)
	   }
    
    var body: some View {
		  
			Image(uiImage: urlImageModel.image ?? UrlImageView.defaultImage!)
            .resizable()
            .scaledToFit()
			.frame(width: 90, height: 90)
			.aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
    }
    
    static var defaultImage = UIImage(named: "Mario")
}

struct UrlImageView_Previews: PreviewProvider {
    static var previews: some View {
        UrlImageView(urlString: nil)
    }
}
