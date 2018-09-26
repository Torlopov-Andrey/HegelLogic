//
//  BaseScrollView.swift
//  Ebs
//
//  Created by Andrey Torlopov on 7/12/18.
//  Copyright © 2018 Vitalii Poponov. All rights reserved.
//

import UIKit
import SnapKit

extension BaseScrollView {
	
	fileprivate struct Appearance {
		let statusBarHeight: CGFloat = 20
		let animamtionDuration: TimeInterval = 0.5
	}
}
class BaseScrollView: UIView {
	
	//MARK: - Private variables
	
	private let appearance = Appearance()
	
	//MARK: - Lazy variables
	
	lazy var scrollView: UIScrollView = {
		let view = UIScrollView()
		view.bounces = false
		view.backgroundColor = UIColor.white
		view.showsVerticalScrollIndicator = false
		return view
	}()
	
	lazy var stackView: UIStackView = {
		let view = UIStackView()
		view.axis = .vertical
		view.distribution = .fill
		view.backgroundColor = .clear
		return view
	}()
	
	//MARK: - Lifecycle
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubviews()
		updateHeight()
		makeConstraints()
		if #available(iOS 11.0, *) {
			scrollView.contentInsetAdjustmentBehavior = .never
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		self.updateHeight()
	}
	
	//MARK: - Public methods
	
	public func addSeparatorView(height: CGFloat = 10, expandable: Bool = false) {
		let separatorView = UIView()
		stackView.addArrangedSubview(separatorView)
		separatorView.snp.makeConstraints { (make) in
			if expandable {
				make.height.greaterThanOrEqualTo(height)
			}
			else {
				make.height.equalTo(height)
			}
		}
	}
	
	public func addToStackView(view: UIView, embed: Bool = false) {
		guard embed else {
			stackView.addArrangedSubview(view)
			return
		}
		
		let embedView = UIView()
		embedView.addSubview(view)
		stackView.addArrangedSubview(embedView)
		
		view.snp.makeConstraints { make in
			make.top.bottom.equalToSuperview()
			make.left.right.equalToSuperview()
		}
		
		embedView.snp.makeConstraints { (make) in
			make.width.equalToSuperview()
		}
	}
	
	//MARK: - Private methods
	
	private func removeViewFromStack(_ view: UIView, animated: Bool) {
		let block = {
			UIView.animate(withDuration: self.appearance.animamtionDuration,
						   animations: {
							view.isHidden = true },
						   completion: { isFinished in
							guard isFinished else { return }
							view.removeFromSuperview()
							self.updateHeight() })
		}
		
		if animated {
			block()
		}
		else {
			UIView.performWithoutAnimation(block)
		}
	}
	
	private func addSubviews() {
		addSubview(scrollView)
		scrollView.addSubview(stackView)
	}
	
	fileprivate func makeConstraints() {
		scrollView.snp.makeConstraints { make in
			make.edges.equalToSuperview()
		}
		
		stackView.snp.makeConstraints { make in
			make.top.left.equalToSuperview()
			make.width.equalToSuperview()
			make.height.greaterThanOrEqualToSuperview()
		}
	}
	
	internal func updateHeight() {
		scrollView.contentSize = CGSize(width: scrollView.frame.width, height: stackView.frame.height - appearance.statusBarHeight)
	}
}
