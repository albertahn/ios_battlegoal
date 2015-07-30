//
//  UserInfo.swift
//  
//
//  Created by tanggoal on 7/28/15.
//
//

import Foundation
import CoreData

class Memberinfo: NSManagedObject {

    @NSManaged var email: String
    @NSManaged var password: String
    @NSManaged var profilepicture: String
    @NSManaged var user_index: String
    

}
