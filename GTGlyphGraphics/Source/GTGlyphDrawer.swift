/**
 * @file	GTGlyphDrawer.swift
 * @brief	Define GTGlyphDrawer class
 * @par Copyright
 *   Copyright (C) 2016 Steel Wheels Project
 */

import KiwiControls
import KiwiGraphics
import GTGameData

public class GTGlyphDrawer: KCGraphicsLayer
{
	private var mGlyphShape	  : KGGlyph
	public var glyphCharacter : GTGlyphCharacter? = nil

	public override init(bounds b: CGRect){
		mGlyphShape = KGGlyph(bounds: b)
		super.init(bounds: b)
	}

	open override func drawContent(context ctxt:CGContext, bounds bnd:CGRect, dirtyRect drect:CGRect){
		/* Draw strokes */
		if let glyph = glyphCharacter {
			ctxt.setLineWidth(GTGlyphPreference.glyphStrokeWidth)
			ctxt.setLineCap(.round)
			ctxt.setStrokeColor(GTGlyphPreference.glyphStrokeColor)
			let stroke = glyph.stroke()
			for (fromidx, toidx) in stroke {
				let fromvt = mGlyphShape.vertices[fromidx]
				let tovt   = mGlyphShape.vertices[toidx]
				let vtbounds = CGRect.pointsToRect(fromPoint: fromvt, toPoint: tovt)
				if drect.intersects(vtbounds) {
					ctxt.move(to: fromvt)
					ctxt.addLine(to: tovt)
				}
			}
			ctxt.strokePath()
		}
	}
}

