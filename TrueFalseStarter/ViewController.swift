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
                    
    /// Field to Display Questions
    @IBOutlet weak var questionField: UILabel!
    
    /// Field to Display Answer is Correct or Not
    @IBOutlet weak var checkField: UILabel!
    
    /// Field to Display Correct Answer
    @IBOutlet weak var ansField: UILabel!
    
    // Four Buttons to show Options
    @IBOutlet weak var op1Button: UIButton!
    @IBOutlet weak var op2Button: UIButton!
    @IBOutlet weak var op3Button: UIButton!
    @IBOutlet weak var op4Button: UIButton!

    // Button for Next Question or Play Again
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load Sound
        loadGameStartSound()
        
        // Play Sound
        playGameStartSound()
        
        // Display Question
        displayQuestion()
        
        // to Hide checkField
        checkField.isHidden = true
        // to Hide ansField
        ansField.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
    /// Method to Display Questions
    func displayQuestion() {
        checkField.isHidden = true
        ansField.isHidden = true
        
        // to change text of nextButton
        nextButton.setTitle("Next Question", for: .normal)
        questionsAsked += 1
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: question.count)
        
        // to change font size
        questionField.font = UIFont(name: "HelveticaNeue", size: 16.0)
        // to Display Question
        questionField.text = question[indexOfSelectedQuestion].que
        
        
        // Display Options for the Question
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
    
    /// Method to Display Score
    func displayScore() {
        
        // Hide the Fields
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
    
    /// To check the Answer
    @IBAction func checkAnswer(_ sender: UIButton) {
        
        let correctAnswer = question[indexOfSelectedQuestion].ans
        
        if ((sender === op1Button &&  correctAnswer == question[indexOfSelectedQuestion].op1) || (sender === op2Button && correctAnswer == question[indexOfSelectedQuestion].op2) || (sender === op3Button &&  correctAnswer == question[indexOfSelectedQuestion].op3) || (sender === op1Button &&  correctAnswer == question[indexOfSelectedQuestion].op4)) {
            correctQuestions += 1
            
            // Display "Correct!"
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
            // Display "Sorry, that's not it."
            checkField.isHidden = false
            checkField.textColor = UIColor.yellow
            checkField.text = "Sorry, that's not it."
            
            // Display the Corrent answer
            ansField.isHidden = false
            ansField.textColor = UIColor.green
            ansField.text = "Answer is \(correctAnswer)"
            
            // Disable Buttons
            sender.isSelected = true
            op1Button.isEnabled = false
            op2Button.isEnabled = false
            op3Button.isEnabled = false
            op4Button.isEnabled = false
            
            // Play Sound
            playGameStartSound()
        }
        
        // To prevent repetition
        question.remove(at: indexOfSelectedQuestion)
        
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
    
    // Show the answer buttons & call nextRound
    func next() {
        op1Button.isHidden = false
        op2Button.isHidden = false
        op3Button.isHidden = false
        op4Button.isHidden = false

        nextRound()
    }
    
    // Method to load Sound
    func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    // Method to play Sound
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }

}
