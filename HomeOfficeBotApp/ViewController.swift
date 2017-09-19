//
//  ViewController.swift
//  HomeOfficeBotApp
//
//  Created by CARLO GILMAR on 9/17/17.
//  Copyright © 2017 carlogilmar. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {

    @IBOutlet weak var messageInput: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var developer: UITextField!
    @IBOutlet weak var developerStatus: UITextField!
    
  
    @IBAction func sendButton(_ sender: UIButton) {
        print("Enviando mensaje")
        let slackMessage = "*Making Devs Developer:* \(developer.text!) \n *Message:* \(messageInput.text!)"
        sendSlackMessage(message: slackMessage, emoji: ":rocket:")
        statusLabel.text = "Msg enviado a slack"
        messageInput.text = ""
    }
    
    @IBAction func sendDeveloperStatus(_ sender: UIButton) {
        print("Enviando status")
        let statusMessage = "*Making Devs Developer:* \(developer.text!) \n *Current Status:* \(developerStatus.text!)"
        sendSlackMessage(message: statusMessage, emoji: ":robot_face:")
        statusLabel.text="\(developerStatus.text!)"
        developerStatus.text=""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func sendSlackMessage(message:String, emoji:String){
        let slackUrl = "https://hooks.slack.com/services/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"
        Alamofire.request(slackUrl, method: .post, parameters: ["channel": "@carlogilmar", "username": "Home Office Bot", "text":message, "icon_emoji":emoji], encoding: JSONEncoding.default).responseString{ response in
            print("***************************")
            print(response)
            print("***************************")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

