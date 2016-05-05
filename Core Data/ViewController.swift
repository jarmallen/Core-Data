//
//  ViewController.swift
//  Core Data
//
//  Created by Jared Allen on 4/12/16.
//  Copyright © 2016 Jared Allen. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set core data
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context: NSManagedObjectContext = appDel.managedObjectContext
       
        /*
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context)
        
        newUser.setValue("Aurora", forKey: "username")
        
        newUser.setValue("meow", forKey: "password")
        
        do {
            
            try context.save()
        
        } catch {
            
            // Handle error
        
        }
 
        */
        
       
        // Retrieve core data
        
        let request = NSFetchRequest(entityName: "Users")
        
        // request.predicate = NSPredicate(format: "username = %@", "Jared")
        
        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.executeFetchRequest(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    // context.deleteObject(result)
                    
                   // result.setValue("Wifey", forKey: "username")
                    
                   /* do {
                        
                        try context.save()
                    
                    } catch {
                        
                        // Error
                        
                    } */
                    
                    if let username = result.valueForKey("username") as? String {
                        
                        print(username)
                        
                    }
                    
                 
                    
                }
            }
        
        } catch {
            
            // Handle error
            
        }
        
        

        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

