//
//  RegisterViewController.swift
//  FinalProject
//
//  Created by english on 2024-04-09.
//

import Foundation
import UIKit
import Firebase

class RegisterViewController : UIViewController{
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func RegisterButtonPressed(_ sender: UIButton) {
        
        if emailText.text != "" && passwordText.text != "" {
                    Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text! ){
                        ( authData, error) in
                        if error != nil {
                            Functions.makeAlert(title: "Firebase Error", message: error?.localizedDescription ?? "Something went wrong!", myUI: self)
                        }else {
                            
                            self.performSegue(withIdentifier: "BackToLoginVC", sender: nil) // Move to home view
                        }
                    }
        }else{
                Functions.makeAlert(title: "Error", message: "Email/Password is missing!", myUI: self) //  custom Alert Function.
        }

    }
    @IBAction func BackButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "BackToLoginVC", sender: nil)
    }
    
    @IBAction func LogOutButtonPressed(_ sender: UIButton) {
        do{
                   try Auth.auth().signOut()
        }catch {
        print("error")
        self.performSegue(withIdentifier: "BackToLoginVC", sender: nil)
        }
        performSegue(withIdentifier: "BackToLoginVC", sender: nil)
    }
}
