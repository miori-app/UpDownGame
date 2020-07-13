//
//  ViewController.swift
//  UpDownGame
//
//  Created by miori Lee on 2020/07/09.
//  Copyright © 2020 miori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //storyboard에서 갖고와
    @IBOutlet weak var slider : UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal)
    }
    
    //event driven
    @IBAction func sliderValueChanged( sender : UISlider){
        print(sender.value)
    }

    @IBAction func touchUpHitButton( sender : UIButton){
        print(slider.value)
    }
    
    @IBAction func touchUpResetButton( sender : UIButton){
        print("touch up reset button")
        
    }
}

