//
//  Functions.swift
//  FinalProject
//
//  Created by english on 2024-04-09.
//

import Foundation
import UIKit

class Functions{
    
    public static func makeAlert(title: String, message: String  , myUI: UIViewController){
            let alert = UIAlertController( title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            myUI.present( alert, animated: true, completion: nil)
    }
    
}



