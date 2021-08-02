//
//  ScrollViewController.swift
//  UPsSegmentedControl_Example
//
//  Created by Lee Kira on 2021/08/02.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import UPsSegmentedControl

final class ScrollViewController: UIViewController {
  
  private let options: [UPsSegmentedModel] = [
    UPsSegmentedModel(title: "title0", content: "content content"),
    UPsSegmentedModel(title: "title1", content: "content content content content content content content content content content"),
    UPsSegmentedModel(title: "title2", content: "content content content content content content"),
    UPsSegmentedModel(title: "title3", content: "content contentcontent content content content content content content content content content content content content content content content"),
    UPsSegmentedModel(title: "title4", content: "content content content content"),
    UPsSegmentedModel(title: "title5", content: "content content"),
    UPsSegmentedModel(title: "title6", content: "content content content content content content content content content content"),
    UPsSegmentedModel(title: "title7", content: "content content content content content content"),
    UPsSegmentedModel(title: "title8", content: "content contentcontent content content content content content content content content content content content content content content content"),
    UPsSegmentedModel(title: "title9", content: "content content content content"),
    UPsSegmentedModel(title: "title10", content: "content content"),
    UPsSegmentedModel(title: "title11", content: "content content content content content content content content content content"),
    UPsSegmentedModel(title: "title12", content: "content content content content content content"),
    UPsSegmentedModel(title: "title13", content: "content contentcontent content content content content content content content content content content content content content content content"),
    UPsSegmentedModel(title: "title14", content: "content content content content")
  ]
  
  private let scrollView: UIScrollView = UIScrollView()
  private let upsSegmentedControl: UPsSegmentedControl = UPsSegmentedControl()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.setAttribute()
    self.setConstraint()
  }  
}



// MARK: - UPsSegmentedControlDataSource

extension ScrollViewController: UPsSegmentedControlDataSource {
  
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

extension ScrollViewController: UPsSegmentedControlDelegate {
  
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

extension ScrollViewController {
  
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

    self.view.addSubview(self.scrollView)
    self.scrollView.addSubview(self.upsSegmentedControl)
    
    [self.scrollView, self.upsSegmentedControl].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      self.scrollView.topAnchor.constraint(equalTo: guide.topAnchor),
      self.scrollView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      self.scrollView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      self.scrollView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
      
      self.upsSegmentedControl.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 24),
      self.upsSegmentedControl.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 24),
      self.upsSegmentedControl.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -24),
      self.upsSegmentedControl.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -24),
      self.upsSegmentedControl.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, constant: -48)
    ])
  }
}
