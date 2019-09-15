//
//  SettingsPageViewController.swift
//  BookApp
//
//  Created by CGL on 7.09.2019.
//  Copyright © 2019 cgl. All rights reserved.
//

import UIKit
import Firebase

class SettingsPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    
    @IBAction func logOutClicked(_ sender: Any) {
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
        
        performSegue(withIdentifier: "toSignInPage", sender: nil)
    }
    
}
