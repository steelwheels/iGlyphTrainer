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

public class GTProgressLayer: KCLayer
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
	private var mSymbols:		Array<Symbol>

	private var mActiveSymbol:	CGImage
	private var mInactiveSymbol:	CGImage

	public init(kind knd: GTProgressKind, frame frm: CGRect){
		mKind			= knd
		mSymbols		= []

		let color: CGColor
		switch mKind {
		case .Answer:	color = GTColorPreference.answerProgressColor
		case .Question:	color = GTColorPreference.questionProgressColor
		}

		let symbounds = GTProgressLayer.calcSymbolBounds(sequenceNum: 1, frame: frm)
		let size      = symbounds.size

		mActiveSymbol   = GTProgressLayer.allocateActiveSymbol(symbolSize: size, color: color)
		mInactiveSymbol = GTProgressLayer.allocateInactiveSymbol(symbolSize: size, color: color)

		super.init(frame: frm)
	}

	public required init?(coder decoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	var mPreviousProgress = GTGameState.NO_PROGRESS

	public override func observe(state s: CNState)
	{
		Swift.print("observe at GTProgressLayer")
		if let state = s as? GTGameState {
			//Swift.print("observe")

			var doupdate = false

			if mSymbols.count != state.glyphSequence.count {
				mSymbols = []
				let seqnum = state.glyphSequence.count
				var symbounds = GTProgressLayer.calcSymbolBounds(sequenceNum: seqnum, frame: frame)
				for _ in 0..<seqnum {
					let symbol = Symbol(state: .Inactive, bounds: symbounds)
					mSymbols.append(symbol)
					symbounds.origin.x += symbounds.size.width
				}
				mPreviousProgress = GTGameState.NO_PROGRESS
				doupdate = true
			}

			if mPreviousProgress != state.glyphProgress {
				/* Inactivate all symbols */
				for i in 0..<mSymbols.count {
					mSymbols[i].state = .Inactive
				}
				/* Active only one */
				let newprogress = state.glyphProgress
				if 0<=newprogress && newprogress < mSymbols.count {
					mSymbols[newprogress].state = .Active
				}

				mPreviousProgress = newprogress
				doupdate = true
			}

			if doupdate {
				//Swift.print("setNeedsDisplay")
				setNeedsDisplay()
			}
		}
	}

	private static func calcSymbolBounds(sequenceNum snum:Int, frame frm: CGRect) -> CGRect {
		let width  = min(frm.size.width / CGFloat(MAX_STEP_NUM), frm.size.height)
		let x      = (frm.size.width  - width * CGFloat(snum)) / 2.0
		let y	   = (frm.size.height - width) / 2.0
		return CGRect(x: x, y: y, width: width, height: width)
	}

	open override func drawContent(in context: CGContext){
		//Swift.print("drawSymbols - begin")
		for symbol in mSymbols {
			let image: CGImage
			if symbol.state == .Active {
				image = mActiveSymbol
			} else {
				image = mInactiveSymbol
			}
			//Swift.print("drawSymbols: \(symbol.bounds.description)")
			context.draw(image, in: symbol.bounds)
		}
		//Swift.print("drawSymbols - end")
	}

	private static func allocateActiveSymbol(symbolSize size: CGSize, color col: CGColor) -> CGImage {
		let newimage = KGImage.generate(size: size, drawFunc: {
			(size: CGSize, context: CGContext) -> Void in
			context.setStrokeColor(col)
			context.setLineWidth(GTColorPreference.progressStrokeWidth)
			context.setLineCap(.round)
			let gradient = KGGradientTable.sharedGradientTable.Gradient(forColor: col)
			context.draw(hexagon: hexagon(symbolSize: size), withGradient: gradient)
		})
		let newsymbol = newimage.toCGImage
		return newsymbol
	}

	private static func allocateInactiveSymbol(symbolSize size: CGSize, color col: CGColor) -> CGImage {
		let newimage = KGImage.generate(size: size, drawFunc: {
			(size: CGSize, context: CGContext) -> Void in
			context.setStrokeColor(col)
			context.setLineWidth(GTColorPreference.progressStrokeWidth)
			context.setLineCap(.round)
			context.draw(hexagon: hexagon(symbolSize: size), withGradient: nil)
		})
		let newsymbol = newimage.toCGImage
		return newsymbol
	}

	private class func hexagon(symbolSize size: CGSize) -> KGHexagon {
		let center   = CGPoint(x: size.width/2.0, y: size.height/2.0)
		return KGHexagon(center: center, radius: center.x)
	}
}

