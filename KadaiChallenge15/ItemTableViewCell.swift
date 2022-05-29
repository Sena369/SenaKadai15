//
//  ItemTableViewCell.swift
//  KadaiChallenge15
//
//  Created by 澤田世那 on 2022/05/29.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    static var identifier: String { String(describing: self)}
    static var nib: UINib { UINib(nibName: String(describing: self),
                                  bundle: nil)}

    @IBOutlet weak var checkImageView: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!

    func configure(item: CheckItem) {
        itemLabel.text = item.name
        checkImageView.image = item.isChecked ? UIImage(named: "check") : nil
    }
}
