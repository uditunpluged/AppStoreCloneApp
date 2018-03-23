//
//  AppCategory.swift
//  AppStoreCloneApp
//
//  Created by Udit Kapahi on 23/03/18.
//  Copyright © 2018 Udit Kapahi. All rights reserved.
//

import UIKit

class AppCategory: NSObject {
    var name: String?
    var apps: [App]?
    
    
    
    static func sampleAppCateg()->[AppCategory]{
        let bestNewAppsCategories = AppCategory()
        bestNewAppsCategories.name = "Best New Apps"
        
        var apps = [App]()
        let app = App()
        app.id = 1
        app.category = "BEst"
        app.name = "My App"
        app.price = 20
        apps.append(app)
        
        bestNewAppsCategories.apps = apps
        return [bestNewAppsCategories]
    }
    
}





class App: NSObject {
    var id: NSNumber?
    var name: String?
    var category: String?
    var price:NSNumber?
    var imageName:String?
}
