//
//  BaseTableViewHeaderFooterView.swift
//  App-demo
//
//  Created by Ильнур Ягудин on 21.04.2018.
//  Copyright © 2018 Vitalii Poponov. All rights reserved.
//

import UIKit

class BaseTableViewHeaderFooterView: UITableViewHeaderFooterView {

	var object: Any? {
		didSet {
			didSetObject(object: object)
		}
	}

	internal func didSetObject(object: Any?) {
	}

}

