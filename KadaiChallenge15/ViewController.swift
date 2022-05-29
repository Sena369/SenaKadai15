//
//  ViewController.swift
//  KadaiChallenge15
//
//  Created by 澤田世那 on 2022/05/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var itemList: [CheckItem] = [
        .init(name: "りんご", isChecked: false),
        .init(name: "みかん", isChecked: true),
        .init(name: "バナナ", isChecked: false),
        .init(name: "パイナップル", isChecked: true)]

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ItemTableViewCell.nib, forCellReuseIdentifier: ItemTableViewCell.identifier)
    }

    @IBAction func addButtonAction(_ sender: Any) {
        let secondVC = AddItemViewController.instantiate(
            didSave: { [weak self] in
                self?.itemList.append($0)
                self?.dismiss(animated: true)
                self?.tableView.reloadData()
            },
            didCancel: { [weak self] in
                self?.dismiss(animated: true)
            }
        )

        let nav = UINavigationController(rootViewController: secondVC)
        present(nav, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier,
                                                 for: indexPath)
        // swiftlint:disable:next force_cast
        as! ItemTableViewCell
        cell.configure(item: itemList[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemList[indexPath.row].isChecked.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
