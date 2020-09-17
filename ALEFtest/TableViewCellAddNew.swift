//
//  TableViewCellParants.swift
//  ALEFtest
//
//  Created by Malygin Georgii on 14.09.2020.
//  Copyright © 2020 Malygin Georgii. All rights reserved.
//

import UIKit

class TableViewCellAddNew: UITableViewCell {
    var actionHandler: (() -> Void)? = nil
    static let reuseId = "addNew"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConfigure()
    }
    
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    func setupConfigure() {
        let button = UIButton(type: .contactAdd)
        addSubview(button)
        button.frame = CGRect(x: bounds.width/2, y: 2, width: 44, height: 44)
        button.addTarget(self, action: #selector(newInfo), for: .touchUpInside)
    }
    
    @objc
    private func newInfo() {
        actionHandler?()
    }
}
