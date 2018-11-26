//
//  ViewController.swift
//  MemeMaker
//
//  Created by Balmes Pavlov on 11/24/18.
//  Copyright © 2018 Balmes Pavlov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topCaptionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomCaptionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    let topChoices: [CaptionOption] = [
        CaptionOption(emoji: "🐶", caption: "Yo Dawg, I Heard You So...."),
        CaptionOption(emoji: "🎧", caption: "I Heard You So....")
    ]
    let bottomChoices: [CaptionOption] = [
        CaptionOption(emoji: "📺", caption:"I Put A TV In Your TV So You Can Watch TV While You Watch TV."),
        CaptionOption(emoji: "👂", caption:"I Put A Hearing Aide In Your Ear So You Can Hear When You Need To Hear.")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        topCaptionSegmentedControl.removeAllSegments() // Clear out top segment
        bottomCaptionSegmentedControl.removeAllSegments() // Clear out bottom segment
        
        // Loop through choices and add them to respective segment control
        for (index, choice) in topChoices.enumerated() {
            topCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: index, animated: false)
        }
        
        for (index, choice) in bottomChoices.enumerated() {
            bottomCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: index, animated: true)
        }
        
        // Default to first segment control button
        topCaptionSegmentedControl.selectedSegmentIndex = 0
        bottomCaptionSegmentedControl.selectedSegmentIndex = 0

        // Allow multiple lines in the labels and center the text
        topCaptionLabel.numberOfLines = 0
        topCaptionLabel.textAlignment = .center

        bottomCaptionLabel.numberOfLines = 0
        bottomCaptionLabel.textAlignment = .center
        
        updateLabelText()
    }

    @IBAction func switchSegmentControl(_ sender: UISegmentedControl) {
        updateLabelText()
    }
    
    func updateLabelText() {
        // Set the label text
        topCaptionLabel.text = topChoices[topCaptionSegmentedControl.selectedSegmentIndex].caption
        bottomCaptionLabel.text = bottomChoices[bottomCaptionSegmentedControl.selectedSegmentIndex].caption
    }
}
