//
//  CustomStackTableViewDelegate.swift
//  custom-stack-table-view
//
//  Created by Ömer Sezer on 14.01.2023.
//

import UIKit

protocol CustomStackTableViewDelegate {
    func itemPressedAtIndex(index: Int)
    func itemForRowAtIndex(index: Int) -> UIView
    func numberOfItems() -> Int
}
