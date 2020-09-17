//
//  TableViewCell.swift
//  ALEFtest
//
//  Created by Malygin Georgii on 14.09.2020.
//  Copyright © 2020 Malygin Georgii. All rights reserved.
//

import UIKit

class TableViewCellInfo: UITableViewCell {
    var actionHandler: (() -> Void)? = nil
    
    static let reuseId = "infoCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    
    func configure(info: String) {
        textLabel?.text = info
        
        let deleteButton = UIButton(type: .close)
        deleteButton.addTarget(self, action: #selector(deleteinfo), for: .touchUpInside)
        deleteButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        accessoryView = deleteButton
    }
    @objc
    private func deleteinfo() {
        actionHandler?()
    }
}
