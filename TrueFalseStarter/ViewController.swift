//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox
import Foundation

class ViewController: UIViewController {
    
    let questionsPerRound = 5
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion: Int = 0
    
    var gameSound: SystemSoundID = 0

// Array of Question Set
    var question = [Que1(),
                    Que2(),
                    Que3(),
                    Que4(),
                    Que5(),
                    Que6(),
                    Que7(),
                    Que8(),
                    Que9(),
                    Que10(),
                    OldQue1(),
                    OldQue2(),
                    OldQue3()]
                    
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var checkField: UILabel!
    @IBOutlet weak var ansField: UILabel!
    
    @IBOutlet weak var op1Button: UIButton!
    @IBOutlet weak var op2Button: UIButton!
    @IBOutlet weak var op3Button: UIButton!
    @IBOutlet weak var op4Button: UIButton!

    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        // Start game
        playGameStartSound()
        displayQuestion()
        checkField.isHidden = true
        ansField.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
    func displayQuestion() {
        checkField.isHidden = true
        ansField.isHidden = true
        
        nextButton.setTitle("Next Question", for: .normal)
        questionsAsked += 1
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: question.count)
        
        questionField.font = UIFont(name: "HelveticaNeue", size: 16.0)
        questionField.text = question[indexOfSelectedQuestion].que
        
        if question[indexOfSelectedQuestion].op1 != "" {
                op1Button.isHidden = false
                op1Button.setTitle(question[indexOfSelectedQuestion].op1, for: .normal)
        } else {
            op1Button.isHidden = true
        }
        
        if question[indexOfSelectedQuestion].op2 != "" {
            op2Button.isHidden = false
            op2Button.setTitle(question[indexOfSelectedQuestion].op2, for: .normal)
        } else {
            op2Button.isHidden = true
        }
        
        if question[indexOfSelectedQuestion].op3 != "" {
            op3Button.isHidden = false
            op3Button.setTitle(question[indexOfSelectedQuestion].op3, for: .normal)
        } else {
            op3Button.isHidden = true
        }
        
        if question[indexOfSelectedQuestion].op4 != "" {
            op4Button.isHidden = false
            op4Button.setTitle(question[indexOfSelectedQuestion].op4, for: .normal)
        } else {
            op4Button.isHidden = true
        }
        
        nextButton.isHidden = true
}
    
    func displayScore() {
        
        checkField.isHidden = true
        ansField.isHidden = true
        // Hide the answer buttons
        op1Button.isHidden = true
        op2Button.isHidden = true
        op3Button.isHidden = true
        op4Button.isHidden = true
        
        // Display play again button
        nextButton.setTitle("Play Again", for: .normal)
        nextButton.isHidden = false
        
        questionField.font = UIFont(name: "HelveticaNeue", size: 25.0)
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
        questionsAsked = 0
        correctQuestions = 0
        
}
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        
        let correctAnswer = question[indexOfSelectedQuestion].ans
        
        if ((sender === op1Button &&  correctAnswer == question[indexOfSelectedQuestion].op1) || (sender === op2Button && correctAnswer == question[indexOfSelectedQuestion].op2) || (sender === op3Button &&  correctAnswer == question[indexOfSelectedQuestion].op3) || (sender === op1Button &&  correctAnswer == question[indexOfSelectedQuestion].op4)) {
            correctQuestions += 1
            
            //questionField.text = "Correct!"
            
            checkField.isHidden = false
            checkField.textColor = UIColor.green
            checkField.text = "Correct!"
            
            sender.isSelected = true
            op1Button.isEnabled = false
            op2Button.isEnabled = false
            op3Button.isEnabled = false
            op4Button.isEnabled = false
            
            playGameStartSound()
        } else {
            checkField.isHidden = false
            checkField.textColor = UIColor.yellow
            checkField.text = "Sorry, that's not it."
            ansField.isHidden = false
            ansField.textColor = UIColor.green
            ansField.text = "Answer is \(correctAnswer)"
            
            sender.isSelected = true
            op1Button.isEnabled = false
            op2Button.isEnabled = false
            op3Button.isEnabled = false
            op4Button.isEnabled = false
            playGameStartSound()
}
        
        question.remove(at: indexOfSelectedQuestion)
        
        //loadNextRoundWithDelay(seconds: 1)
        nextButton.isHidden = false
        
}
    
@IBAction func nextQue(_ sender: UIButton) {
    op1Button.isEnabled = true
    op2Button.isEnabled = true
    op3Button.isEnabled = true
    op4Button.isEnabled = true
    
    op1Button.isSelected = false
    op2Button.isSelected = false
    op3Button.isSelected = false
    op4Button.isSelected = false
    
    nextRound()
}
    
    func nextRound() {
        
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
func next() {
// Show the answer buttons
        
    op1Button.isHidden = false
    op2Button.isHidden = false
    op3Button.isHidden = false
    op4Button.isHidden = false

    nextRound()
}
    
/*
// MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
*/
 
    
    func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
}
