//
//  FirstViewController.swift
//  0517_Assignment1_감정 다이어리
//
//  Created by 김성률 on 5/18/24.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet var top_label: UILabel!
    
    @IBOutlet var UIButton1: UIButton!
    @IBOutlet var UIButton2: UIButton!
    @IBOutlet var UIButton3: UIButton!
    @IBOutlet var UIButton4: UIButton!
    @IBOutlet var UIButton5: UIButton!
    @IBOutlet var UIButton6: UIButton!
    @IBOutlet var UIButton7: UIButton!
    @IBOutlet var UIButton8: UIButton!
    @IBOutlet var UIButton9: UIButton!
    
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label4: UILabel!
    @IBOutlet var label5: UILabel!
    @IBOutlet var label6: UILabel!
    @IBOutlet var label7: UILabel!
    @IBOutlet var label8: UILabel!
    @IBOutlet var label9: UILabel!
    
    var num1: Int = .random(in: 1...100)
    var num2: Int = .random(in: 1...100)
    var num3: Int = .random(in: 1...100)
    var num4: Int = .random(in: 1...100)
    var num5: Int = .random(in: 1...100)
    var num6: Int = .random(in: 1...100)
    var num7: Int = .random(in: 1...100)
    var num8: Int = .random(in: 1...100)
    var num9: Int = .random(in: 1...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        top_label.text = "감정 다이어리"
        top_label.textColor = .black
        top_label.font = .systemFont(ofSize: 20)
        top_label.textAlignment = .center
        
        label1.text = "행복해 " + String(num1)
        label1.textAlignment = .center
        label1.textColor = .black
        
        label2.text = "사랑해 " + String(num2)
        label2.textAlignment = .center
        label2.textColor = .black
        
        label3.text = "좋아해 " + String(num3)
        label3.textAlignment = .center
        label3.textColor = .black
        
        label4.text = "당황해 " + String(num4)
        label4.textAlignment = .center
        label4.textColor = .black
        
        label5.text = "속상해 " + String(num5)
        label5.textAlignment = .center
        label5.textColor = .black
        
        label6.text = "우울해 " + String(num6)
        label6.textAlignment = .center
        label6.textColor = .black
        
        label7.text = "심심해 " + String(num7)
        label7.textAlignment = .center
        label7.textColor = .black
        
        label8.text = "따분해 " + String(num8)
        label8.textAlignment = .center
        label8.textColor = .black
        
        label9.text = "걱정해 " + String(num9)
        label9.textAlignment = .center
        label9.textColor = .black
    }
    
    @IBAction func button1(_ sender: UIButton) {
        num1 = num1 + 1
        label1.text = "행복해 " + String(num1)
    }
    
    @IBAction func button2(_ sender: UIButton) {
        num2 = num2 + 1
        label2.text = "사랑해 " + String(num2)
    }
    
    @IBAction func button3(_ sender: UIButton) {
        num3 = num3 + 1
        label3.text = "좋아해 " + String(num3)
    }
    
    @IBAction func button4(_ sender: UIButton) {
        num4 = num4 + 1
        label4.text = "당황해 " + String(num4)
    }
    
    @IBAction func button5(_ sender: UIButton) {
        num5 = num5 + 1
        label5.text = "속상해 " + String(num5)
    }
    
    @IBAction func button6(_ sender: UIButton) {
        num6 = num6 + 1
        label6.text = "우울해 " + String(num6)
    }
    
    @IBAction func button7(_ sender: UIButton) {
        num7 = num7 + 1
        label7.text = "심심해 " + String(num7)
    }
    
    @IBAction func button8(_ sender: UIButton) {
        num8 = num8 + 1
        label8.text = "따분해 " + String(num8)
    }
    
    @IBAction func button9(_ sender: UIButton) {
        num9 = num9 + 1
        label9.text = "걱정해 " + String(num9)
    }
    
}
