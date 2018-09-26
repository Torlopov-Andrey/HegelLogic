//
//  BaseTableViewCell.swift
//  App-demo
//
//  Created by Ильнур Ягудин on 21.04.2018.
//  Copyright © 2018 Vitalii Poponov. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

	var object: Any? {
		didSet {
			didSetObject(object: object)
		}
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}

	internal func didSetObject(object: Any?) {
	}
}
