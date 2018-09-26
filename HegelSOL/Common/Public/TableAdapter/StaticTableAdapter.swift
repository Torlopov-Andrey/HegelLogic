//
//  StaticTableAdapter.swift
//  App-demo
//
//  Created by Ильнур Ягудин on 21.04.2018.
//  Copyright © 2018 Vitalii Poponov. All rights reserved.
//

import UIKit

class StaticTableAdapter: BaseTableAdapter {
	
	private var sections: [TableSectionConfigurationProtocol] = []
	
	//MARK: - Private methods
	private func prepare(cell: BaseTableViewCell, indexPath: IndexPath) {
		configFor(indexPath: indexPath).prepare(cell: cell, indexPath: indexPath)
	}
	
	private func prepare(section: Int, config: TableViewHeaderFooterConfigurationProtocol) -> UIView? {
		let view = tableView?.dequeueReusableHeaderFooterView(withIdentifier: config.identifier)
		if let view = view as? BaseTableViewHeaderFooterView {
			config.prepare(view: view, section: section)
		}
		return view
	}

	override func cellIdentifier(for indexPath: IndexPath) -> String {
		return sections[indexPath.section].cellConfigurations[indexPath.row].identifier
	}
	
	//MARK: - TableView Configuration
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return sections.count
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return configFor(section: section).cellConfigurations.count
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return configFor(section: section).headerConfiguration.height
	}
	
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return configFor(section: section).footerConfiguration.height
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return configFor(indexPath: indexPath).height
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let config = configFor(section: section).headerConfiguration
		return prepare(section: section, config: config)
		
	}
	
	func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		let config = configFor(section: section).footerConfiguration
		return prepare(section: section, config: config)
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = super.tableView(tableView, cellForRowAt: indexPath)
		if let cell = cell as? BaseTableViewCell {
			prepare(cell: cell, indexPath: indexPath)
		}
		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		let config = configFor(indexPath: indexPath)
		let cell = tableView.cellForRow(at: indexPath)
		if let cell = cell as? BaseTableViewCell {
			config.didSelect(cell: cell, indexPath: indexPath)
		}
	}

	//MARK: - Helpers
	func configFor(indexPath: IndexPath) -> TableCellConfigurationProtocol {
		return sections[indexPath.section].cellConfigurations[indexPath.row]
	}
	
	func configFor(section: Int) -> TableSectionConfigurationProtocol {
		return sections[section]
	}
	
	func setSections(_ sections: [TableSectionConfigurationProtocol]) {
		self.sections = sections
		self.tableView?.reloadData()
		
	}
	
}

