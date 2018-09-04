//
//  ViewController.swift
//  Addition Game iOS 10
//
//  Created by sarcrates on 4/29/17.
//  Copyright © 2017 sarcrates. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
	@IBOutlet weak var AddtionGameLabel: UILabel!
	@IBOutlet weak var QuestionLabel: UILabel!
	@IBOutlet weak var CorrectTotalLabel: UILabel!
	@IBOutlet weak var CorrectIncorrectLabel: UILabel!
	
	@IBOutlet weak var Answer0: UIButton!
	@IBOutlet weak var Answer1: UIButton!
	@IBOutlet weak var Answer2: UIButton!
	@IBOutlet weak var Answer3: UIButton!
	
	@IBOutlet weak var achievementlabel: UILabel!
	
	
	var firstNumber : Int = 0
	var secondNumber : Int = 0
	var answer : Int = 0
	
	var correctTotal : Int = 0
	var correctIncorrect = ""
	
	var RandomButton : Int = 0
	
	var incorrectAnswer1 : Int = 0
	var incorrectAnswer2 : Int = 0
	var incorrectAnswer3 : Int = 7

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		randomNumbers()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func randomNumbers(){
		firstNumber = Int(arc4random_uniform(9))
		secondNumber = Int(arc4random_uniform(9))
		answer = firstNumber + secondNumber
		
		incorrectAnswer1 = Int(arc4random_uniform(5))
		incorrectAnswer2 = Int(arc4random_uniform(2))
		RandomButton = Int(arc4random_uniform(4))
		
		printMathQuestion()
		ShowTextOnButton()
		showCorrectIncorrect()
	}
	func RandomCheck(){
		if answer == incorrectAnswer1 || answer == incorrectAnswer2 || incorrectAnswer1 == incorrectAnswer2{
			incorrectAnswer1 = Int(arc4random_uniform(3))
			incorrectAnswer2 = 0
			
			
			if answer == incorrectAnswer1 || answer == incorrectAnswer2 || incorrectAnswer1 == incorrectAnswer2{
				incorrectAnswer1 = 20
				incorrectAnswer2 = 21
			}
			
		}
		
		
	}
	
	func printMathQuestion(){
		QuestionLabel.text = "\(firstNumber) + \(secondNumber) = ?"
	}

	func ShowTextOnButton(){
		if RandomButton == 0{
			
			Answer0.setTitle("\(answer)", for: UIControl.State())
			Answer1.setTitle("\(incorrectAnswer1)", for: UIControl.State())
			Answer2.setTitle("\(incorrectAnswer2)", for: UIControl.State())
			Answer3.setTitle("\(incorrectAnswer3)", for: UIControl.State())
			
		}
		if RandomButton == 1{
			
			Answer1.setTitle("\(answer)", for: UIControl.State())
			Answer0.setTitle("\(incorrectAnswer1)", for: UIControl.State())
			Answer2.setTitle("\(incorrectAnswer2)", for: UIControl.State())
			Answer3.setTitle("\(incorrectAnswer3)", for: UIControl.State())
			
		}
		if RandomButton == 2{
			
			Answer2.setTitle("\(answer)", for: UIControl.State())
			Answer1.setTitle("\(incorrectAnswer3)", for: UIControl.State())
			Answer0.setTitle("\(incorrectAnswer2)", for: UIControl.State())
			Answer3.setTitle("\(incorrectAnswer1)", for: UIControl.State())
			
		}
		if RandomButton == 3{
			
			Answer3.setTitle("\(answer)", for: UIControl.State())
			Answer1.setTitle("\(incorrectAnswer1)", for: UIControl.State())
			Answer2.setTitle("\(incorrectAnswer2)", for: UIControl.State())
			Answer0.setTitle("\(incorrectAnswer3)", for: UIControl.State())
			
		}
		
	}
	
	@IBAction func Answer0Action(_ sender: UIButton) {
		if RandomButton == 0{
			button0correct()
		}
		else if RandomButton != 0{
			gotincorrectAnswer()
		}
		
		randomNumbers()
		
	}
	@IBAction func Answer1Action(_ sender: UIButton) {
		if RandomButton == 1{
			button1correct()
		}
		else if RandomButton != 1{
			gotincorrectAnswer()
		}
		
		randomNumbers()
		
	}
	@IBAction func Answer2Action(_ sender: UIButton) {
		if RandomButton == 2{
			button2correct()
		}
		else if RandomButton != 2{
			gotincorrectAnswer()
		}
		
		randomNumbers()
		
	}

	@IBAction func Answer3Action(_ sender: UIButton) {
		if RandomButton == 3{
			button3correct()
		}
		else if RandomButton != 3{
			gotincorrectAnswer()
		}
		
		randomNumbers()
		
	}
	func button0correct(){
		checkingForCorrectAnswer()
	}
	func button1correct(){
		checkingForCorrectAnswer()
	}
	
	func button2correct(){
		checkingForCorrectAnswer()
	}
	func button3correct(){
		checkingForCorrectAnswer()
	}
	func gotincorrectAnswer(){
		correctIncorrect = "Incorrect"
	}
	
	func checkingForCorrectAnswer(){
		correctTotal = correctTotal + 1
		correctIncorrect = "Correct"
//		playSound()
	}
	
	func showCorrectIncorrect(){
		CorrectTotalLabel.text = "Total Correct: \(correctTotal)"
		CorrectIncorrectLabel.text = "\(correctIncorrect)"
	}
	
	@IBAction func ResetAction(_ sender: UIButton) {
		correctTotal = 0
		CorrectTotalLabel.text = "Total Correct: \(correctTotal)"
	}
	
	
//	var player: AVAudioPlayer?
//	func playSound(){
//		guard let url = Bundle.main.url(forResource: "Ding", withExtension: "m4a") else {
//			print("not playing")
//			return
//		}
//		do {

//			try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
//			try! AVAudioSession.sharedInstance().setActive(true)
//			player = try! AVAudioPlayer.init(contentsOf: url, fileTypeHint: AVFileTypeMPEG4)
//			player!.play()
//		} catch let error as NSError{
//			print ("error: \(error.localizedDescription)")
//		}
//	}
}

