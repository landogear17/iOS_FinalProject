//
//  SettingsViewController.swift
//  FinalProject
//
//  Created by english on 2024-04-16.
//

import UIKit

import Firebase

class SettingsViewController: UIViewController {

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

    @IBAction func LogOutButtonPressed(_ sender: UIButton) {
        
        //SettingsToLoginVC
        do{
                    try Auth.auth().signOut()
                }catch {
                    print("error")
                    self.performSegue(withIdentifier: "SettingsToLoginVC", sender: nil)
                }
                performSegue(withIdentifier: "SettingsToLoginVC", sender: nil)
        
        
    }
}
