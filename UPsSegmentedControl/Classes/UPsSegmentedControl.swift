//
//  UPsSegmentedControl.swift
//  Pods-UPsSegmentedControl_Example
//
//  Created by Lee Kira on 2021/08/02.
//

import UIKit

public protocol UPsSegmentedControlDataSource: AnyObject {
  func upsSegmentRows(_ upsSegmentView: UPsSegmentedControl) -> Int
  func upsSegmentUnits(_ upsSegmentView: UPsSegmentedControl, unitForRowAt row: Int) -> UPsSegmentedUnit
}

@objc public protocol UPsSegmentedControlDelegate: AnyObject {
  @objc optional func upsSegmentInset(_ upsSegmentView: UPsSegmentedControl) -> UIEdgeInsets
  @objc optional func upsSegmentCornerRadius(_ upsSegmentView: UPsSegmentedControl) -> CGFloat
  @objc optional func upsSegmentLineSpacing(_ upsSegmentView: UPsSegmentedControl) -> CGFloat
  @objc optional func upsSegmentDidTap(_ upsSegmentView: UPsSegmentedControl, didTap row: Int)
}

public class UPsSegmentedControl: UIView {
  
  public weak var dataSoucse: UPsSegmentedControlDataSource!
  public weak var delegate: UPsSegmentedControlDelegate!
  
  private var isFirstTap: Bool = true
  
  private var units: [UPsSegmentedUnit] = [UPsSegmentedUnit]()
  private let backView: UIView = UIView()
  
  private var backTopConstraint: NSLayoutConstraint?
  private var backHeightConstraint: NSLayoutConstraint?
  
  public init() {
    super.init(frame: CGRect.zero)
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private var isLayoutSubviews: Bool = true
  public override func layoutSubviews() {
    super.layoutSubviews()
    
    guard self.isLayoutSubviews else { return }
    self.isLayoutSubviews = false
    self.setUnit()
  }
}



// MARK: - UPsSegmentUnitDelegate
extension UPsSegmentedControl: UPsSegmentedUnitDelegate {
  public func didTap(_ upsSegmentUnit: UPsSegmentedUnit) {
    self.delegate.upsSegmentDidTap?(self, didTap: upsSegmentUnit.tag)
    
    switch self.isFirstTap {
    case true:
      self.isFirstTap = false
      self.setBackView(row: upsSegmentUnit.tag)
      
    case false:
      self.animateBackView(row: upsSegmentUnit.tag)
    }
    
    self.units.forEach {
      $0.isSelect = $0 == upsSegmentUnit
    }
  }
}



// MARK: - UI
extension UPsSegmentedControl {
  private func setUnit() {
    for row in 0 ..< self.dataSoucse.upsSegmentRows(self) {
      let tempUnit = self.dataSoucse.upsSegmentUnits(self, unitForRowAt: row)
      tempUnit.tag = row
      tempUnit.layer.cornerRadius = self.delegate.upsSegmentCornerRadius?(self) ?? 4
      tempUnit.layer.masksToBounds = true
      tempUnit.delegate = self
      self.units.append(tempUnit)
      self.addSubview(tempUnit)
      tempUnit.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let inset: UIEdgeInsets = self.delegate.upsSegmentInset?(self) ?? UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    
    for (row, unit) in self.units.enumerated() {
      unit.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: inset.left).isActive = true
      unit.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -inset.right).isActive = true
      
      switch row {
      case 0:
        unit.topAnchor.constraint(equalTo: self.topAnchor, constant: inset.top).isActive = true
        
      case self.units.count - 1:
        unit.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -inset.bottom).isActive = true
        fallthrough
        
      default:
        let space: CGFloat = self.delegate.upsSegmentLineSpacing?(self) ?? 2
        unit.topAnchor.constraint(equalTo: self.units[row - 1].bottomAnchor, constant: space).isActive = true
      }
    }
  }
  
  private func setBackView(row: Int) {
    self.backView.backgroundColor = UIColor.systemBackground
    self.backView.layer.cornerRadius = self.delegate.upsSegmentCornerRadius?(self) ?? 4
    self.backView.layer.masksToBounds = true
    
    self.addSubview(self.backView)
    self.sendSubviewToBack(self.backView)
    self.backView.translatesAutoresizingMaskIntoConstraints = false
    let inset: UIEdgeInsets = self.delegate.upsSegmentInset?(self) ?? UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    NSLayoutConstraint.activate([
      self.backView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: inset.left),
      self.backView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -inset.right)
    ])
    
    let position: CGFloat = self.units[row].frame.minY
    self.backTopConstraint = self.backView.topAnchor.constraint(equalTo: self.topAnchor, constant: position)
    self.backTopConstraint?.isActive = true
    
    let height: CGFloat = self.units[row].frame.height
    self.backHeightConstraint = self.backView.heightAnchor.constraint(equalToConstant: height)
    self.backHeightConstraint?.isActive = true
    
    self.layoutIfNeeded()
  }
  
  private func animateBackView(row: Int) {
    let position: CGFloat = self.units[row].frame.minY
    let height: CGFloat = self.units[row].frame.height
    
    UIView.animate(withDuration: 0.2) { [weak self] in
      self?.backTopConstraint?.constant = position
      self?.backHeightConstraint?.constant = height
      
      self?.layoutIfNeeded()
    }
  }
}
