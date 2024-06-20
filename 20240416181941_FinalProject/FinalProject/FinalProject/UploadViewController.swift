//
//  UploadViewController.swift
//  FinalProject
//
//  Created by english on 2024-04-16.
//

import UIKit
import Firebase

class UploadViewController: UIViewController {

    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var descriptionText: UITextField!
    
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
    
    
    
    @IBAction func UploadButtonPressed(_ sender: UIButton) {
        
        let title = titleText.text
        
        if title?.isEmpty == true{
            Functions.makeAlert(title: "Title Missing", message: "Please enter a Title.", myUI: self)
            return
        }
        
        
        guard let title = titleText.text, !title.isEmpty else {
            Functions.makeAlert(title: "Error", message: "Please enter a title.",myUI: self)
            return
        }
        
        let desc = descriptionText.text
        if desc?.isEmpty == true{
            Functions.makeAlert(title: "Description Missing", message: "Please enter a description.", myUI: self)
            return
        }
        
        let db = Firestore.firestore()
        var ref: DocumentReference? = nil
        ref = db.collection("MyPosts").addDocument(data: [
            "title": title,
            "description": desc,
            "Date": Date()
        ]) { err in
            if let err = err {
                Functions.makeAlert(title: "Upload Failed", message: "Error at time to upload.",myUI: self)
            }else {
                print("ID: \(ref!.documentID)")
                Functions.makeAlert(title: "Successfully Added", message: "Done!", myUI: self)
            }
        }
    }
}
