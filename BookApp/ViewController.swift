//
//  ViewController.swift
//  BookApp
//
//  Created by CGL on 7.09.2019.
//  Copyright © 2019 cgl. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
  
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   

        override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Auth.auth().currentUser != nil{
            performSegue(withIdentifier: "toMainVC", sender: self)
        }
    }
    
    @IBAction func signInButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (user, error) in
            if error == nil && user != nil {
                print("Success!")
            }else{
                print("Error Success" )
            }
        }
        performSegue(withIdentifier: "toMainVC", sender: nil)
    }
    
    
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    


}
