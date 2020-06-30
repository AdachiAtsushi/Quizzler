//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by atsuk0r0 on 2020/06/29.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    // クイズを定義(出題内容と解答の形式)
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    // 出題No
    var questionNumber = 0
    
    // 解答数
    var successScore = 0

    // 解答をチェックする処理
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        // 解答が正しい場合
        if userAnswer == quiz[questionNumber].correctAnswer {
            successScore += 1
            return true
        }
        
        return false
    }
    
    // 解答結果を取得
    func getScore() -> Int {
        return successScore
    }
    
    // クイズを出力
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    // 解答を出力
    func getQuizAnswers() -> [String] {
        let quizAnswers = quiz[questionNumber].answer
        return quizAnswers
    }
    
    // 解答率を出力
    func getProgress() -> Float {
        let progress = Float(questionNumber) / Float(quiz.count)
        return progress
    }
    
    // 出題Noを更新する処理
    mutating func nextQuestion() {
        // 出題数がクイズ数より少ない場合
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
            // 出題数がクイズ数を上回った場合
        } else {
            // 出題Noをリセット
            questionNumber = 0
            // 解答数をリセット
            successScore = 0
        }
    }
}
