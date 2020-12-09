//
//  mojiCountViewController.swift
//  MemoCount
//
//  Created by 永井涼 on 2020/11/19.
//

import UIKit

class mojiCountViewController: UIViewController {

    @IBOutlet weak var CountTextView: UITextView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var mojiCountButton: UIButton!
    var countMemo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isToolbarHidden = true
        cornerRadius()
    }
    
    @IBAction func tapMojiCountButton(_ sender: Any) {
        countMemo = CountTextView.text.count
        countLabel.text = "\(countMemo)"
        
    }
    
    func cornerRadius() {
        mojiCountButton.layer.cornerRadius = 10
        //外枠の色を指定
        self.mojiCountButton.layer.borderColor = UIColor.white.cgColor
        //外枠の太さを指定
        self.mojiCountButton.layer.borderWidth = 5.0
    }
    
  
}
