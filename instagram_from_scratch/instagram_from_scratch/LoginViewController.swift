//
//  LoginViewController.swift
//  instagram_from_scratch
//
//  Created by dong liang on 3/17/16.
//  Copyright © 2016 dong. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    static var didLogout: String = "UserDidLogout"

    
    @IBOutlet weak var remainInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        remainInfo.text = ""
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    @IBAction func loginButtonPressed(sender: AnyObject) {
        
        
        PFUser.logInWithUsernameInBackground(usernameTextField.text!, password: passwordTextField.text!) { (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                print("YAy you succellly logged in")
                
                self.remainInfo.text = "You've signed up and will be signed in automatically......"
                
                let triggerTime = (Int64(NSEC_PER_SEC) * 3)
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, triggerTime), dispatch_get_main_queue(), { () -> Void in
                    self.performSegueWithIdentifier("LoginSegue", sender: self)
                })
                
                
            }
        }
        
    }
    
   
    @IBAction func signupButtonPressed(sender: AnyObject) {
        
        let newUser = PFUser()
        newUser.username = usernameTextField.text
        newUser.password = passwordTextField.text
        
        newUser.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if success {
                print("successfully signed up")
                self.loginButtonPressed(self)
            } else {
                print(error?.localizedDescription)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
