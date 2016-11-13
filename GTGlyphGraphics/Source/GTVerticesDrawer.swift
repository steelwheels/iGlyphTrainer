/**
 * @file	GTVerticesDrawer.swift
 * @brief	Define GTVerticesDrawer class
 * @par Copyright
 *   Copyright (C) 2016 Steel Wheels Project
 */

import KiwiGraphics
import KiwiControls
import GTGameData

private class GTVertexDrawer: KCGraphicsLayer
{
	private var mEclipse:	KGEclipse
	private var mGradient:	CGGradient

	public override init(bounds b: CGRect){
		let center = b.center
		let radius = min(b.size.width, b.size.height)/2.0
		mEclipse  = KGEclipse(center: center, innerRadius: radius*0.5, outerRadius: radius)
		mGradient = KGGradientTable.sharedGradientTable.gradient(forColor: GTGlyphPreference.glyphVertexColor)
		super.init(bounds: b)
	}

	public override func drawContent(context ctxt:CGContext, bounds bnd:CGRect, dirtyRect drect:CGRect){
		if bnd.intersects(drect) {
			ctxt.setStrokeColor(KGColorTable.white.cgColor)
			ctxt.draw(eclipse: mEclipse, withGradient: mGradient)
		}
	}
}

public class GTVerticesDrawer: KCRepetitiveDrawer
{
	private var mGlyphShape:	KGGlyph

	public init(bounds b: CGRect){
		mGlyphShape = KGGlyph(bounds: b)

		let vradius = mGlyphShape.elementRadius
		let vbounds = CGRect(origin: CGPoint.zero, size: CGSize(width: vradius, height: vradius))
		let vdrawer = GTVertexDrawer(bounds: vbounds)
		super.init(bounds: b, elementDrawer: vdrawer)

		let halfradius = vradius / 2.0
		for vertex in mGlyphShape.vertices {
			let pt = CGPoint(x: vertex.x - halfradius, y: vertex.y - halfradius)
			super.add(location: pt)
		}
	}
}
