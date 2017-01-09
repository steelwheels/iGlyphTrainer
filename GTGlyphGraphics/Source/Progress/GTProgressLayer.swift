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
		if let state = s as? GTGameState {
			var doupdate = false
			switch state.scene {
			case .StartScene:
				if state.previousScene != state.scene {
					updateSymbols(state: state, clear: true)
					doupdate = true
				}
			case .QuestionScene, .AnswerScene, .CheckScene:
				if mPreviousProgress != state.glyphProgress {
					updateSymbols(state: state, clear: false)
					doupdate = true
				}
				mPreviousProgress = state.glyphProgress
			}
			switch state.scene {
			case .StartScene, .CheckScene:
				break
			case .QuestionScene:
				mCurrentImages = mSymbolImages.questionScene
			case .AnswerScene:
				mCurrentImages = mSymbolImages.answerScene
			}
			if doupdate {
				setNeedsDisplay()
			}
		}
	}

	private func updateSymbols(state s: GTGameState, clear c: Bool){
		if c {
			mSymbols = []
		} else {
			let newcount = s.glyphSequenceCount
			if mSymbols.count != newcount {
				mSymbols = []
				var symbounds = GTProgressLayer.calcSymbolBounds(sequenceNum: newcount, frame: frame)
				for _ in 0..<newcount {
					let symbol = Symbol(state: .Inactive, bounds: symbounds)
					mSymbols.append(symbol)
					symbounds.origin.x += symbounds.size.width
				}
			}
			if mPreviousProgress != s.glyphProgress {
				/* Inactivate all symbols */
				for i in 0..<mSymbols.count {
					mSymbols[i].state = .Inactive
				}
				/* Active only one */
				let newprogress = s.glyphProgress
				if 0<=newprogress && newprogress < mSymbols.count {
					mSymbols[newprogress].state = .Active
				}
			}
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

