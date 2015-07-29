
//
//  ViewController.swift
//  UserLoginAndRegister
//
//  Created by Hey Jude on 2015. 7. 17..
//  Copyright (c) 2015년 Hey Jude. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let managedObjectContext =
    (UIApplication.sharedApplication().delegate
        as! AppDelegate).managedObjectContext
    
  
    
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
       // in case the key "isUserLoggedIn" is in need:
       // let isUserLoggedIn = NSUserDefaults.standardUserDefaults().boolForKey("isUserLoggedIn")
        
        
        
        var managedObjectContext =
        (UIApplication.sharedApplication().delegate
            as! AppDelegate).managedObjectContext
        
        
        var entityDescription =
        NSEntityDescription.entityForName("UserInfo",
            inManagedObjectContext: managedObjectContext!)
        
       /* var userinfo = UserInfo(entity: entityDescription!,
            insertIntoManagedObjectContext: managedObjectContext)*/
        
        
        let request = NSFetchRequest()
        request.entity = entityDescription
        
       // let pred = NSPredicate(format: "(email = %@)", email.text)
       // request.predicate = pred
        
        var error: NSError?
        
        var objects = managedObjectContext?.executeFetchRequest(request,
            error: &error)
        
        if(objects == nil) {
            
            println("objects is nil")
            
        }
        
        if let results = objects {
            
            if (results.count > 0) {
                let match = results[0] as! NSManagedObject
                
                let cake: String =  match.valueForKey("profilepicture") as! String
                
                println("cake: " + cake)
                
                
                           } else {
                
                println("no result")
                self.performSegueWithIdentifier("loginView", sender: self)
                
                            }
        }//results
        
        
        //println("userinfo.email: " + userinfo.email.)
        
        
       
    }

    @IBAction func logoutButtonTapped(sender: AnyObject) {
        
       var managedObjectContext =
        (UIApplication.sharedApplication().delegate
            as! AppDelegate).managedObjectContext
        
        
        var entityDescription =
        NSEntityDescription.entityForName("UserInfo",
            inManagedObjectContext: managedObjectContext!)
        
        var userinfo = UserInfo(entity: entityDescription!,
            insertIntoManagedObjectContext: managedObjectContext)
        
        //
        if(userinfo.managedObjectContext != nil) {
        managedObjectContext?.deleteObject(userinfo)
            println("delete:  ")
            
            
        }
        
        
        let entity = "UserInfo"
        var request = NSFetchRequest(entityName: entity)
        var error: NSError?
        if let entities = managedObjectContext!.executeFetchRequest(
            request,
            error: &error
            ) as? [NSManagedObject] {
                for entity in entities {
                    if let dateString = entity as? UserInfo
                    {
                        println("test")
                    } 
                }
        }
      //  NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isUserLoggedIn")
      //  NSUserDefaults.standardUserDefaults().synchronize()
        
        self.performSegueWithIdentifier("loginView", sender: self)
    }

}

