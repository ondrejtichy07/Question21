//
//  ViewController.swift
//  Question21
//
//  Created by Ondřej on 04.10.17.
//  Copyright © 2017 Ondřej. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var questions = ["How are you?",
                     "How old are you?",
                     "What's your mother's name?",
                     "Do you have a simbling?",
                     "Do you like these questions?",
                     "Do you vote?"]
   
    
    var questionIndex = 0
    var player = 0
    
    @IBOutlet weak var questionsLabel: UILabel!
    @IBOutlet weak var nextQbutton: UIButton!
    @IBOutlet weak var nextQbutton2: UIButton!
    
    @IBAction func nextButton(_ sender: Any)
    {
        checkPlayer()
    }
    
    func checkPlayer()
    {
        if player % 2 == 0
        {
            nextQbutton2.isHidden = false
            nextQbutton.isHidden = true
            nextQbutton2.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            questionsLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            
            testEnd()
            
            player += 1
        }
        else
        {
            nextQbutton.isHidden = false
            nextQbutton2.isHidden = true
            questionsLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi*2)
            
            testEnd()
            
            player += 1
        }
        
    }
    
    func testEnd ()
    {
        questionIndex += 1
        
            
        if questionIndex == questions.count
        {
            questionsLabel.text = nil
            nextQbutton2.isHidden = true
            nextQbutton.isHidden = true
            
            let alert = UIAlertController(title: "Notice", message: "That's all! Thank you! Do you want to start over?", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: {action in
                self.questionIndex = 0
                self.questionsLabel.text = self.questions[self.questionIndex]
                self.nextQbutton.isHidden = false
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
        
        else if questionIndex < questions.count
        {
            questionsLabel.text = questions[questionIndex]
        }
        
    }
    
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        nextQbutton2.isHidden = true
        nextQbutton.isHidden = false
        questionsLabel.text = questions[questionIndex]
    }
    
}

