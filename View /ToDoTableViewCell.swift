//
//  ToDoTableViewCell.swift
//  ToDoList
//
//  Created by Sherif samy on 1/24/21.
//  Copyright © 2021 Sherif samy. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
//MARK:- IBOutlets :
    @IBOutlet weak var backView: UIView!{
        didSet{
            backView.layer.cornerRadius = backView.frame.height / 5
            backView.backgroundColor = #colorLiteral(red: 1, green: 0.7568627451, blue: 0.7137254902, alpha: 1)
            backView.layer.shadowOpacity = 0.1
        }
    }
    @IBOutlet weak var lblitems: UILabel!
    @IBOutlet weak var upBtnOutlet: UIButton!
    @IBOutlet weak var downBtnOutlet: UIButton!
    //MARK:contants :
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}
