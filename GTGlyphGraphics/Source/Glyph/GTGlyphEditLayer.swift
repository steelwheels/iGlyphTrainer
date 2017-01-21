/**
 * @file	GTGlyphEditLayer.swift
 * @brief	Define GTGlyphEditLayer class
 * @par Copyright
 *   Copyright (C) 2016 Steel Wheels Project
 */

import KiwiGraphics
import KiwiControls
import GTGameData

public class GTGlyphEditLayer: KCStrokeLayer
{
	public override init(frame frm: CGRect){
		super.init(frame: frm)
		lineWidth = GTGUIPreference.glyphStrokeWidth
		lineColor = GTGUIPreference.glyphStrokeColor
	}

	public required init?(coder decoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

