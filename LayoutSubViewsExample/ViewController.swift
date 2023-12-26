//
//  ViewController.swift
//  LayoutSubViewsExample
//
//  Created by kanagasabapathy on 25/12/23.
//

import UIKit

class ViewController: UIViewController {

    private let customView = CustomAnimateView()
    private var customViewCenterY: NSLayoutConstraint?
    private lazy var animateButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.tintColor = .white
        button.setTitle("layoutIfNeeded", for: .normal)
        button.backgroundColor = .brown
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(startAnimation), for: .touchUpInside)
        return button
    }()

    private lazy var deferLayout: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.tintColor = .white
        button.setTitle("setNeedsLayout", for: .normal)
        button.backgroundColor = .brown
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(setNeedsLayoutAnimation), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUI()
    }
    private lazy var stackView: UIStackView = {
      let vStackView = UIStackView()
      vStackView.axis = .horizontal
        vStackView.distribution = .fillProportionally
        vStackView.alignment = .center
      return vStackView
    }()

    private func setupUI() {
        stackView.addArrangedSubviews([animateButton, deferLayout])
        view.addSubViews([customView, stackView])
        updateConstraints()
    }
    private func updateConstraints() {
        customView.anchorCenter(centerX: view.marginCenterX)
        customViewCenterY = customView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -300)
        customView.anchorDimension(
                    width: view.marginWidth,
                    height: view.marginHeight,
                    inset: UIEdgeInsets(top: 0,
                                        left: 0,
                                        bottom: 150,
                                        right: 150))
        customViewCenterY?.isActive = true
        stackView.anchor(leading: view.marginLeading,
                         bottom: view.marginBottom,
                         trailing: view.marginTrailing,
                         inset: UIEdgeInsets(top: 0, left: 1.0, bottom: 1.0, right: 1.0))
    }
    @objc private func startAnimation() {
        self.customViewCenterY?.constant = customViewCenterY?.constant == -300 ? 150 : -300
        UIView.animate(withDuration: 2.0) {
            self.view.layoutIfNeeded()
        }
    }
    @objc private func setNeedsLayoutAnimation() {
        self.customViewCenterY?.constant = customViewCenterY?.constant == -300 ? 150 : -300
        UIView.animate(withDuration: 2.0) {
            self.view.setNeedsLayout()
        }
    }
}
