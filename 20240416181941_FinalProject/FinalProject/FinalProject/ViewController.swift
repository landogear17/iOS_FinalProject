//
//  ViewController.swift
//  FinalProject
//
//  Created by english on 2024-04-02.
//

import UIKit
import Firebase


class ViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func registerButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toRegisterVC", sender: nil)
    }
    
    @IBAction func LoginButtonPressed(_ sender: UIButton) {
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!){
                (authData, error) in
                if error != nil{
                    Functions.makeAlert(title: "Firebase Error", message: error?.localizedDescription ?? "Something went wrong!", myUI:self)
                }else{
                    self.performSegue(withIdentifier: "", sender: nil)
                }
            }
        }else{
            makeAlert(title: "Error", message: "Email/Password Missing")
        }
        
    }
    
    func makeAlert(title: String, message: String  ){
            let alert = UIAlertController( title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present( alert, animated: true, completion: nil)
    }
}

