//
//  UserInfo.swift
//  UserLoginAndRegister
//
//  Created by tanggoal on 7/30/15.
//  Copyright (c) 2015 Hey Jude. All rights reserved.
//

import Foundation
import CoreData

class UserInfo: NSManagedObject {

    @NSManaged var email: String
    @NSManaged var password: String
    @NSManaged var profilepicture: String
    @NSManaged var user_index: String

}
