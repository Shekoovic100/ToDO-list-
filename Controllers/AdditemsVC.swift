
//  toDoADD.swift
//  ToDoList
//
//  Created by Sherif samy on 1/24/21.
//  Copyright © 2021 Sherif samy. All rights reserved.
//

import UIKit

protocol todoItems {
    func addNewItems(item :getToDo)
}
class AdditemsVC: UIViewController {
//MARK:- Outlet
    
    @IBOutlet weak var addButtonOutlet: UIButton!{
        didSet{
            
            addButtonOutlet.layer.cornerRadius = addButtonOutlet.frame.height / 5
            addButtonOutlet.layer.borderWidth = 1
            addButtonOutlet.backgroundColor = #colorLiteral(red: 1, green: 0.7568627451, blue: 0.7137254902, alpha: 1)
            addButtonOutlet.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        }
    }
    @IBOutlet weak var toDoTF: UITextField!

    
    //MARK:- Constants
    
    var delegate : todoItems?
    var myList : getToDo!
    
    static var flag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        if AdditemsVC.flag == 1 {
        delegate?.addNewItems(item: myList!)
        AdditemsVC.flag = 0
            
        }
   
      
    }
    

//MARK:- IbACtions:-
    
    @IBAction func addNewItemBtnPressed(_ sender: UIButton) {
        if toDoTF.text != "" {
            
            myList = getToDo(list: toDoTF.text!)
            AdditemsVC.flag = 1
            self.navigationController?.popViewController(animated: true)
            
        }else{
            
            let alert = UIAlertController(title: "Error", message: "Enetr item please ", preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
           
            alert.addAction(alertAction)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    //MARK:- Helper Functions :
    
    func setupUI(){
        navigationController?.navigationBar.prefersLargeTitles = false
    }

}
