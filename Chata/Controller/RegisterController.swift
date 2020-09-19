//
//  RegisterController.swift
//  Chata
//
//  Created by Roelan Geil Eroy on 9/19/20.
//  Copyright © 2020 Roe Developer. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterController: UIViewController {
    
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPass: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onRegister(_ sender: UIButton){
        if let email = textFieldEmail.text, let pass = textFieldPass.text {
            Auth.auth().createUser(withEmail: email, password: pass) { (authResult, error) in
                if let err = error{
                    print("Errorz: \(err)")
                }
                else{
                    self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                }
            }
        }
    }



}
