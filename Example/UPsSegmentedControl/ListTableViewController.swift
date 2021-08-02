//
//  ListTableViewController.swift
//  UPsSegmentedControl_Example
//
//  Created by Lee Kira on 2021/08/02.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

final class ListTableViewController: UITableViewController {
  
  // MARK: - Property
  
  private let list: [String] = ["Normal", "Scroll"]
  
  
  
  // MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationItem.title = "UPsSegmented"
  }
  
  
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    self.list.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
    
    cell.textLabel?.text = self.list[indexPath.row]
    
    return cell
  }
  
  
  
  // MARK: - Table view delegate
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch indexPath.row {
    case 0:
      self.navigationController?.pushViewController(NormalViewController(), animated: true)
      
    case 1:
      self.navigationController?.pushViewController(ScrollViewController(), animated: true)
    default:
      break
    }
  }
}
