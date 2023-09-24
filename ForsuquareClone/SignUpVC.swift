//
//  ViewController.swift
//  ForsuquareClone
//
//  Created by Oğuzhantuğrul Akçay on 24.09.2023.
//

import UIKit
import Parse
class SignUpVC: UIViewController {

    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var userNameText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func signUpClicked(_ sender: Any) {
        if userNameText.text != "" && passwordText.text != "" {
            let user=PFUser()
            user.username=userNameText.text!
            user.password=passwordText.text!
            
            user.signUpInBackground { success, err in
                if err != nil {
                    self.makeAlert(titleInput: "Error", messageInput: err?.localizedDescription ?? "Unhandeld error")
                }else{
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
        }else{
            self.makeAlert(titleInput: "Error", messageInput: "Please set our user name and password")
        }
    }
    @IBAction func signInClicked(_ sender: Any) {
        if userNameText.text != "" && passwordText.text != "" {
            PFUser.logInWithUsername(inBackground: userNameText.text!, password: passwordText.text!) { user, err in
                if err != nil {
                    self.makeAlert(titleInput: "Error", messageInput: err?.localizedDescription ?? "Error")
                }else{
//                    Segue
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
        }else{
            self.makeAlert(titleInput: "Error", messageInput: "Please enter your user name and password")
        }
    }
    
    func makeAlert(titleInput: String, messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default,handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}

