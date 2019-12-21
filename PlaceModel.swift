//
//  PlaceModel.swift
//  TableViewProject
//
//  Created by Платон Конкилов on 29.11.2019.
//  Copyright © 2019 Платон Конкилов. All rights reserved.
//

import RealmSwift

class Place: Object {
    @objc dynamic var name = ""
    @objc dynamic var location: String?
    @objc dynamic var type: String?
    @objc dynamic var imageData: Data?
    @objc dynamic var date = Date()
    @objc dynamic var rating = 0.0
    
    convenience init (name: String, location: String?, type: String?, imageData: Data?, rating: Double) {
        self.init() // что бы задать значения по умолчанию 
        self.name = name
        self.location = location
        self.type = type
        self.imageData = imageData
        self.rating = rating
    }
}
