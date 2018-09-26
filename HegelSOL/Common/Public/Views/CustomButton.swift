//
//  CustomButton.swift
//  Ebs
//
//  Created by Vitalii Poponov on 13.04.2018.
//  Copyright © 2018 Vitalii Poponov. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
	
	private struct Constants {
		static let cornerRadius: CGFloat = 3
		static let borderWidth: CGFloat = 0
		static let highlightedAlpha: CGFloat = 0.7
		static let shadowRadius: CGFloat = 0
		static let shadowOffset = CGSize(width: 0, height: 0)
	}
	
	enum CustomButtonType {
		case darkGreenBlue
		case light
	}

	public var isFrozen: Bool = false {
		didSet {
			self.updateAppearance()
		}
	}

	//MARK: - Private variables
	
	private let type: CustomButtonType
	
	private var buttonBackgroundColor: UIColor {
		switch self.type {
		case .darkGreenBlue: return self.isHighlighted ? UIColor.darkGreenBlue.withAlphaComponent(Constants.highlightedAlpha) : UIColor.darkGreenBlue
		case .light: return self.isHighlighted ? UIColor.gray : UIColor.white
		}
	}

	private var buttonBackgroundFrozenColor: UIColor {
		switch self.type {
		case .darkGreenBlue: return self.isHighlighted ? UIColor.darkGray.withAlphaComponent(Constants.highlightedAlpha) : UIColor.darkGray
		case .light: return self.isHighlighted ? UIColor.gray : UIColor.white
		}
	}
	
	private var titleBackgroundColor: UIColor {
		switch self.type {
		case .darkGreenBlue: return .white
		case .light: return .black
		}
	}
	
	//MARK: - Inits
	
	init(type: CustomButtonType) {
		self.type = type
		
		super.init(frame: .zero)
		self.titleLabel?.font = UIFont.bold16
		self.titleLabel?.lineBreakMode = .byWordWrapping
		self.titleLabel?.textAlignment = .center
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	//MARK: - Lifecycle
	
	override var isHighlighted: Bool {
		didSet {
			updateAppearance()
		}
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		updateAppearance()
		updateStyles()
	}

	//Private
	
	private func updateAppearance() {
		titleLabel?.textColor = titleBackgroundColor
		backgroundColor = isFrozen ? buttonBackgroundFrozenColor : buttonBackgroundColor
	}
	
	private func updateStyles() {
		layer.cornerRadius = Constants.cornerRadius
		layer.shadowOpacity = 0
		layer.masksToBounds = false
	}
}
