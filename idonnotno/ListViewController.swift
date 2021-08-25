//
//  ListViewController.swift
//  idonnotno
//
//  Created by Ran FANG on 2021/8/24.
//

import UIKit

// DataSource ==> Provide data
// Delegate ==> Receive UITableView events
class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Delegate ==> Tells the delegate a row is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("1111")
    }
    // DataSource ==> 返回row数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[p].count
    }
    // DataSource ==> 为每行提供cell。先通过identifier绑定cell，然后显示cell的相关信息
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text=list[p][indexPath.row]
        return cell
    }
    // return the type of edting style
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    // Delete action
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            list[p].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            
        }
    }
    
    @IBOutlet weak var nameSegmentedControl:UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addButtonLabel: UIButton!
    
    
    var list = [["🦆烤鸭鸭","🍗韩餐","🔥火锅","🥗沙拉","🍜拉面","🍡串串"],["⚠️不好吃的1","⚠️不好吃的2","⚠️不好吃的3","⚠️不好吃的4","⚠️不好吃的5","⚠️不好吃的6"]]
    
    var p : Int = 0
    
    @IBAction func controlValueChanged(_ sender: UISegmentedControl) {
        p = sender.selectedSegmentIndex
        tableView.reloadData()
    }
    
    
    @IBAction func addButtonAction(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        p=0
    }
    

}
