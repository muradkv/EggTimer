//
//  CustomStackView.swift
//  EggTimer
//
//  Created by murad on 22.09.2024.
//

import UIKit

class CustomStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(frame: .zero)
        self.axis = axis
        self.spacing = spacing
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        distribution = .fillEqually
    }
    
}
