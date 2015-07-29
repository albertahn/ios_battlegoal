//
//  UserInfo.swift
//  
//
//  Created by tanggoal on 7/28/15.
//
//

import Foundation
import CoreData

class UserInfo: NSManagedObject {

    @NSManaged var email: String
    @NSManaged var password: String
    @NSManaged var profilepicture: String

}
