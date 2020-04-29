//
//  ReleaseSchedule.swift
//  Amiibo
//
//  Created by Mike Liao on 2019/11/3.
//  Copyright © 2019 Mike Liao. All rights reserved.
//

import SwiftUI

struct ReleaseSchedule: View {
    let country: String
    let release: Date?
    
    var releaseDate: String {
        release?.toString(dateFormat: "MM-dd-yyyy") ?? "N/A"
    }
    
    var body: some View {
        VStack {
            
            
            Text(releaseDate)
				.font(.system(size: 12))
				.fontWeight(.heavy)
			Divider().frame(width: 80,height: 0)
			Image(country)
			.resizable()
			.scaledToFit()
			.frame(width: 80,height: 45)
        }
    }
}

struct ReleaseSchedule_Previews: PreviewProvider {
	static var previews: some View {
		
		Group {
			HStack {
				ReleaseSchedule(country: "au", release: Date())
					.previewLayout(.sizeThatFits)
				ReleaseSchedule(country: "eu", release: Date())
					.previewLayout(.sizeThatFits)
				ReleaseSchedule(country: "jp", release: Date())
					.previewLayout(.sizeThatFits)
				ReleaseSchedule(country: "na", release: Date())
					.previewLayout(.sizeThatFits)
			}
		}
	}
}
