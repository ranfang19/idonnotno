//
//  PickViewController.swift
//  idonnotno
//
//  Created by Ran FANG on 2021/8/24.
//

import UIKit

class RandomViewController: UIViewController {
    
    @IBOutlet weak var randomResultLabel: UILabel!
    @IBOutlet weak var randomResultButton: UIButton!
    
    let randomList = ["烤串","韩餐","日料","烤鸭","湘菜","川菜","东北菜","火锅","西餐","烤肉"]

    @IBAction func randomAction(_ sender: Any) {
        randomResultLabel.text=getRandomList();
    }
    
    func getRandomList() -> String{
        return randomList[Int(arc4random_uniform(UInt32(randomList.count)))];
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
   

}
