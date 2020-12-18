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
    var memoArray = [String]()
    let userD = Foundation.UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        cornerRadius()
        setupTableView()
        UserDefaults()
    
    }
    override func viewWillAppear(_ animated: Bool) {
        memoTableView.reloadData()
        loadMemo()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toEditViewController"{
                //detailViewControllerを取得
                //as! DetailViewControllerでダウンキャストしている
                let editVC = segue.destination as! EditViewController
                //遷移前に選ばれているCellが取得できる
                let selectedIndexPath = memoTableView.indexPathForSelectedRow!
                editVC.selectedMemo = memoArray[selectedIndexPath.row]
                editVC.selectedRow = selectedIndexPath.row
            }
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
    
    func loadMemo(){
        if Foundation.UserDefaults.standard.array(forKey: "memoArray") != nil{
            memoArray = userD.array(forKey: "memoArray") as![String]
                memoTableView.reloadData()
            }
        
    }
    
    func UserDefaults() {
        if Foundation.UserDefaults.standard.object(forKey: "memoArray") != nil {
            memoArray = userD.object(forKey: "memoArray") as! [String]
                
            }
        }
}
    


extension MemoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath) {
        self.performSegue(withIdentifier: "toEditViewController", sender: nil)
        memoTableView.deselectRow(at: indexPath, animated: true)
        }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

            if editingStyle == .delete {
                memoArray.remove(at: indexPath.row)
                userD.set(memoArray, forKey: "memoArray")

                //tableViewを更新
                tableView.reloadData()
            }
        }
    }
    


extension MemoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoArray.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let memoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath)
        memoTableViewCell.selectionStyle = .none
        memoTableViewCell.textLabel?.text = memoArray[indexPath.row]
        memoTableViewCell.textLabel?.textColor = .black
        memoTableViewCell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        return memoTableViewCell
    }
    
    
}
