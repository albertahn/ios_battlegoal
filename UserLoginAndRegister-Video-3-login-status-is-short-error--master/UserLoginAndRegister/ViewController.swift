
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
    
    
    @IBOutlet weak var send_button: UIButton!
    
    let sendCommentClass = SendComment()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func sendAction(sender: UIButton) {
        
        
        sendCommentClass.sendCommentToServer("coke my dick")
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
       // in case the key "isUserLoggedIn" is in need:
       // let isUserLoggedIn = NSUserDefaults.standardUserDefaults().boolForKey("isUserLoggedIn")
        
        
        
        var managedObjectContext =
        (UIApplication.sharedApplication().delegate
            as! AppDelegate).managedObjectContext
        
      /*
        var entityDescription =
        NSEntityDescription.entityForName("Memberinfo",
            inManagedObjectContext: managedObjectContext!)
        
    var memberinfo = Memberinfo(entity: entityDescription!,
            insertIntoManagedObjectContext: managedObjectContext)
        

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
        
        
        
        
       */
        
        
        

        let commentUrl = NSURL(string: "http://mobile.tanggoal.com/comment/insert_course_comment/")
        let commentRequest = NSMutableURLRequest(URL: commentUrl!)
        commentRequest.HTTPMethod = "POST"
        
        
        //
        let commentPostString = "comment=  &course_index=5271"
        
        commentRequest.HTTPBody = commentPostString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(commentRequest) {
            data, response, error in
            
            if error != nil {
                println("error=(error)")
                return
            }
            
            var err: NSError?
            var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: &err) as? NSDictionary
    }
        
    }

    @IBAction func logoutButtonTapped(sender: AnyObject) {
        
       var managedObjectContext =
        (UIApplication.sharedApplication().delegate
            as! AppDelegate).managedObjectContext
        
        
        var entityDescription =
        NSEntityDescription.entityForName("Memberinfo",
            inManagedObjectContext: managedObjectContext!)
        
        var memberinfo = Memberinfo(entity: entityDescription!,
            insertIntoManagedObjectContext: managedObjectContext)
        
        
        //
        
        if(memberinfo.managedObjectContext != nil) {
        managedObjectContext?.deleteObject(memberinfo)
            println("delete:  ")
            
            
        }
        
        
        let entity = "Memberinfo"
        var request = NSFetchRequest(entityName: entity)
        var error: NSError?
        if let entities = managedObjectContext!.executeFetchRequest(
            request,
            error: &error
            ) as? [NSManagedObject] {
                for entity in entities {
                    if let dateString = entity as? Memberinfo
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

