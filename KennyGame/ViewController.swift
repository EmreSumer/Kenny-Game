//
//  ViewController.swift
//  KennyGame
//
//  Created by Emre Sumer on 24/01/2018.
//  Copyright © 2018 Emre Sumer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    
    @IBOutlet weak var kenny1: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    @IBOutlet weak var kenny9: UIImageView!
    
    var score = 0
    
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let recognizer1 = UITapGestureRecognizer(target:self , action: #selector(ViewController.increaseScore))
        let recognizer2 = UITapGestureRecognizer(target:self , action: #selector(ViewController.increaseScore))
        let recognizer3 = UITapGestureRecognizer(target:self , action: #selector(ViewController.increaseScore))
        let recognizer4 = UITapGestureRecognizer(target:self , action: #selector(ViewController.increaseScore))
        let recognizer5 = UITapGestureRecognizer(target:self , action: #selector(ViewController.increaseScore))
        let recognizer6 = UITapGestureRecognizer(target:self , action: #selector(ViewController.increaseScore))
        let recognizer7 = UITapGestureRecognizer(target:self , action: #selector(ViewController.increaseScore))
        let recognizer8 = UITapGestureRecognizer(target:self , action: #selector(ViewController.increaseScore))
        let recognizer9 = UITapGestureRecognizer(target:self , action: #selector(ViewController.increaseScore))
        
        kenny1.isUserInteractionEnabled = true
        kenny2.isUserInteractionEnabled = true
        kenny3.isUserInteractionEnabled = true
        kenny4.isUserInteractionEnabled = true
        kenny5.isUserInteractionEnabled = true
        kenny6.isUserInteractionEnabled = true
        kenny7.isUserInteractionEnabled = true
        kenny8.isUserInteractionEnabled = true
        kenny9.isUserInteractionEnabled = true

        kenny1.addGestureRecognizer(recognizer1)
        kenny2.addGestureRecognizer(recognizer2)
        kenny3.addGestureRecognizer(recognizer3)
        kenny4.addGestureRecognizer(recognizer4)
        kenny5.addGestureRecognizer(recognizer5)
        kenny6.addGestureRecognizer(recognizer6)
        kenny7.addGestureRecognizer(recognizer7)
        kenny8.addGestureRecognizer(recognizer8)
        kenny9.addGestureRecognizer(recognizer9)
        
        //timers
        counter = 5
        timeLabel.text = "\(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countDown), userInfo: nil, repeats: true)
    }
    @objc func increaseScore(){
        score = score + 1
        scoreLabel.text = "Score: \(score)"
        
    }
   
    @objc func countDown(){
        counter = counter - 1
        timeLabel.text = "\(counter)"
        if counter == 0 {
            timer.invalidate()
            let alert = UIAlertController(title: "Time", message: "Time is up!", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)

            
        }
    }


}

