//
//  ViewController.swift
//  Rock Paper Scissors
//
//  Created by Matt Luke on 10/14/19.
//  Copyright © 2019 MlukeApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var comChoice = 100
    var winner = "nobody"
    var weaponChoice = ""
    var playerScore = 0
    var computerScore = 0

    @IBOutlet weak var chooseButton: UIVisualEffectView!
    @IBOutlet weak var shootButton: UIVisualEffectView!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var computerImage: UIImageView!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var computerScoreLabel: UILabel!
    @IBOutlet weak var settingsBlur: UIVisualEffectView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        chooseButton.layer.cornerRadius = 20
        shootButton.layer.cornerRadius = 20
        settingsBlur.layer.cornerRadius = 15
    }
    
    @IBAction func unwindToweapon(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source as? PopUpViewController
        let choice = sourceViewController?.weaponChoice
        
        if choice == "rock"
        {
            playerImage.image = UIImage(named: "Rock")
        }
        else if choice == "paper"
        {
            playerImage.image = UIImage(systemName: "doc.fill")
        }
        else if choice == "scissor"
        {
            playerImage.image = UIImage(systemName: "scissors")
        }
        else
        {
            playerImage.image = UIImage(systemName: "nosign")
        }
        
        weaponChoice = choice!
        
        print("the choice is \(weaponChoice)")
        
        // Use data from the view controller which initiated the unwind segue
    }
    
    @IBAction func unwindTobackground(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source as? SettingsViewController
        let choice = sourceViewController?.backgroundChoice
        
        var userChoice = ""
        
        if choice == 0
        {
            userChoice = "blue"
        }
        else if choice == 1
        {
            userChoice = "green"
        }
        else if choice == 2
        {
            userChoice = "red"
        }
        else if choice == 3
        {
            userChoice = "purple"
        }
        else
        {
            userChoice = "blue"
        }
        
        print("Background is \(userChoice)")
        
        
        
        backgroundImage.image = UIImage(named: userChoice)
        
    }
    
    @IBAction func shootTapped(_ sender: Any) {
        
        shootFunction()
        
        if winner == "player"
        {
            winnerLabel.text = "You win!"
            
            playerScore = playerScore + 1
            playerScoreLabel.text = String(playerScore)
            
            let playerWinAlert = UIAlertController(title: "You Win!", message: "", preferredStyle: .alert)

            playerWinAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(_: UIAlertAction!) in
            self.performSegue(withIdentifier: "presentSelector", sender: nil)
            }))
            
            self.present(playerWinAlert, animated: true)
            }
        else if winner == "computer"
        {
            winnerLabel.text = "Computer wins"
            
            computerScore = computerScore + 1
            computerScoreLabel.text = String(computerScore)
            
            let computerWinAlert = UIAlertController(title: "The computer wins", message: "", preferredStyle: .alert)

            computerWinAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(_: UIAlertAction!) in
            self.performSegue(withIdentifier: "presentSelector", sender: nil)
                }))
            
            self.present(computerWinAlert, animated: true)
        }
        else if winner == "tie"
        {
            winnerLabel.text = "It's a tie"
            
            let tieAlert = UIAlertController(title: "It's a tie", message: "", preferredStyle: .alert)

            tieAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(_: UIAlertAction!) in
                self.performSegue(withIdentifier: "presentSelector", sender: nil)
            }))
            
            
            self.present(tieAlert, animated: true)
        }
        else
        {
            winnerLabel.text = "No Winners"
            
        }
        
        
        
    }
    
   
    
    
    
    func shootFunction()
    {
        
        
        
        //Changing computer image
        comChoice = Int.random(in: 0 ..< 3)
        print(comChoice)
        
        if comChoice == 0
        {
            computerImage.image = UIImage(named: "Rock")
        }
        else if comChoice == 1
        {
            computerImage.image = UIImage(systemName: "doc.fill")
        }
        else if comChoice == 2
        {
            computerImage.image = UIImage(systemName: "scissors")
        }
        else
        {
            computerImage.image = UIImage(systemName: "nosign")
        }
        
        
        //Deciding who is winner
        if weaponChoice == "rock"
        {
            if comChoice == 0
            {
                winner = "tie"
            }
            else if comChoice == 1
            {
                winner = "computer"
            }
            else if comChoice == 2
            {
                winner = "player"
            }
            else
            {
                winner = "nobody"
            }
        }
        else if weaponChoice == "paper"
        {
            if comChoice == 0
            {
                winner = "player"
            }
            else if comChoice == 1
            {
                winner = "tie"
            }
            else if comChoice == 2
            {
                winner = "computer"
            }
            else
            {
                winner = "nobody"
            }
        }
        else if weaponChoice == "scissor"
        {
            if comChoice == 0
            {
                winner = "computer"
            }
            else if comChoice == 1
            {
                winner = "player"
            }
            else if comChoice == 2
            {
                winner = "tie"
            }
            else
            {
                winner = "nobody"
            }
        }
        else
        {
            playerImage.image = UIImage(systemName: "nosign")
        }
        
        print(winner)
        
    }
    
    
    
    
}

