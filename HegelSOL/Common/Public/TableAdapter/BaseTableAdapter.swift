//
//  BaseTableAdapter.swift
//  App-demo
//
//  Created by Ильнур Ягудин on 21.04.2018.
//  Copyright © 2018 Vitalii Poponov. All rights reserved.
//

import UIKit

class BaseTableAdapter: NSObject, UITableViewDataSource, UITableViewDelegate {

	internal var tableView: UITableView?

	func registerCell(items: [String: Swift.AnyClass?]) {
		for (key, value) in items {
			tableView?.register(value, forCellReuseIdentifier: key)
		}
	}

	func registerSections(items: [String: Swift.AnyClass?]) {
		for (key, value) in items {
			tableView?.register(value, forHeaderFooterViewReuseIdentifier: key)
		}
	}

	func refresh() {
		tableView?.reloadData()
	}

	func connect(tableView: UITableView) {
		self.tableView = tableView
		tableView.delegate = self
		tableView.dataSource = self
		refresh()
	}

	func disconnect() {
		self.tableView?.delegate = nil
		self.tableView?.dataSource = nil
		self.tableView = nil
	}

	func cellBy(identifier: String) -> BaseTableViewCell? {
		let tmp =  tableView?.dequeueReusableCell(withIdentifier: identifier) as? BaseTableViewCell
		return tmp
	}
	
	func cellIdentifier(for indexPath: IndexPath) -> String {
		return ""
	}
	
	//MARK: - TableView Datasource adn Delegate
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let identifier = cellIdentifier(for: indexPath)
		return cellBy(identifier: identifier) ?? BaseTableViewCell()
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 0
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 0
	}

}

