//
//  AddSaveViewController.swift
//  MemoCount
//
//  Created by 永井涼 on 2020/11/19.
//

import UIKit
class AddSaveViewController: UIViewController {
    @IBOutlet weak var contentsTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        Alert()
        
        
        
    }
    
    
    func Alert(){
        let alert: UIAlertController = UIAlertController(title: "", message: "保存しますか？", preferredStyle: UIAlertController.Style.alert)
        
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler:{ [self] (action:UIAlertAction!)-> Void in
            let UserD = UserDefaults.standard
            if UserD.array(forKey: "memoArray") != nil {
                var saveMemoArray = UserD.array(forKey: "memoArray") as! [String]
                    saveMemoArray.append(contentsTextView.text!)
                    contentsTextView.text = ""
                    
                    UserD.set(saveMemoArray, forKey: "memoArray" )
                    UserD.synchronize()
                   
                    self.navigationController?.popViewController(animated: true)
                }
                
            }
            
        )
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel,handler:{ (action:UIAlertAction!)-> Void in
            print("キャンセル")
        })
        
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        
        self.present(
            alert,
            animated:  true,
            completion: {
                print("アラートが表示された")
            })
        
        
        
        
    }
    
}
