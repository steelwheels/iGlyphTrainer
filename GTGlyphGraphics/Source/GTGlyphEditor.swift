/**
 * @file	GTGlyphEditor.swift
 * @brief	Define GTGlyphEditor class
 * @par Copyright
 *   Copyright (C) 2016 Steel Wheels Project
 */

import KiwiControls
import KiwiGraphics
import GTGameData

public class GTGlyphEditor: KCStrokeDrawer
{
	public override init(bounds b: CGRect){
		super.init(bounds: b)
		super.lineWidth = GTGlyphPreference.glyphStrokeWidth
		super.lineColor = GTGlyphPreference.glyphStrokeColor
	}

	public override func mouseEvent(event evt: KCMouseEvent, at point: CGPoint) -> KCMouseEventResult {
		let result = super.mouseEvent(event: evt, at: point)
		return result
	}
}

