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
    
    var kennyArray = [UIImageView]()
    
    var hideTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let highScore = UserDefaults.standard.object(forKey: "highscore")
        if highScore==nil{
            highscoreLabel.text = "0"
        }
        if let newScore = highScore as? Int {
            highscoreLabel.text=String(newScore)
        }
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
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.hideKenny), userInfo: nil, repeats: true)
        //arrays
        kennyArray.append(kenny1)
        kennyArray.append(kenny2)
        kennyArray.append(kenny3)
        kennyArray.append(kenny4)
        kennyArray.append(kenny5)
        kennyArray.append(kenny6)
        kennyArray.append(kenny7)
        kennyArray.append(kenny8)
        kennyArray.append(kenny9)
        hideKenny()
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
            hideTimer.invalidate()
            if self.score > Int(highscoreLabel.text!)!{
                UserDefaults .standard.set(self.score, forKey: "highscore")
                highscoreLabel.text = "High Score: \(self.score)"
            }
            let alert = UIAlertController(title: "Time", message: "Time is up!", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default)
            let replayButton = UIAlertAction(title: "Replay", style: .default, handler: { (UIAlertAction) in
                
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 30
                self.timeLabel.text = "\(self.counter)"
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.hideKenny), userInfo: nil, repeats: true)
                
            })
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func hideKenny(){
        for kenny in kennyArray{
            kenny.isHidden = true
        }
        let random = Int(arc4random_uniform(UInt32(kennyArray.count-1)))
        kennyArray[random].isHidden=false
    }


}

