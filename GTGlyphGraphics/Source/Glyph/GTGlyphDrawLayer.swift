/**
 * @file	GTGlyphDrawLayer.swift
 * @brief	Define GTGlyphDrawLayer class
 * @par Copyright
 *   Copyright (C) 2016 Steel Wheels Project
 */

import KiwiGraphics
import KiwiControls
import GTGameData

public class GTGlyphDrawLayer: KCLayer
{
	private var mGlyph:		KGGlyph
	private var mGlyphCharacter:	GTGlyphCharacter? = nil

	public override init(frame frm: CGRect){
		mGlyph = KGGlyph(bounds: frm)
		super.init(frame: frm)
	}

	public required init?(coder decoder: NSCoder) {
		fatalError("Not supported")
	}

	public var glyphCharacter: GTGlyphCharacter? {
		get {
			return mGlyphCharacter
		}
		set(newchar){
			mGlyphCharacter = newchar
			super.setNeedsDisplayIn(bounds)
		}
	}

	open override func drawContent(in context: CGContext){
		context.setLineWidth(GTColorPreference.glyphStrokeWidth)
		context.setStrokeColor(GTColorPreference.glyphStrokeColor)
		context.setLineCap(.round)
		if let c = mGlyphCharacter {
			let strokes = c.stroke()
			if strokes.count > 0 {
				let (fromidx0, toidx0) = strokes[0]
				context.move(to: mGlyph.vertices[fromidx0])
				context.addLine(to: mGlyph.vertices[toidx0])
				var previdx = toidx0
				for (fromidx, toidx) in strokes.dropFirst(1) {
					if fromidx != previdx {
						context.move(to: mGlyph.vertices[fromidx])
					}
					context.addLine(to: mGlyph.vertices[toidx])
					previdx = toidx
				}
			}
			context.strokePath()
		}
		super.drawContent(in: context)
	}
}

