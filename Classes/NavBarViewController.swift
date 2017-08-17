//
//  NavBarViewController.swift
//  AccountabilityPartner
//
//  Created by Nico on 8/17/17.
//
//

import UIKit
import Parse


class NavBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //Navbar setup
        let rightButtonItem = UIBarButtonItem.init(
            title: "Sign Out",
            style: .done,
            target: self,
            action: #selector(signOut)
        )
        
        let leftButtonItem = UIBarButtonItem.init(
            title: "My Chats",
            style: .done,
            target: self,
            action: #selector(goToPartners)
        )
        
        let middleButtonItem = UIBarButtonItem.init(
            title: "Home",
            style: .done,
            target: self,
            action: #selector(goHome)
        )
        self.navigationItem.setRightBarButton(rightButtonItem, animated: false)
        self.navigationItem.setLeftBarButtonItems([leftButtonItem, middleButtonItem], animated: false)
        self.navigationItem.title = ""
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

              // Navbar Actions
    func signOut() {
        PFUser.logOut()
        let currentUser = PFUser.current()
        if currentUser == nil {
            let vc:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Login")
            self.navigationController?.pushViewController(vc,animated: true)
        }
        
    }
    
    func goToPartners() {
        let vc:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "myPartners")
        self.navigationController?.pushViewController(vc,animated: true)
        
        
    }
    
    func goHome() {
        let vc:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Homepage")
        self.navigationController?.pushViewController(vc,animated: true)

        
    }
    


}
