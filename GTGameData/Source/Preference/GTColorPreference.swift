/**
 * @file	GTColorPreference.m
 * @brief	Define GTColorPreference
 * @par Copyright
 *   Copyright (C) 2016 Steel Wheels Project
 */

import Foundation
import KiwiGraphics
import KiwiControls

public class GTColorPreference
{
	public static let questionProgressColor: CGColor	= KGColorTable.gold.cgColor
	public static let answerProgressColor: CGColor		= KGColorTable.cyan.cgColor
	public static let progressStrokeWidth: CGFloat		= 2.0

	public static let timerFontColor:CGColor		= KGColorTable.gold.cgColor
	
	public static let glyphVertexColor: CGColor		= KGColorTable.white.cgColor
	public static let glyphStrokeWidth: CGFloat		= 10.0
	public static let glyphStrokeColor: CGColor		= KGColorTable.gold.cgColor

	public static let buttonColor = KGColorPreference.ButtonColors(title: KGColorTable.cyan,
		background: KGColorPreference.BackgroundColors(highlight: KGColorTable.darkGray, normal: KGColorTable.black))
}
