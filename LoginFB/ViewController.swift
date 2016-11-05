//
//  ViewController.swift
//  LoginFB
//
//  Created by Infraestructura on 04/11/16.
//  Copyright © 2016 dacalo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //let unRect = self.view.bounds
        if FBSDKAccessToken.current() != nil{
            //esta app ya fue autorizada, no hay que fastidiar al usuario
            let logout = UIButton(type:.custom)
            logout.setTitle("Logout", for: .normal)
            logout.center = self.view.center
            logout.addTarget(self, action: "logoutFB", for: .touchUpInside)
        }else{
            let login = FBSDKLoginButton()
            login.center = self.view.center
            view.addSubview(login)
            login.delegate = self
            login.readPermissions = ["public_profile", "email"]
        }
    }
    
    func logoutFB(){
        FBSDKLoginManager().logOut()
        FBSDKAccessToken.setCurrent(nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!){
        if error != nil{
            print("No se puede completar el login con FB")
        }else if result.isCancelled{
            print("El usuario no acepta login con FB")
        }else{
            let email = result.value(forKey: "email")
            print("El usuario tiene el correo \(email)")
        }
    }
    
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!){
        
    }
    


}

