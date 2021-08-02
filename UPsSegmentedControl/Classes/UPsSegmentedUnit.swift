//
//  UPsSegmentedUnit.swift
//  Pods-UPsSegmentedControl_Example
//
//  Created by Lee Kira on 2021/08/02.
//

import UIKit

public protocol UPsSegmentedUnitDelegate: AnyObject {
  func didTap(_ upsSegmentUnit: UPsSegmentedUnit)
}

public class UPsSegmentedUnit: UIView {
  
  public weak var delegate: UPsSegmentedUnitDelegate?
  
  public var segmentModel: UPsSegmentedModel? {
    didSet {
      self.setAttutibute()
      self.setConstraint()
    }
  }
  
  internal var isSelect: Bool = false {
    didSet {
      let imageName: String = self.isSelect ? "smallcircle.fill.circle" : "circle"
      let tempImage = UIImage(systemName: imageName)?.withTintColor(UIColor.label, renderingMode: .alwaysOriginal)
      self.selectImageView.image = tempImage
    }
  }
  
  private let selectImageView: UIImageView = UIImageView()
  private let titleLabel: UILabel = UILabel()
  private let contentLabel: UILabel = UILabel()
  
  
  
  public init() {
    super.init(frame: CGRect.zero)
  }
  
  public convenience init(title: String, content: String) {
    self.init()
    
    self.segmentModel = UPsSegmentedModel(title: title, content: content)
  }

  public convenience init(_ model: UPsSegmentedModel) {
    self.init()
    
    self.segmentModel = model
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}



// MARK: - Action

extension UPsSegmentedUnit {
  @objc private func didTap(_ sender: UITapGestureRecognizer) {
    self.isSelect.toggle()
    self.delegate?.didTap(self)
  }
}



// MARK: - UI

extension UPsSegmentedUnit {
  
  private func setAttutibute() {
    self.selectImageView.image = UIImage(systemName: "circle")?.withTintColor(UIColor.label, renderingMode: .alwaysOriginal)
    self.selectImageView.contentMode = UIView.ContentMode.scaleAspectFit
    
    self.titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    self.titleLabel.text = self.segmentModel?.title
    
    self.contentLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    self.contentLabel.text = self.segmentModel?.content
    self.contentLabel.numberOfLines = 0
    
    let tapGesture = UITapGestureRecognizer()
    tapGesture.addTarget(self, action: #selector(self.didTap(_:)))
    self.addGestureRecognizer(tapGesture)
  }
  
  private func setConstraint() {
    [self.selectImageView, self.titleLabel, self.contentLabel].forEach {
      self.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let xInset: CGFloat = 8
    let yInset: CGFloat = 8
    let toPadding: CGFloat = 8
    
    NSLayoutConstraint.activate([
      self.selectImageView.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor),
      self.selectImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: xInset),
      self.selectImageView.widthAnchor.constraint(equalToConstant: 12),
      self.selectImageView.heightAnchor.constraint(equalToConstant: 12),
      
      self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: yInset),
      self.titleLabel.leadingAnchor.constraint(equalTo: self.selectImageView.trailingAnchor, constant: toPadding),
      self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -yInset),
      
      self.contentLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: toPadding),
      self.contentLabel.leadingAnchor.constraint(equalTo: self.selectImageView.trailingAnchor, constant: toPadding),
      self.contentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -xInset),
      self.contentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -yInset)
    ])
  }
}


