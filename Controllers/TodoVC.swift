//
//  ViewController.swift
//  ToDoList
//
//  Created by Sherif samy on 1/24/21.
//  Copyright © 2021 Sherif samy. All rights reserved.
//

import UIKit

class TodoVC: UIViewController {

  var arrname : [getToDo] = []
    
    //MARK:- IBOutlets:
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         setupUI()
    }
//MARK:- IBActions:-
    
    @IBAction func gotToAddVC(_ sender: UIBarButtonItem) {
        
        let addvc = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(identifier: "AdditemsVC")as!AdditemsVC
        addvc.delegate = self
        self.navigationController?.pushViewController(addvc, animated: true)
    }
    
    
    @objc func upBtnPressed(_ sender: UIButton){
        if sender.tag != 0{
            arrname.swapAt(sender.tag, sender.tag - 1 )
            tableView.reloadData()
        }
        
          
      }
    
    @objc func downBtnPressed(_ sender: UIButton){
        if sender.tag != arrname.count - 1 {
            arrname.swapAt(sender.tag, sender.tag + 1)
            tableView.reloadData()
        }
        
        
    }
    
    
  
//MARK:- Function Helper :
    
    func setupUI(){
        
       // tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        navigationController?.navigationBar .prefersLargeTitles = true
    }

    
}

//MARK:- Extensions :-

extension TodoVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrname.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)as!ToDoTableViewCell
        cell.lblitems.text = arrname[indexPath.row].list
        
        cell.upBtnOutlet.tag = indexPath.row
        cell.downBtnOutlet.tag = indexPath.row
        cell.upBtnOutlet.addTarget(self, action: #selector(self.upBtnPressed(_:)),for:.touchUpInside)
        cell.downBtnOutlet.addTarget(self, action: #selector(self.downBtnPressed(_:)),for: .touchUpInside)
        return cell
    }
      
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return Constants.SCREENHEIGHT / 8
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let del = UIContextualAction(style: .normal, title: "Delete") { (action, view, completion) in
            
            self.arrname.remove(at: indexPath.row)
            self.tableView.reloadData()
            
        }
        
        let swip = UISwipeActionsConfiguration(actions: [del])
        swip.performsFirstActionWithFullSwipe = false
        return swip
        
    }
    
}
extension TodoVC : todoItems{
    func addNewItems(item: getToDo) {
        arrname.append(item)
        tableView.reloadData()
    }
    
    
}

