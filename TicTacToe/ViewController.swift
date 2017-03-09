//
//  ViewController.swift
//  TicTacToe
//
//  Created by Jonathan Salin Lee on 3/8/17.
//  Copyright © 2017 Jonathan Salin Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var gameboard = [UIButton]()
    var player1: [Int] = [0,0,0,0,0,0,0,0,0]
    var player2: [Int] = [0,0,0,0,0,0,0,0,0]
    var whoseTurn = 0
    
    @IBOutlet weak var topLeft: UIButton!
    @IBOutlet weak var topMiddle: UIButton!
    @IBOutlet weak var topRight: UIButton!
    @IBOutlet weak var middleLeft: UIButton!
    @IBOutlet weak var middle: UIButton!
    @IBOutlet weak var middleRight: UIButton!
    @IBOutlet weak var bottomLeft: UIButton!
    @IBOutlet weak var bottomMiddle: UIButton!
    @IBOutlet weak var bottomRight: UIButton!
    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBAction func box(_ sender: UIButton) {
        if whoseTurn % 2 == 0{
            for i in 0..<gameboard.count{
                if sender.tag == i + 1{
                    sender.isEnabled = false
                    sender.backgroundColor = UIColor.blue
                    player1[i] = sender.tag
                }
            }
        } else{
            for i in 0..<gameboard.count{
                if sender.tag == i + 1{
                    sender.isEnabled = false
                    sender.backgroundColor = UIColor.red
                    player2[i] = sender.tag
                }
            }
        }
        whoseTurn += 1
        if !winCheck() && whoseTurn == 9{
           winnerLabel.text = "You both lose!"
        }
    }
    
    func winCheck() -> Bool{
        let player1Set = Set(player1)
        let player2Set = Set(player2)
        let solutionSet1 = Set([1,2,3])
        let solutionSet2 = Set([4,5,6])
        let solutionSet3 = Set([7,8,9])
        let solutionSet4 = Set([1,4,7])
        let solutionSet5 = Set([2,5,8])
        let solutionSet6 = Set([3,6,9])
        let solutionSet7 = Set([1,5,9])
        let solutionSet8 = Set([3,5,7])
//        let solution1 = [1,2,3]
//        let solution2 = [4,5,6]
//        let solution3 = [7,8,9]
//        let solution4 = [1,4,7]
//        let solution5 = [2,5,8]
//        let solution6 = [3,6,9]
//        let solution7 = [1,5,9]
//        let solution8 = [3,5,7]
        if solutionSet1.isSubset(of: player1Set) ||
            solutionSet2.isSubset(of: player1Set) ||
            solutionSet3.isSubset(of: player1Set) ||
            solutionSet4.isSubset(of: player1Set) ||
            solutionSet5.isSubset(of: player1Set) ||
            solutionSet6.isSubset(of: player1Set) ||
            solutionSet7.isSubset(of: player1Set) ||
            solutionSet8.isSubset(of: player1Set){
            winnerLabel.text = "Blue Wins!"
            for button in gameboard{
                button.isEnabled = false
            }
            return true
        } else if solutionSet1.isSubset(of: player2Set) ||
            solutionSet2.isSubset(of: player2Set) ||
            solutionSet3.isSubset(of: player2Set) ||
            solutionSet4.isSubset(of: player2Set) ||
            solutionSet5.isSubset(of: player2Set) ||
            solutionSet6.isSubset(of: player2Set) ||
            solutionSet7.isSubset(of: player2Set) ||
            solutionSet8.isSubset(of: player2Set){
            winnerLabel.text = "Red Wins!"
            for button in gameboard{
                button.isEnabled = false
            }
            return true
        } else{
            return false
        }
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        for button in gameboard{
            button.isEnabled = true
            button.backgroundColor = UIColor.gray
        }
        winnerLabel.text = ""
        whoseTurn = 0
        player1 = [0,0,0,0,0,0,0,0,0]
        player2 = [0,0,0,0,0,0,0,0,0]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameboard.append(topLeft)
        gameboard.append(topMiddle)
        gameboard.append(topRight)
        gameboard.append(middleLeft)
        gameboard.append(middle)
        gameboard.append(middleRight)
        gameboard.append(bottomLeft)
        gameboard.append(bottomMiddle)
        gameboard.append(bottomRight)
        for button in gameboard{
            button.backgroundColor = UIColor.gray
        }
        winnerLabel.text = ""
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

