//
//  PostViewController.swift
//  instagram_from_scratch
//
//  Created by dong liang on 3/20/16.
//  Copyright © 2016 dong. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    


    @IBOutlet weak var postimage: UIImageView!

    @IBOutlet weak var captionText: UITextField!
    
    
    var PostImage: UIImage!

    var EditedPostImage: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postimage.image = PostImage
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func postButtonPressed(sender: AnyObject) {
        Post.postUserImage(EditedPostImage, withCaption: captionText.text!) { (success: Bool, error: NSError?) -> Void in
            if success {
                print("post successfully")
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
    }

    @IBAction func CancelButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
