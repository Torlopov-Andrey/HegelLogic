//
//  TableCellConfiguration.swift
//  App-demo
//
//  Created by Ильнур Ягудин on 21.04.2018.
//  Copyright © 2018 Vitalii Poponov. All rights reserved.
//

import UIKit

protocol TableCellConfigurationProtocol {
	var identifier: String {get set}
	var height: CGFloat {get set}
	func prepare(cell: BaseTableViewCell, indexPath: IndexPath)
	func didSelect(cell: BaseTableViewCell, indexPath: IndexPath)
}

class TableCellConfiguration<T>: TableCellConfigurationProtocol where T: BaseTableViewCell {
	
	internal var instance: Swift.AnyClass?
	var identifier: String
	var height: CGFloat = UITableView.automaticDimension
	var configurationBlock: ((T, IndexPath) -> Void)?
	var actionBlock: ((T, IndexPath) -> Void)?

	init(instance: T.Type, height: CGFloat = UITableView.automaticDimension, configureBlock: ((T, IndexPath) -> Void)?, actionBlock: ((T, IndexPath) -> Void)? ) {
		self.identifier = String(describing: instance)
		self.instance = instance
		self.configurationBlock = configureBlock
		self.actionBlock = actionBlock
		self.height = height
	}

	init(_ identifier: String, instance: T.Type, height: CGFloat = UITableView.automaticDimension, configureBlock: ((T, IndexPath) -> Void)?, actionBlock: ((T, IndexPath) -> Void)?) {
		self.identifier = identifier
		self.instance = instance
		self.configurationBlock = configureBlock
		self.actionBlock = actionBlock
		self.height = height
	}
	
	func prepare(cell: BaseTableViewCell, indexPath: IndexPath) {
		if let action = configurationBlock, let cell = cell as? T {
			action(cell, indexPath)
		}
	}
	
	func didSelect(cell: BaseTableViewCell, indexPath: IndexPath) {
		if let action = actionBlock, let cell = cell as? T {
			action(cell, indexPath)
		}
	}
}
