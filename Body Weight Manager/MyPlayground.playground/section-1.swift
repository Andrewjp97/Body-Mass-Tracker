// Playground - noun: a place where people can play

import UIKit
import CoreGraphics
import QuartzCore

var str = "Hello, playground"

func convertValueToYCoordinate(value: Double) -> CGFloat {
  let availableHeight: CGFloat = 160 - 40.0
  let range = 181.7 - 180.0
  return 160 - ((availableHeight * (CGFloat(value - 180.0) / CGFloat(range))) + 20)
}

convertValueToYCoordinate(180.0)
convertValueToYCoordinate(181.7)
convertValueToYCoordinate(180.9)