//
//  ResultInterfaceController.swift
//  RockPaperScissors WatchKit Extension
//
//  Created by yuma@duck on 22/5/18.
//  Copyright © 2018 yuma@duck. All rights reserved.
//

import WatchKit
import Foundation


class ResultInterfaceController: WKInterfaceController {
    @IBOutlet var playerChoiceLabel: WKInterfaceLabel!
    @IBOutlet var CPUchoiceLabel: WKInterfaceLabel!
    @IBOutlet var resultLabel: WKInterfaceLabel!
    @IBOutlet var bgGroup: WKInterfaceGroup!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        guard let data = context as? Dictionary<String, String> else { return }
        playerChoiceLabel.setText(data["playerChoice"])
        CPUchoiceLabel.setText(data["CPUchoice"])
        resultLabel.setText(data["result"])
        
        if data["result"] == "You Win!" {
            bgGroup.setBackgroundImage(#imageLiteral(resourceName: "win"))
        } else if data["result"] == "⌚️ Wins!" {
            bgGroup.setBackgroundImage(#imageLiteral(resourceName: "lose"))
        } else {
            bgGroup.setBackgroundImage(#imageLiteral(resourceName: "tie"))
        }
    }
}
