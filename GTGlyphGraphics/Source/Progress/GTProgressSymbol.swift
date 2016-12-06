/**
 * @file	GTProgressSymbol.swift
 * @brief	Define GTProgressSymbol class
 * @par Copyright
 *   Copyright (C) 2016 Steel Wheels Project
 */

import Foundation
import KiwiGraphics
import GTGameData

public class GTProgressSymbol
{
	public var scene:	GTScene
	public var active:	Bool

	private var mBounds:	CGRect
	private var mSymbol:	KGHexagon

	public init(scene sc: GTScene, bounds bnds: CGRect){
		scene	= .QuestionScene
		active	= false
		mBounds	= bnds
		mSymbol	= KGHexagon(center: bnds.center, radius: bnds.size.width/2.0)
	}

	public func draw(context: CGContext, in rect: CGRect){
		if rect.intersects(mBounds) {
			Swift.print("rect: \(mBounds.description) center: \(mSymbol.center.description)")

			let color: CGColor
			switch scene {
			case .StartScene:	color = GTColorPreference.questionProgressColor
			case .QuestionScene:	color = GTColorPreference.questionProgressColor
			case .AnswerScene:	color = GTColorPreference.answerProgressColor
			case .CheckScene:	color = GTColorPreference.answerProgressColor
			}

			var gradient: CGGradient?
			if active {
				gradient = KGGradientTable.sharedGradientTable.gradient(forColor: color)
			} else {
				gradient = nil
			}
			context.setLineWidth(GTColorPreference.progressStrokeWidth)
			context.setStrokeColor(color)
			context.setLineCap(.round)
			context.draw(hexagon: mSymbol, withGradient: gradient)
		}
	}
}
