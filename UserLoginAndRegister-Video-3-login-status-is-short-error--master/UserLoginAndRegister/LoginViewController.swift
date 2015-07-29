//
//  LoginViewController.swift
//  UserLoginAndRegister
//
//  Created by Hey Jude on 2015. 7. 17..
//  Copyright (c) 2015년 Hey Jude. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        
     
        
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        
        if(userEmail.isEmpty || userPassword.isEmpty)
        {
            return
        }
        
        // Send user data to server side
       
       let myUrl = NSURL(string: "http://mobile.tanggoal.com/login/run")
        let request = NSMutableURLRequest(URL: myUrl!)
        request.HTTPMethod = "POST"
        
        let postString = "email=\(userEmail)&password=\(userPassword)"
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil {
                println("error=(error)")
                return
            }
            
            var err: NSError?
            var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: &err) as? NSDictionary
            
            /////////////////// core data saving
            var managedObjectContext =
            (UIApplication.sharedApplication().delegate
                as! AppDelegate).managedObjectContext

            
            var entityDescription =
            NSEntityDescription.entityForName("UserInfo",
                inManagedObjectContext: managedObjectContext!)
            
            var userinfo = UserInfo(entity: entityDescription!,
                insertIntoManagedObjectContext: managedObjectContext)
            
            userinfo.email = userEmail
            
            if(userinfo.email != "")
            {
                // Login is successfull
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIn")
                NSUserDefaults.standardUserDefaults().synchronize()
                
                self.dismissViewControllerAnimated(true, completion: nil)
            }

            print("whether user is logged in:  ")
            println(NSUserDefaults.standardUserDefaults().boolForKey("isUserLoggedIn"))
         //   println("dfsef:  " + userinfo.email)
            

            
            
          //  println("fuka: \(json)")
            
            if let parseJSON = json {
                
                var emailvar: String = parseJSON["email"] as! String!
                println("resultman: \(emailvar)")
                
                var md5password: String = parseJSON["password"] as! String!
                
                userinfo.password = md5password
                
                var profile_picture: String = parseJSON["profile_picture"] as! String!
                
                userinfo.profilepicture = profile_picture
                
                
            }
            
        }
        
        task.resume()
        
    }

    
}
