//
//  StorageManager.swift
//  TableViewProject
//
//  Created by Платон Конкилов on 01.12.2019.
//  Copyright © 2019 Платон Конкилов. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ place: Place) {
        try! realm.write {
            realm.add(place)
        }
    }
    
    static func deliteObject(_ place: Place) {
        
        try! realm.write {
            realm.delete(place)
        }
    }
}
