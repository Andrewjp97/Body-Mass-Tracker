//
//  ViewController.swift
//  Body Weight Manager
//
//  Created by Andrew Paterson on 6/25/14.
//  Copyright (c) 2014 Andrew Paterson. All rights reserved.
//

import UIKit
import GraphView

class ViewController: UIViewController {
  
  @IBOutlet var graphView: GraphView
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func viewDidLayoutSubviews() {
    graphView.intervalLabels = ["6/1", "6/2", "6/3", "6/4", "6/5", "6/6", "6/7", "6/8"]
    graphView.dataPoints = [0.0, 180.0, 0.0, 180.3, 181.0, 0.0, 180.9, 181.7]
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return .LightContent
  }
  
}