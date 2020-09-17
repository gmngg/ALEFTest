//
//  ViewController.swift
//  ALEFtest
//
//  Created by Malygin Georgii on 14.09.2020.
//  Copyright © 2020 Malygin Georgii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var family = [Family]()

    override func viewDidLoad() {
        setupView()
        super.viewDidLoad()
        
        family = [Family(name: "Parents", info: []),
                  Family(name: "Cilds", info: [])
        ]
    }
    
    func setupView() {
        title = "Дети"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupTableView()
    }
    
    func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.register(TableViewCellAddNew.self, forCellReuseIdentifier: "addNew")
        tableView.register(TableViewCellInfo.self, forCellReuseIdentifier: "infoCell")
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    var tableView = UITableView()
    
    func deleteInfo(cell: UITableViewCell) {
        guard let index = tableView.indexPath(for: cell) else {
            return
        }
        family[index.section].info?.remove(at: index.row)
        tableView.reloadData()
    }
    
    func showAlertCreateInfo(section: Int) {
        var title: String
        if section == 0 {
            title = family[section].name!
        }else {
            title = family[section].name!
        }
        let alert = UIAlertController(title: "Add \(title)", message: nil, preferredStyle: .alert)
        alert.addTextField { tf in tf.placeholder = "Name"}
        alert.addTextField { tf in tf.placeholder = "Age"
            tf.keyboardType = .numbersAndPunctuation
        }
        let action = UIAlertAction(
            title: "Соханить", style: .default, handler: { [weak self] action in
                guard let name = alert.textFields?.first?.text,
                    let age = alert.textFields?.last?.text
                    else {
                        return
                }
                let fullInfo = "Имя: \(name), возраст: \(age)"
                self?.family[section].info?.append(fullInfo)
                self?.tableView.reloadData()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return family.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let wtf = family[indexPath.section].info?.count
        if indexPath.row == wtf! {
            guard var cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellAddNew.reuseId, for: indexPath) as? TableViewCellAddNew else {
                return UITableViewCell()
            }
            cell = TableViewCellAddNew(style: .subtitle, reuseIdentifier: TableViewCellAddNew.reuseId)
            cell.actionHandler = { [weak self] in
                self?.showAlertCreateInfo(section: indexPath.section)
            }
            return cell
        }
        else {
            guard var cell = tableView.dequeueReusableCell(
                withIdentifier: TableViewCellInfo.reuseId, for: indexPath) as? TableViewCellInfo
            else {
                    return UITableViewCell()
            }
            cell = TableViewCellInfo(style: .value1, reuseIdentifier: TableViewCellInfo.reuseId)
            guard let info = family[indexPath.section].info?[indexPath.row] else {
                return UITableViewCell()
            }
            cell.configure(info: info)
            cell.actionHandler = { [weak self] in
                self?.deleteInfo(cell: cell)
            }
                return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            if family[section].info?.count == 0 {
                return 1
            }
            else {
                var count = family[section].info?.count ?? 0
                count += 1
                return count
            }
        case 1:
            if family[0].info?.count == 0 {
                return 0
            } else if family[section].info?.count == 0 {
                return 1
            }
            else {
                var count = family[section].info?.count ?? 0
                count += 1
                if count == 6 {
                    return family[section].info?.count ?? 1
                }
                else {
                    return count
                }
            }
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return family[section].name
        case 1:
            return family[section].name
        default:
            return "Error"
        }
    }
}
