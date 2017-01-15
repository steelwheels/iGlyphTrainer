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

	struct SceneSymbolImages {
		var activeSymbol:	CGImage
		var inactiveSymbol:	CGImage
	}

	struct SymbolImages {
		var questionScene:	SceneSymbolImages
		var answerScene:	SceneSymbolImages
	}

	private var mSymbols:		Array<Symbol>
	private var mSymbolImages:	SymbolImages
	private var mCurrentImages:	SceneSymbolImages

	public override init(frame frm: CGRect)
	{
		let symbounds	= GTProgressLayer.calcSymbolBounds(sequenceNum: 1, frame: frm)
		let size	= symbounds.size
		mSymbols	= []
		mSymbolImages	= GTProgressLayer.allocateImages(symbolSize: size)
		mCurrentImages	= mSymbolImages.questionScene
		super.init(frame: frm)
	}

	public required init?(coder decoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private class func allocateImages(symbolSize size: CGSize) -> SymbolImages {
		let qimages = allocateSceneImages(scene: .QuestionScene, symbolSize: size)
		let aimages = allocateSceneImages(scene: .AnswerScene,   symbolSize: size)
		return SymbolImages.init(questionScene: qimages, answerScene: aimages)
	}

	private class func allocateSceneImages(scene s:GTScene, symbolSize size: CGSize) -> SceneSymbolImages {
		let color = GTColorPreference.progressColor(scene: s)
		let actsymbol   = GTProgressLayer.allocateActiveSymbol(symbolSize: size, color: color)
		let inactsymbol = GTProgressLayer.allocateInactiveSymbol(symbolSize: size, color: color)
		return SceneSymbolImages.init(activeSymbol: actsymbol, inactiveSymbol: inactsymbol)
	}

	private var mPreviousProgress = GTGameState.NO_PROGRESS

	public override func observe(state s: CNState) {
		//Swift.print("GTProgressLayer.observe")
		if let state = s as? GTGameState {
			if state.factor == .Scene {
				switch state.scene {
				case .StartScene, .CheckScene:
					break
				case .QuestionScene:
					mCurrentImages = mSymbolImages.questionScene
				case .AnswerScene:
					mCurrentImages = mSymbolImages.answerScene
				}
			}

			var updated = false
			if mSymbols.count != state.glyphSequenceCount {
				updateSymbols(symbolNum:  state.glyphSequenceCount)
				updated = true
				/* mSymbols.count == state.glyphSequenceCount */
			}
			if updated || (mPreviousProgress != state.glyphProgress) {
				updateProgress(progress: state.glyphProgress)
				mPreviousProgress = state.glyphProgress
				updated = true
			}
			if updated {
				setNeedsDisplay()
			}
		}
	}

	private func updateSymbols(symbolNum num: Int){
		mSymbols = []
		var symbounds = GTProgressLayer.calcSymbolBounds(sequenceNum: num, frame: frame)
		for _ in 0..<num {
			let symbol = Symbol(state: .Inactive, bounds: symbounds)
			mSymbols.append(symbol)
			symbounds.origin.x += symbounds.size.width
		}
	}

	private func updateProgress(progress prog: Int){
		/* Inactivate all symbols */
		for i in 0..<mSymbols.count {
			mSymbols[i].state = .Inactive
		}
		/* Active only one */
		if 0<=prog && prog < mSymbols.count {
			mSymbols[prog].state = .Active
		}
	}

	open override func drawContent(in context: CGContext){
		if mSymbols.count > 0 {
			for symbol in mSymbols {
				let image: CGImage
				if symbol.state == .Active {
					image = mCurrentImages.activeSymbol
				} else {
					image = mCurrentImages.inactiveSymbol
				}
				//Swift.print("drawSymbols: \(symbol.bounds.description)")
				context.draw(image, in: symbol.bounds)
			}
		} else {
			context.setFillColor(GTColorPreference.backgroundColor)
			context.fill(bounds)
		}
	}

	private static func calcSymbolBounds(sequenceNum snum:Int, frame frm: CGRect) -> CGRect {
		let width  = min(frm.size.width / CGFloat(GTGlyphSentence.MAX_GLYPH_SENTENCE_NUM), frm.size.height)
		let x      = (frm.size.width  - width * CGFloat(snum)) / 2.0
		let y	   = (frm.size.height - width) / 2.0
		return CGRect(x: x, y: y, width: width, height: width)
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

