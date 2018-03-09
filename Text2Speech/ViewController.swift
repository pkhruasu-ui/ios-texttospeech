//
//  ViewController.swift
//  Text2Speech
//
//  Created by Khruasuwan, Prajak(AWF) on 3/9/18.
//  Copyright © 2018 Khruasuwan, Prajak(AWF). All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //MARK: PROPERTIES
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var speakButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: ACTION
    @IBAction func textToSpeech(_ sender: Any) {
        print("Before speak=\(synth.isSpeaking), paused=\(synth.isPaused)")
        
        if synth.isPaused {
            // continue
            synth.continueSpeaking()
            speakButton.setTitle("Pause", for: .normal)
        } else if synth.isSpeaking {
            // pause
            synth.pauseSpeaking(at: .immediate)
            speakButton.setTitle("Play", for: .normal)
        } else {
            // start a new one
            myUtterance = AVSpeechUtterance(string: textView.text)
            myUtterance.rate = 0.3
            speakButton.setTitle("Pause", for: .normal)
            synth.speak(myUtterance)
         }
        print("After speak=\(synth.isSpeaking), paused=\(synth.isPaused)")
    }
    
    @IBAction func stopSpeech(_ sender: Any) {
        if synth.isSpeaking {
            synth.stopSpeaking(at: .immediate)
        }
    }
    
}

