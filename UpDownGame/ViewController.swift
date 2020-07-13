//
//  ViewController.swift
//  UpDownGame
//
//  Created by miori Lee on 2020/07/09.
//  Copyright © 2020 miori. All rights reserved.
//

import UIKit

//class 안에 들어있는 함수는 method라고 함

class ViewController: UIViewController {
    
    var randomValue = 0
    var tryCnt : Int = 0
    
    //storyboard에서 갖고와
    /*
     IBOutlet : 클래스의 프로퍼티와 인터페이스 빌더의 요소를 연결하기 위해 프로퍼티 앞에 붙이는 어노테이션(Annotation)
     */
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var tryCntLabel : UILabel!
    @IBOutlet weak var slierValueLabel : UILabel!
    @IBOutlet weak var minValueLabel : UILabel!
    @IBOutlet weak var maxValueLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal)
        reset()
    }
    /*
     @IBAction : 클래스의 액션 메서드와 인터페이스 빌더의 이벤트를 연결하기 위해 메서드 앞에 붙이는 어노테이션(Annotation)
     */
    
    //event driven
    @IBAction func sliderValueChanged( sender : UISlider){
        print(sender.value)
        let integerValue = Int(sender.value)
        slierValueLabel.text = String(integerValue)
    }
    
    func showAlert(message:String){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.reset()
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    @IBAction func touchUpHitButton( sender : UIButton){
        print(slider.value)
        let hitValue = Int(slider.value)
        slider.value = Float(hitValue)
        tryCnt += 1
        //tryCntLabel.text = String(tryCnt) + " / 5"
        tryCntLabel.text = "\(tryCnt) / 5"
        
        if randomValue == hitValue{
            //print("you hit!")
            showAlert(message: "You Hit!")
            reset()
        }else if tryCnt >= 5 {
            //print("you lose!")
            showAlert(message: "You Lose...")
            reset()
        }else if randomValue < hitValue {
            slider.maximumValue = Float(hitValue)
            maxValueLabel.text = "\(hitValue)"
        }else{
            slider.minimumValue = Float(hitValue)
            minValueLabel.text = "\(hitValue)"
        }
    }
    
    @IBAction func touchUpResetButton( sender : UIButton){
        print("touch up reset button")
        reset()
    }
    
    @IBAction func reset(){
        print("reset")
        randomValue = Int.random(in: 0...30)
        print(randomValue)
        // ...은 범위 연산자. 폐쇠연산자(양쪽 다 포함)
        //사용자 시도횟수 초기화
        tryCnt = 0
        tryCntLabel.text = "0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        minValueLabel.text = "0"
        maxValueLabel.text = "30"
        slierValueLabel.text = "15"
        
    }
}

