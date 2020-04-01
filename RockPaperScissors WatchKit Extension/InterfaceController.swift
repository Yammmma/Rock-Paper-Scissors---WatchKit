//
//  InterfaceController.swift
//  RockPaperScissors WatchKit Extension
//
//  Created by yuma@duck on 22/5/18.
//  Copyright © 2018 yuma@duck. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBAction func choseRock() {
        computeData(playerObject: "✊")
    }
    
    @IBAction func chosePaper() {
        computeData(playerObject: "✋")
    }
    
    @IBAction func choseScissors() {
        computeData(playerObject: "🖖")
    }
    
    func computeData(playerObject: String) {
        let CPUchoice = arc4random_uniform(3)
        var CPUobject = ""
        
        if CPUchoice == 0 {
            CPUobject = "✊"
        } else if CPUchoice == 1 {
            CPUobject = "✋"
        } else {
            CPUobject = "🖖"
        }
        
        var result = ""
        
        if CPUobject == playerObject {
            result = "Tie!"
        }
        
        if (CPUobject == "✊" && playerObject == "🖖") ||
            (CPUobject == "✋" && playerObject == "✊") ||
            (CPUobject == "🖖" && playerObject == "✋") {
            result = "⌚️ Wins!"
        }
        
        if (playerObject == "✊" && CPUobject == "🖖") ||
            (playerObject == "✋" && CPUobject == "✊") ||
            (playerObject == "🖖" && CPUobject == "✋") {
            result = "You Win!"
        }
        
        sendData(playerChoice: playerObject, CPUchoice: CPUobject, result: result)
    }
    
    func sendData(playerChoice: String, CPUchoice: String, result: String) {
        let data = ["playerChoice" : playerChoice, "CPUchoice" : CPUchoice, "result" : result]
        pushController(withName: "Result", context: data)
    }
}
