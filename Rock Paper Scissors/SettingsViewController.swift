//
//  SettingsViewController.swift
//  Rock Paper Scissors
//
//  Created by Matt Luke on 10/17/19.
//  Copyright © 2019 MlukeApps. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    

    @IBOutlet weak var applyButtonView: UIView!
    @IBOutlet weak var backgroundCollectionView: UICollectionView!
    
    
    var backgrounds = [String]()
    var backgroundChoice = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundCollectionView.delegate = self
        backgroundCollectionView.dataSource = self
        applyButtonView.layer.cornerRadius = 10
        backgrounds = ["blue","green","red","purple"]
        
    }
    
    @IBAction func applyClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "unwindTobackground", sender: self)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return backgrounds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let backgroundCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! BackgroundCell
        
         let backgroundChoice = backgrounds[indexPath.row]
         backgroundCell.backgroundChoice = backgroundChoice
        
        
         backgroundCell.contentView.layer.masksToBounds = true
        return backgroundCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        backgroundChoice = indexPath.row
        
        
        
        if backgroundChoice == 0
        {
            applyButtonView.backgroundColor = UIColor.blue
        }
        else if backgroundChoice == 1
        {
            applyButtonView.backgroundColor = UIColor.green
        }
        else if backgroundChoice == 2
        {
            applyButtonView.backgroundColor = UIColor.red
        }
        else if backgroundChoice == 3
        {
            applyButtonView.backgroundColor = UIColor.purple
        }
        else
        {
            applyButtonView.backgroundColor = UIColor.blue
        }
        
       
        
        
        
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
