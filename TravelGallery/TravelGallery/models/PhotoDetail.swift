
//
//  File.swift
//  TravelGallery
//
//  Created by Büşra Serdaroğlu on 12.07.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import Foundation

struct PhotoDetail {
    var id : UUID
    var userName : String
    var mapDetail : MapDetail
    var description : String
    var photoUrls : [String]
    var date : Date
}
