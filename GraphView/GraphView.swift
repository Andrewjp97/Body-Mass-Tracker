//
//  GraphView.swift
//  Body Weight Manager
//
//  Created by Andrew Paterson on 6/26/14.
//  Copyright (c) 2014 Andrew Paterson. All rights reserved.
//

import UIKit
import CoreGraphics
import QuartzCore

@IBDesignable class GraphView: UIView {
  
  /// The array of data points to be plotted
  var dataPoints: Double[] = [0.0] {
    willSet{
      self.intervals = newValue.count
      for point in newValue {
        if includesZero {
          if point > max {
            max = point
          }
          if point < min {
            min = point
          }
        } else {
          if point > max && point != 0.0 {
            max = point
          }
          if point < min && point != 0.0 {
            min = point
          }
        }
      }
    }
    didSet {
      self.drawTickMarks()
      self.drawGraph()
    }
  }
  var intervals: Int = 0
  var max: Double = 0.0
  var min: Double = 0.0
  /// Includes zero as a possible value: Defaluts to false, defalut behavior is to use zero to 
  /// represent missing data points
  var includesZero: Bool = false
  @IBInspectable var cornerRadius: CGFloat = 10.0
  @IBInspectable var backgroundTransparency: CGFloat = 0.3
  @IBInspectable var barLineWidth: CGFloat = 2.0
  var backgroundLayer: CAShapeLayer = CAShapeLayer()
  var topBar: CAShapeLayer = CAShapeLayer()
  var middleBar: CAShapeLayer = CAShapeLayer()
  var bottomBar: CAShapeLayer = CAShapeLayer()
  var tickMarks: CAShapeLayer[] = []
  
  init(coder aDecoder: NSCoder!) {
    super.init(coder: aDecoder)
    // Initialization code
  }
  
  init(frame: CGRect) {
    super.init(frame: frame)
    // Initialization code
  }
  
  override func layoutSubviews() {
    self.backgroundColor = UIColor.clearColor()
    self.drawBackground()
    self.drawBars()
  }
  
  override func prepareForInterfaceBuilder() {
    if self.dataPoints == [0.0] {
      self.dataPoints = [180.0, 0.0, 180.3, 181.0, 0.0, 180.9, 0.0]
    }
      self.drawTickMarks()
      self.drawGraph()
  }
  
  func drawBackground() {
    backgroundLayer.fillColor = UIColor(white: 0.0, alpha: self.backgroundTransparency).CGColor
    var path = UIBezierPath(roundedRect: self.frame, cornerRadius: self.cornerRadius)
    backgroundLayer.path = path.CGPath
    
    self.layer.addSublayer(backgroundLayer)
  }
  
  func drawBars() {
    
    topBar.lineWidth = self.barLineWidth
    topBar.lineCap = kCALineCapRound
    topBar.strokeColor = UIColor(white: 1.0, alpha: 0.6).CGColor
    var topPath = UIBezierPath()
    topPath.moveToPoint(CGPointMake(10.0, 20.0))
    topPath.addLineToPoint(CGPointMake(CGRectGetWidth(self.frame) - 10.0, 20.0))
    topBar.path = topPath.CGPath
    self.layer.addSublayer(topBar)
    
    middleBar.lineWidth = self.barLineWidth
    middleBar.lineCap = kCALineCapRound
    middleBar.strokeColor = UIColor(white: 1.0, alpha: 0.6).CGColor
    var middlePath = UIBezierPath()
    middlePath.moveToPoint(CGPointMake(10.0, CGRectGetMidY(self.frame)))
    middlePath.addLineToPoint(CGPointMake(CGRectGetWidth(self.frame) - 10.0, CGRectGetMidY(self.frame)))
    middleBar.path = middlePath.CGPath
    self.layer.addSublayer(middleBar)
    
    bottomBar.lineWidth = self.barLineWidth
    bottomBar.lineCap = kCALineCapRound
    bottomBar.strokeColor = UIColor(white: 1.0, alpha: 0.6).CGColor
    var bottomPath = UIBezierPath()
    bottomPath.moveToPoint(CGPointMake(10.0, CGRectGetHeight(self.frame) - 20.0))
    bottomPath.addLineToPoint(CGPointMake(CGRectGetWidth(self.frame) - 10.0, CGRectGetHeight(self.frame) - 20.0))
    bottomBar.path = bottomPath.CGPath
    self.layer.addSublayer(bottomBar)
    
  }
  
  func drawTickMarks() {
    for mark in self.tickMarks {
      mark.removeFromSuperlayer()
    }
    var availableWidth = CGRectGetWidth(self.frame) - 20.0
    for (var i: Int = 0; i < self.intervals; i++) {
      var mark = CAShapeLayer()
      mark.lineWidth = self.barLineWidth
      mark.lineCap = kCALineCapSquare
      mark.strokeColor = UIColor(white: 1.0, alpha: 0.6).CGColor
      var markPath = UIBezierPath()
      let xPosition: CGFloat = 10.0 + ((availableWidth / CGFloat(intervals)) * CGFloat(i)) + (0.5 * (availableWidth / CGFloat(intervals)))
      markPath.moveToPoint(CGPointMake(xPosition, CGRectGetHeight(self.frame) - 20.0 + self.barLineWidth))
      markPath.addLineToPoint(CGPointMake(xPosition, CGRectGetHeight(self.frame) - 20.0 - self.barLineWidth))
      mark.path = markPath.CGPath
      self.layer.addSublayer(mark)
      self.tickMarks.append(mark)
    }
  }
  
  func drawGraph() {

  }
  
}
