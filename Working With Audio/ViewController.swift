//
//  ViewController.swift
//  Working With Audio
//
//  Created by Yosemite on 1/24/15.
//  Copyright (c) 2015 Yosemite. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var myPlayer = AVAudioPlayer()
    
    @IBAction func playButtonPressed(sender: UIBarButtonItem) {
        myPlayer.play()
    }
    
    @IBOutlet weak var volumeSlider: UISlider!

    @IBAction func changeVolume(sender: UISlider) {
        myPlayer.volume = volumeSlider.value
    }
 
    @IBAction func pauseButtonPressed(sender: UIBarButtonItem) {
        myPlayer.pause()
    }
    
    
    @IBAction func stopButtonPressed(sender: UIBarButtonItem) {
        myPlayer.stop()
        // Stop and reset from the beginning
        myPlayer.currentTime = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Grab resource location by calling NSBundle methods
        // - An NSBundle object represents a location in the file system that groups code and resources that can be used in a program.
        // - "mainBundle" Returns the NSBundle object that corresponds to the directory where the current application executable is located
        // - "pathForResource" Returns the full pathname for the resource identified by the specified name and file extension.
        var filePath = NSBundle.mainBundle().pathForResource("prettyboy", ofType: "mp3")
        // Construct file path as URL format
        var fileURL = NSURL(fileURLWithPath: filePath!)

        var myError:NSError? = nil
        myPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: &myError)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

