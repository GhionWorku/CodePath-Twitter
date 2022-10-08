//
//  TweetViewController.swift
//  Twitter
//
//  Created by Ghion Worku on 10/6/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialization code
        tweetTextView.becomeFirstResponder()
    }
    
    
    @IBOutlet weak var tweetTextView: UITextView!
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func tweet(_ sender: Any) {
        if(!tweetTextView.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: { self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in print("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        }else{
            self.dismiss(animated: true, completion: nil)
        }
    }
}
