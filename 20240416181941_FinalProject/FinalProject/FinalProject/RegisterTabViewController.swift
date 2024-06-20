//
//  RegisterTabViewController.swift
//  FinalProject
//
//  Created by english on 2024-04-16.
//

import UIKit
import Firebase

class RegisterTabViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func RegisterButtonPressed(_ sender: UIButton) {
        if emailText.text != "" && passwordText.text != "" {
                    Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text! ){
                        ( authData, error) in
                        if error != nil {
                            Functions.makeAlert(title: "Firebase Error", message: error?.localizedDescription ?? "Something went wrong!", myUI: self)
                        }else {
                            Functions.makeAlert(title: "Register Succesful", message: "Please, login first", myUI: self)
                            self.performSegue(withIdentifier: "ToLoginVC", sender: nil) // Move to home view
                        }
                    }
        }else{
                Functions.makeAlert(title: "Error", message: "Email/Password is missing!", myUI: self) //  custom Alert Function.
        }

    }
    
}
