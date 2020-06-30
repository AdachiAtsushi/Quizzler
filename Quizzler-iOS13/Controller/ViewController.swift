//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Updated by atsuk0r0 on 2020/06/30
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // ========= IBOutlet定義 ==========
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
    var quizBrain = QuizBrain()
            
    override func viewDidLoad() {
        super.viewDidLoad()
        // クイズを出題
        updateUI()
    }

    // ========== IBAction定義 =========
    // クイズに回答時のActionを定義
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        // ユーザの解答を取得
        let userAnswer = sender.currentTitle!
        
        // 解答をチェック処理を実施
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        // 解答が正しかった場合、ボタンの背景色を緑に更新
        if userGotItRight {
            sender.backgroundColor = UIColor.green
            // 間違えていた場合、ボタンの背景色を赤に更新
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        // 出題Noをインクリメント
        quizBrain.nextQuestion()
        
        // 時間差でボタンクリアを実施
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(styleClear), userInfo: nil, repeats: false)
        
        // クイズを出題
        updateUI()
    }
    
    // 画面要素を更新(クイズの更新、解答率をプログレスバーに反映)
    func updateUI() {
        // クイズを出題
        questionLabel.text = quizBrain.getQuestionText()
        
        // 解答を表示
        showQuizAnswers()
        
        // 解答率をプログレスバーに反映
        progressBar.progress = quizBrain.getProgress()
        
        // スコアを表示
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
    
    // 回答を表示
    func showQuizAnswers() {
        let quizAnswers = quizBrain.getQuizAnswers()
        firstButton.setTitle(quizAnswers[0], for: .normal)
        secondButton.setTitle(quizAnswers[1], for: .normal)
        thirdButton.setTitle(quizAnswers[2], for: .normal)
    }
    
    // 解答ボタンのスタイルをクリア
    @objc func styleClear() {
        firstButton.backgroundColor = UIColor.clear
        secondButton.backgroundColor = UIColor.clear
        thirdButton.backgroundColor = UIColor.clear
    }
}

