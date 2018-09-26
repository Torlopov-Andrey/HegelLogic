//
//  TableSectionConfiguration.swift
//  App-demo
//
//  Created by Ильнур Ягудин on 21.04.2018.
//  Copyright © 2018 Vitalii Poponov. All rights reserved.
//

import UIKit

protocol TableSectionConfigurationProtocol {
	var headerConfiguration: TableViewHeaderFooterConfigurationProtocol {get set}
	var footerConfiguration: TableViewHeaderFooterConfigurationProtocol {get set}
	var cellConfigurations: [TableCellConfigurationProtocol] {get set}
}

class TableSectionConfiguration: TableSectionConfigurationProtocol {

	var headerConfiguration: TableViewHeaderFooterConfigurationProtocol = TableViewHeaderFooterConfiguration()
	var footerConfiguration: TableViewHeaderFooterConfigurationProtocol = TableViewHeaderFooterConfiguration()
	var cellConfigurations: [TableCellConfigurationProtocol] = []

}

