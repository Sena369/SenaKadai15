//
//  AddItemViewController.swift
//  KadaiChallenge15
//
//  Created by 澤田世那 on 2022/05/29.
//

import UIKit

class AddItemViewController: UIViewController {

    @IBOutlet weak var itemTextField: UITextField!

    static func instantiate(didSave: @escaping (CheckItem) -> Void,
                            didCancel: @escaping  () -> Void) -> AddItemViewController {

        let secondVC = UIStoryboard(name: "AddItem", bundle: nil).instantiateInitialViewController()
        // swiftlint:disable:next force_cast
        as! AddItemViewController

        secondVC.didSave = didSave
        secondVC.didCancel = didCancel
        
        return secondVC
    }

    private var didSave: (CheckItem) -> Void = { _ in }
    private var didCancel: () -> Void = {}

    @IBAction func saveButton(_ sender: Any) {
        guard let text = itemTextField.text else { return }
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        didSave(.init(name: text, isChecked: false))
    }

    @IBAction func cancelButton(_ sender: Any) {
        didCancel()
    }
}
