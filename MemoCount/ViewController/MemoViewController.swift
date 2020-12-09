//
//  MemoViewController.swift
//  MemoCount
//
//  Created by 永井涼 on 2020/11/19.
//

import UIKit

class MemoViewController: UIViewController {
    
    
    @IBOutlet weak var memoAddButton: UIButton!
    @IBOutlet weak var memoTableView: UITableView!
    var memoNO = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cornerRadius()
        setupTableView()
        UserDefaults()
    
    }
    override func viewWillAppear(_ animated: Bool) {
        memoTableView.reloadData()
    }
        
    
    @IBAction func tapMemoAddButton(_ sender: Any) {
        self.performSegue(withIdentifier: "SaveScreen", sender: nil)
    }
    
    func cornerRadius()  {
        memoTableView.layer.cornerRadius = 20
        memoAddButton.layer.cornerRadius = 35
    }
    
    
    func setupTableView() {
        memoTableView.delegate = self
        memoTableView.dataSource = self
    }
    
    func UserDefaults() {
        if Foundation.UserDefaults.standard.object(forKey: "MemoTitleArray" + memoNO) != nil {
            MemoTitleArray = Foundation.UserDefaults.standard.object(forKey: "MemoTitleArray" + memoNO) as! [String]
                
            }
        }
}
    


extension MemoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath) {
        
        memoNO = String(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "toEditViewController", sender: nil)
        }
    }
    


extension MemoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MemoTitleArray.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let titleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath)
        titleTableViewCell.selectionStyle = .none
        titleTableViewCell.textLabel?.text = MemoTitleArray[indexPath.row]
        titleTableViewCell.textLabel?.textColor = .black
        titleTableViewCell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        
                return titleTableViewCell
    }
    
    
}
