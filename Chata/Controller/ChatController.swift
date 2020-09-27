//
//  ChatController.swift
//  Chata
//
//  Created by Roelan Geil Eroy on 9/27/20.
//  Copyright © 2020 Roe Developer. All rights reserved.
//

import UIKit
import FirebaseAuth

class ChatController: UIViewController {
    
    let firebaseAuth = Auth.auth();

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Chata"
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func onLogOut(_ sender: UIBarButtonItem){
        
        do {
             try firebaseAuth.signOut()
                navigationController?.popToRootViewController(animated: true)
        } catch let error  {
            print("Error signing out", error)
        }
    }
}
