//
//  EditViewController.swift
//  MemoCount
//
//  Created by 永井涼 on 2020/11/26.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var memoTextView: UITextView!
    var selectedRow: Int!
    var selectedMemo : String!
    override func viewDidLoad() {
        super.viewDidLoad()
            memoTextView.text = selectedMemo
            }

        
    }

