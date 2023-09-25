//
//  URLimageView.swift
//  Amiibo
//
//  Created by Les Lariz on 2/25/2020.
//  Copyright © 2020 Les R Lariz. All rights reserved.
//

import SwiftUI

struct UrlImageView: View {
      var urlImageModel: URlImageModel
	   
	   init(urlString: String?) {
		   urlImageModel = URlImageModel(urlString: urlString)
	   }
    
    var body: some View {
		  
			Image(uiImage: urlImageModel.image ?? UrlImageView.defaultImage!)
            .resizable()
            .scaledToFit()
			.frame(width: 90, height: 90)
			.aspectRatio(contentMode: .fit)
    }
    
    static var defaultImage = UIImage(named: "Mario")
}

struct UrlImageView_Previews: PreviewProvider {
    static var previews: some View {
        UrlImageView(urlString: nil)
    }
}
