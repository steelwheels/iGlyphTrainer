/**
 * @file	GTGlyphPreference.m
 * @brief	Define GTGlyphPreference
 * @par Copyright
 *   Copyright (C) 2016 Steel Wheels Project
 */

import Foundation
import KiwiGraphics

public class GTGlyphPreference
{
	static let sharedTable = GTGlyphPreference()

	public init(){
	}

	public static let glyphVertexColor: CGColor	= KGColorTable.white.cgColor

	public static let glyphStrokeWidth: CGFloat	= 10.0
	public static let glyphStrokeColor: CGColor	= KGColorTable.gold.cgColor
}
