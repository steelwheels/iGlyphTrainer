/**
 * @file	GTGlyphDrawer.swift
 * @brief	Define GTGlyphDrawer class
 * @par Copyright
 *   Copyright (C) 2016 Steel Wheels Project
 */

import KiwiControls
import KiwiGraphics
import GTGameData

private class GTVertexDrawer: KCGraphicsLayer
{
	private var mEclipse:	KGEclipse
	private var mGradient:	CGGradient

	public init(bounds b: CGRect, color c: CGColor){
		let center = b.center
		let radius = min(b.size.width, b.size.height)/2.0
		mEclipse  = KGEclipse(center: center, innerRadius: radius*0.4, outerRadius: radius)
		mGradient = KGGradientTable.sharedGradientTable.gradient(forColor: c)
		super.init(bounds: b)
	}

	public override func drawContent(context ctxt:CGContext, bounds bnd:CGRect, dirtyRect drect:CGRect){
		if bnd.intersects(drect) {
			ctxt.setStrokeColor(KGColorTable.white.cgColor)
			ctxt.draw(eclipse: mEclipse, withGradient: mGradient)
		}
	}
}

public class GTGlyphDrawer: KCGraphicsLayer
{
	private var mGlyphShape		: KGGlyph
	private var mVerticeDrawer	: KCRepetitiveDrawer

	public var glyphCharacter : GTGlyphCharacter? = nil

	public override init(bounds b: CGRect){
		mGlyphShape = KGGlyph(bounds: b)
		
		let vradius = mGlyphShape.elementRadius
		let vbounds = CGRect(origin: CGPoint.zero, size: CGSize(width: vradius, height: vradius))

		let vdrawer = GTVertexDrawer(bounds: vbounds, color: KGColorTable.gold.cgColor)
		mVerticeDrawer = KCRepetitiveDrawer(bounds: b, elementDrawer: vdrawer)

		let halfradius = vradius / 2.0
		for vertex in mGlyphShape.vertices {
			let pt = CGPoint(x: vertex.x - halfradius, y: vertex.y - halfradius)
			mVerticeDrawer.add(location: pt)
		}

		super.init(bounds: b)
	}

	open override func drawContent(context ctxt:CGContext, bounds bnd:CGRect, dirtyRect drect:CGRect){
		mVerticeDrawer.drawContent(context: ctxt, bounds: bnd, dirtyRect: drect)
		if let glyph = glyphCharacter {
			ctxt.setStrokeColor(KGColorTable.gold.cgColor)
			let stroke = glyph.stroke()
			for (fromidx, toidx) in stroke {
				let fromvt = mGlyphShape.vertices[fromidx]
				let tovt   = mGlyphShape.vertices[toidx]
				ctxt.move(to: fromvt)
				ctxt.addLine(to: tovt)
			}
			ctxt.strokePath()
		}
	}
}

