//
//  ViewController.swift
//  Catchphrase
//
//  Created by Ethan Turkeltaub on 10/24/14.
//  Copyright (c) 2014 Ethan Turkeltaub. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let catchphrase = CatchphraseModel()

    @IBOutlet var currentWord : UILabel!
    
    @IBAction func viewTapped(sender : AnyObject) {
        refreshUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Disable autorotation
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    // The only rotation option is landscape (left)
    override func supportedInterfaceOrientations() -> Int {
        return UIInterfaceOrientation.LandscapeLeft.rawValue
    }
    
    func refreshUI() {
        currentWord.text = catchphrase.nextWord()
//        currentWord.text = "tapped!"
    }
}

