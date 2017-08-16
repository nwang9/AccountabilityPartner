//
//  CustomNavController.swift
//  AccountabilityPartner
//
//  Created by Nico on 8/16/17.
//
//

import UIKit
import Parse

class CustomNavController: UINavigationController {
    
    
     //Navbar setup
     let rightButtonItem = UIBarButtonItem.init(
     title: "Sign Out",
     style: .done,
     target: self,
     action: #selector(signOut)
     )
     
     let leftButtonItem = UIBarButtonItem.init(
     title: "My Connections",
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
    
    
    func setNavigationBar() {

        /*
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 55))
        let navItem = UINavigationItem(title: "")
        navItem.rightBarButtonItem = rightButtonItem
        navItem.leftBarButtonItem = leftButtonItem
        //navItem.item = middleButtonItem
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
         */
       
        self.navigationItem.setRightBarButton(rightButtonItem, animated: false)
        self.navigationItem.setLeftBarButtonItems([leftButtonItem, middleButtonItem], animated: false)
    }

    
     // Navbar Actions
     func signOut() {
     PFUser.logOut()
     let currentUser = PFUser.current()
     if currentUser == nil {
     let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Login") as UIViewController
     self.present(viewController, animated: false, completion: nil)
     }
     
     }
     
     func goToPartners() {
     let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "myPartners") as UIViewController
     self.present(viewController, animated: false, completion: nil)
     
     
     }
     
     func goHome() {
     let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Homepage") as UIViewController
     self.present(viewController, animated: false, completion: nil)
     
     }
     
 

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
