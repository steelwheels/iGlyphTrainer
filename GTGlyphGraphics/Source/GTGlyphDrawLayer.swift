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
		if let c = mGlyphCharacter {
			context.setLineWidth(GTGlyphPreference.glyphStrokeWidth)
			context.setStrokeColor(GTGlyphPreference.glyphStrokeColor)
			for (fromidx, toidx) in c.stroke() {
				let frompt = mGlyph.vertices[fromidx]
				let topt   = mGlyph.vertices[toidx]
				context.move(to: frompt)
				context.addLine(to: topt)
			}
			context.strokePath()
		}
		super.drawContent(in: context)
	}
}

