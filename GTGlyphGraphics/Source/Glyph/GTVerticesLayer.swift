/**
 * @file	GTVerticesLayer.swift
 * @brief	Define GTVerticesLayer class
 * @par Copyright
 *   Copyright (C) 2016 Steel Wheels Project
 */

import KiwiGraphics
import KiwiControls
import GTGameData

private class GTVertexDrawer
{
	private var mEclipse:	KGEclipse
	private var mGradient:	CGGradient

	public init(bounds b: CGRect){
		let center = b.center
		let radius = min(b.size.width, b.size.height)/2.0
		mEclipse  = KGEclipse(center: center, innerRadius: radius*0.5, outerRadius: radius)
		mGradient = KGGradientTable.sharedGradientTable.gradient(forColor: GTColorPreference.glyphVertexColor)
	}

	public func draw(in context:CGContext){
		context.setStrokeColor(KGColorTable.white.cgColor)
		context.draw(eclipse: mEclipse, withGradient: mGradient)
	}
}

public class GTVerticesLayer: KCRepetitiveLayer
{
	public init(frame frm: CGRect){
		let glyph   = KGGlyph(bounds: frm)
		let eradius = glyph.elementRadius
		let esize   = CGSize(width: eradius*2.0, height: eradius*2.0)

		super.init(frame: frm, elementSize: esize, elementDrawer: {
			(size: CGSize, context: CGContext) -> Void in
			let bounds = CGRect(origin: CGPoint.zero, size: size)
			let vertex = GTVertexDrawer(bounds: bounds)
			vertex.draw(in: context)
		})

		for vertex in glyph.vertices {
			let mvertex = CGPoint(x: vertex.x-eradius, y: vertex.y-eradius)
			self.add(location: mvertex)
		}
	}

	public required init?(coder decoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
