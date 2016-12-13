/**
 * @file	GTProgressLayer.swift
 * @brief	Define GTProgressLayer class
 * @par Copyright
 *   Copyright (C) 2016 Steel Wheels Project
 */

import UIKit
import KiwiControls
import GTGameData

public enum GTProgressKind {
	case Question
	case Answer
}

public class GTProgressLayer: KCGraphicsLayer
{
	private enum StepState {
		case Active
		case Inactive
	}

	private struct Symbol {
		var state:	StepState
		var bounds:	CGRect
	}

	private static let MAX_STEP_NUM: Int = 5

	private var mKind:		GTProgressKind
	private var mStepNum:		Int
	private var mSymbolSize:	CGSize
	private var mSymbols:		Array<Symbol>

	private var mActiveSymbol:	CGImage?
	private var mInactiveSymbol:	CGImage?

	public init(kind knd: GTProgressKind, stepNum snum: Int, frame frm: CGRect){
		mKind		= knd
		mStepNum	= snum
		mSymbols	= []

		var symbounds = GTProgressLayer.calcSymbolBounds(stepNum: snum, frame: frm)
		mSymbolSize = symbounds.size
		
		for _ in 0..<snum {
			let symol = Symbol(state: .Inactive, bounds: symbounds)
			mSymbols.append(symol)
			symbounds.origin.x += symbounds.size.width
		}
		super.init(frame: frm)
		self.layerDrawer = {
			(size: CGSize, context: CGContext) -> Void in
			self.drawSymbols(size: size, context: context)
		}
	}

	public required init?(coder decoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private static func calcSymbolBounds(stepNum snum: Int, frame frm: CGRect) -> CGRect {
		let width  = min(frm.size.width / CGFloat(MAX_STEP_NUM), frm.size.height)
		let x      = (frm.size.width  - width * CGFloat(snum)) / 2.0
		let y	   = (frm.size.height - width) / 2.0
		return CGRect(x: x, y: y, width: width, height: width)
	}

	private func drawSymbols(size sz: CGSize, context ctxt: CGContext){

		let actimage   = allocateActiveSymbol()
		let inactimage = allocateInactiveSymbol()
		for symbol in mSymbols {
			let image: CGImage
			if symbol.state == .Active {
				image = actimage
			} else {
				image = inactimage
			}
			//Swift.print("drawSymbols: \(symbol.bounds.description)")
			ctxt.draw(image, in: symbol.bounds)
		}
	}

	private func allocateActiveSymbol() -> CGImage {
		if let symbol = mActiveSymbol {
			return symbol
		} else {
			let newimage = KGImage.generate(size: mSymbolSize, drawFunc: {
				(size: CGSize, context: CGContext) -> Void in
				let gradient = KGGradientTable.sharedGradientTable.gradient(forColor: color)
				context.draw(hexagon: hexagon, withGradient: gradient)
			})
			let newsymbol = newimage.toCGImage
			mActiveSymbol = newsymbol
			return newsymbol
		}
	}

	private func allocateInactiveSymbol() -> CGImage {
		if let symbol = mInactiveSymbol {
			return symbol
		} else {
			let newimage = KGImage.generate(size: mSymbolSize, drawFunc: {
				(size: CGSize, context: CGContext) -> Void in
				context.setStrokeColor(color)
				context.setLineWidth(GTColorPreference.progressStrokeWidth)
				context.setLineCap(.round)
				context.draw(hexagon: hexagon, withGradient: nil)
			})
			let newsymbol = newimage.toCGImage
			mInactiveSymbol = newsymbol
			return newsymbol
		}
	}

	private var hexagon: KGHexagon {
		get {
			let center   = CGPoint(x: mSymbolSize.width/2.0, y: mSymbolSize.height/2.0)
			return KGHexagon(center: center, radius: center.x)
		}
	}

	private var color: CGColor {
		get {
			let color: CGColor
			switch mKind {
			case .Answer:	color = GTColorPreference.answerProgressColor
			case .Question:	color = GTColorPreference.questionProgressColor
			}
			return color
		}
	}
}

