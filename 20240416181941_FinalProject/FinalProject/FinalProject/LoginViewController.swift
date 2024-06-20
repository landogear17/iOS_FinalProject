//
//  LoginViewController.swift
//  FinalProject
//
//  Created by english on 2024-04-16.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var textBoxEmail: UITextField!
    
    @IBOutlet weak var textBoxPassword: UITextField!
    
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

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        if textBoxEmail.text != "" && textBoxPassword.text != "" {
            Auth.auth().signIn(withEmail: textBoxEmail.text!, password: textBoxPassword.text!){
                (authData, error) in
                if error != nil{
                    Functions.makeAlert(title: "Firebase Error", message: error?.localizedDescription ?? "Something went wrong!", myUI:self)
                }else{
                    self.performSegue(withIdentifier: "toHomePageVC", sender: nil)
                }
            }
        }else{
            Functions.makeAlert(title: "Error", message: "Email/Password Missing", myUI: self)
        }
        
        //performSegue(withIdentifier: "toHomePage", sender: nil)
        
    }
}
