//
//  RegisterViewController.swift
//  BookApp
//
//  Created by CGL on 10.09.2019.
//  Copyright © 2019 cgl. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
   
    @IBOutlet weak var nameSurnameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func registerButton(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (user, error) in
            if error == nil && user != nil {
                print("User Created!")
            }else{
                print("Error Creating user" )
            }
        }
        performSegue(withIdentifier: "toMainViewController", sender: nil)
    }
    
    
    
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }

}
