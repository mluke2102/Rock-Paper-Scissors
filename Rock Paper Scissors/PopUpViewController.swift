//
//  PopUpViewController.swift
//  Rock Paper Scissors
//
//  Created by Matt Luke on 10/14/19.
//  Copyright © 2019 MlukeApps. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    var weaponChoice = "none"
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3, delay: 0.1, options: UIView.AnimationOptions.curveEaseOut, animations: {self.dimBackground.alpha = 0.4})
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {self.dimBackground.alpha = 0.0})
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = UIViewController()
        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        self.present(vc, animated: true, completion: nil)
        
        blurView.layer.cornerRadius = 35

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var dimBackground: UIView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    @IBAction func rockButton(_ sender: UIButton) {
        
        switch sender.tag {
        case 4:
            weaponChoice = "none"
        case 1:
            weaponChoice = "rock"
        case 2:
            weaponChoice = "paper"
        case 3:
        weaponChoice = "scissor"
        default:
            print("error")
            
        
        }
        
        performSegue(withIdentifier: "unwindToweapon", sender: self)
        
        
        
        //self.dismiss(animated: true) {
      //  }
    }
    
//    @IBAction func paperButton(_ sender: Any) {
//        
//        weaponChoice = "paper"
//        
//       // self.dismiss(animated: true) {
//      //  }
//    }
//    
//    @IBAction func scissorButton(_ sender: Any) {
//        
//        weaponChoice = "scissor"
//        
//       // self.dismiss(animated: true) {
//       // }
//    }
//    
//   
//    @IBAction func backgroundTapped(_ sender: Any) {
////self.dismiss(animated: true)
//}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let userChoice = weaponChoice
    }
   
    @IBAction func backgroundTapped(_ sender: Any) {
        self.dismiss(animated: true) 
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
