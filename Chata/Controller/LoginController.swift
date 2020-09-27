//
//  ViewController.swift
//  Chika
//
//  Created by Vananaz Developer on 9/11/20.
//  Copyright © 2020 Roe Developer. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginController: UIViewController {
    
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPass: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // //Keyboard dismiss
//        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
//        view.addGestureRecognizer(tapGesture)
//
//        tapGesture.cancelsTouchesInView = false
        
        textFieldEmail.delegate = self;
        textFieldPass.delegate = self;
        btnLogin.roundedCorner()
        
        animateTitle()
    }
    
    @IBAction func onLogin(_ sender: UIButton){
        
        if let email = textFieldEmail.text, let password = textFieldPass.text{
            Auth.auth().signIn(withEmail: email, password: password) { (dataResult, error) in
                
                guard let err = error else{
                    self.performSegue(withIdentifier: Constants.loginSegue, sender: self)
                    return
                }
                print(err)

               
            }
        }
        else{
            print("Empty fields")
        }
       
    }
    
    func animateTitle(){
        var charIndex = 0;
        titleLabel.text = ""
        let textTitle = Constants.appName
        for letter in textTitle{
            Timer.scheduledTimer(withTimeInterval: TimeInterval( 1 * charIndex), repeats: false) { (Timer) in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1;
        }
    }


}

extension LoginController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

extension UIButton{
    
    func roundedCorner(){
        self.clipsToBounds = true;
        self.layer.cornerRadius = 30
    }
}
