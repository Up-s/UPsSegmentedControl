//
//  NormalViewController.swift
//  UPsSegmentedControl
//
//  Created by Up-s on 08/02/2021.
//  Copyright (c) 2021 Up-s. All rights reserved.
//

import UIKit
import UPsSegmentedControl

final class NormalViewController: UIViewController {
  
  private let options: [UPsSegmentedModel] = [
    UPsSegmentedModel(title: "title0", content: "content content"),
    UPsSegmentedModel(title: "title1", content: "content content content content content content content content content content"),
    UPsSegmentedModel(title: "title2", content: "content content content content content content"),
    UPsSegmentedModel(title: "title3", content: "content contentcontent content content content content content content content content content content content content content content content"),
    UPsSegmentedModel(title: "title4", content: "content content content content")
  ]

  private let upsSegmentedControl: UPsSegmentedControl = UPsSegmentedControl()

  override func viewDidLoad() {
    super.viewDidLoad()

    self.setAttribute()
    self.setConstraint()
  }
  
}



// MARK: - UPsSegmentedControlDataSource

extension NormalViewController: UPsSegmentedControlDataSource {
  
  func upsSegmentRows(_ upsSegmentView: UPsSegmentedControl) -> Int {
    self.options.count
  }

  func upsSegmentUnits(_ upsSegmentView: UPsSegmentedControl, unitForRowAt row: Int) -> UPsSegmentedUnit {
    let unit = UPsSegmentedUnit()
    
    unit.segmentModel = self.options[row]
    
    return unit
  }
}



// MARK: - UPsSegmentedControlDelegate

extension NormalViewController: UPsSegmentedControlDelegate {
  
  func upsSegmentInset(_ upsSegmentView: UPsSegmentedControl) -> UIEdgeInsets {
    UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
  }

  func upsSegmentCornerRadius(_ upsSegmentView: UPsSegmentedControl) -> CGFloat {
    4
  }

  func upsSegmentLineSpacing(_ upsSegmentView: UPsSegmentedControl) -> CGFloat {
    2
  }

  func upsSegmentDidTap(_ upsSegmentView: UPsSegmentedControl, didTap row: Int) {
    print("\n---------------------- [ \(row) ] ----------------------")
  }
}



// MARK: - UI

extension NormalViewController {
  
  private func setAttribute() {
    self.view.backgroundColor = UIColor.systemBackground
    
    self.upsSegmentedControl.backgroundColor = UIColor.systemGray5
    self.upsSegmentedControl.layer.cornerRadius = 4
    self.upsSegmentedControl.layer.masksToBounds = true
    self.upsSegmentedControl.dataSoucse = self
    self.upsSegmentedControl.delegate = self
  }

  private func setConstraint() {
    let guide = self.view.safeAreaLayoutGuide

    self.view.addSubview(self.upsSegmentedControl)
    self.upsSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.upsSegmentedControl.topAnchor.constraint(equalTo: guide.topAnchor, constant: 24),
      self.upsSegmentedControl.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 24),
      self.upsSegmentedControl.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -24)
    ])
  }
}
