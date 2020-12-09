//
//  EditViewController.swift
//  MemoCount
//
//  Created by 永井涼 on 2020/11/26.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var memoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Foundation.UserDefaults.standard.object(forKey: "MemoArray" + memoNo) != nil {
            MemoArray = Foundation.UserDefaults.standard.object(forKey: "MemoArray" + memoNo) as! [String]
                
            
            memoTextView.text = "\(MemoArray)"
            }

        
    }
    

  

}
