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
    
  
    @IBAction func sendButton(_ sender: UIButton) {
        print("Realizando peticion")
        sendSlackMessage(message: messageInput.text!)
        statusLabel.text = "Enviado a slack"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Hola inmundo!!!")
        sendSlackMessage(message: "Inicializando iOS App")
    }
    
    func sendSlackMessage(message:String){
        let slackUrl = "https://hooks.slack.com/services/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"
        Alamofire.request(slackUrl, method: .post, parameters: ["channel": "#general", "username": "HomeOfficeBot", "text":message, "icon_emoji":":smile:"], encoding: JSONEncoding.default).responseString{ response in
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

