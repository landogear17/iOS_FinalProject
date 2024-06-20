//
//  HomeViewController.swift
//  FinalProject
//
//  Created by english on 2024-04-16.
//

import UIKit

import FirebaseAuth
import FirebaseFirestore
import FirebaseCore

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var myTableView: UITableView!
    
    var userTitleArray = [String]()
        var userDescArray = [String]()
        var userDateArray = [String]()

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myTableView.rowHeight = 300
        return userTitleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HomeTableViewCell
                cell.titleText.text = userTitleArray [indexPath.row]
                cell.descText.text = userDescArray [indexPath.row]
                cell.dateText.text = userDateArray [indexPath.row]
                return cell;
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        getFireStoreFunction()

        // Do any additional setup after loading the view.
    }
    
    func getFireStoreFunction() {
        let firestoreDatabase = Firestore.firestore ()
        firestoreDatabase.collection("MyPosts").addSnapshotListener( {
            ( snapshot, error) in
            if error != nil {
                print(error?.localizedDescription ?? "Something went Wrong.")
            }else{
                if  snapshot?.isEmpty != true && snapshot != nil {
                    for document in snapshot!.documents {
                        let documentID = document.documentID
                        print(documentID)
                        if let title =  document.get("title") as? String{
                            self.userTitleArray.append(title)
                        }
                        if let desc = document.get("description") as? String {
                            self.userDescArray.append(desc)
                        }
                        if let timestamp = document.get("Date") as? Timestamp {
                            let date = timestamp.dateValue() //modificar
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateStyle = .medium
                            dateFormatter.timeStyle = .medium
                            let stringDate = dateFormatter.string(from: date)
                            print(stringDate)
                            self.userDateArray.append(stringDate)
                        }
                    }
                    self.myTableView.reloadData()
                }
            }
        }
        )}
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
