//
//  CustomStackTableView.swift
//  custom-stack-table-view
//
//  Created by Ömer Sezer on 14.01.2023.
//

import UIKit

final class CustomStackTableView: UIStackView {
    var delegate: CustomStackTableViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension CustomStackTableView {
    func configure() {
        self.axis = .vertical
        guard let delegate else {
            print("Delegate is nil")
            return
        }
        
        for index in 0...delegate.numberOfItems() - 1 {
            let item = delegate.itemForRowAtIndex(index: index)
            item.isUserInteractionEnabled = true
            
            let tap = CustomStackTableViewTapGesture(target: self, action: #selector(handleTap(_:)))
            tap.index = index
            
            item.addGestureRecognizer(tap)
            self.addArrangedSubview(item)
        }
    }
    
    @objc private func handleTap(_ sender: CustomStackTableViewTapGesture) {
        guard let delegate, let index = sender.index else {
            print("Delegate or index is nil")
            return
        }
        delegate.itemPressedAtIndex(index: index)
    }
}
