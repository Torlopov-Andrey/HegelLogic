//
//  TableViewHeaderFooterConfiguration.swift
//  App-demo
//
//  Created by Ильнур Ягудин on 21.04.2018.
//  Copyright © 2018 Vitalii Poponov. All rights reserved.
//

import UIKit

protocol TableViewHeaderFooterConfigurationProtocol {
	var identifier: String {get set}
	var height: CGFloat {get set}
	func prepare(view: BaseTableViewHeaderFooterView, section: Int)
}

class TableViewHeaderFooterConfiguration<T>: TableViewHeaderFooterConfigurationProtocol where T: BaseTableViewHeaderFooterView {

	typealias ConfigureBlock = ((_ view: T, _ section: Int) -> Void)

	internal var instance: Swift.AnyClass?
	var identifier: String
	var height: CGFloat = UITableView.automaticDimension
	var prepareBlock: ConfigureBlock?

	init() {
		identifier = UUID().uuidString
		height = UITableView.automaticDimension
	}

	init(_ identifier: String?, instance: T.Type, height: CGFloat = UITableView.automaticDimension, prepareBlock: ConfigureBlock?) {

		self.identifier = identifier ?? UUID().uuidString
		self.instance = instance
		self.prepareBlock = prepareBlock
		self.height = height
	}
	
	func prepare(view: BaseTableViewHeaderFooterView, section: Int) {
		if let action = prepareBlock, let view = view as? T {
			action(view, section)
		}
	}
}

