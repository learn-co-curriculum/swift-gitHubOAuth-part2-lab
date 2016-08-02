//
//  LoginViewController.swift
//  GitHubOAuth
//
//  Created by Joel Bell on 7/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import Locksmith

// SOLUTION: import safari services, add delegate
import SafariServices

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginImageView: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var imageBackgroundView: UIView!
    
    var safariVC: SFSafariViewController?
    let numberOfOctocatImages = 10
    var octocatImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpImageViewAnimation()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.safariLogin(_:)), name: Notification.closeSafariVC, object: nil)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if imageBackgroundView.layer.cornerRadius == 0 {
            configureButton()
        }
    }
    
    
    @IBAction func loginButtonTapped(sender: UIButton) {
        
        presentSafariViewController()
    
    }
    
    private func presentSafariViewController() {
        
        guard let authURL = NSURL(string: GitHubAPIClient.URLRouter.oauth) else {return}
        self.safariVC = SFSafariViewController(URL: authURL)
        guard let safariVC = self.safariVC else {return}
        let navigationController = UINavigationController(rootViewController: safariVC)
        navigationController.setNavigationBarHidden(true, animated: false)
        presentViewController(navigationController, animated: true, completion: nil)
        
    }
    
    func safariLogin(notification: NSNotification) {
        
        print(notification.object?.absoluteURL)
        self.safariVC!.dismissViewControllerAnimated(true, completion: nil)

    }
    
}


// MARK: Set Up View
extension LoginViewController {
    
    private func configureButton()
    {
        self.imageBackgroundView.layer.cornerRadius = 0.5 * self.imageBackgroundView.bounds.size.width
        self.imageBackgroundView.clipsToBounds = true
    }
    
    private func setUpImageViewAnimation() {
        
        for index in 1...numberOfOctocatImages {
            if let image = UIImage(named: "octocat-\(index)") {
                octocatImages.append(image)
            }
        }
        
        self.loginImageView.animationImages = octocatImages
        self.loginImageView.animationDuration = 2.0
        self.loginImageView.startAnimating()
        
    }
}







