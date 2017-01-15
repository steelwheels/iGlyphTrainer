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
	public static let backgroundColor: CGColor		= KGColorTable.black.cgColor

	public static func progressColor(scene s:GTScene) -> CGColor {
		var result: CGColor
		switch s {
		case .StartScene:	result = KGColorTable.gold.cgColor
		case .QuestionScene:	result = KGColorTable.gold.cgColor
		case .AnswerScene:	result = KGColorTable.cyan.cgColor
		case .CheckScene:	result = KGColorTable.cyan.cgColor
		}
		return result
	}
	public static let progressStrokeWidth: CGFloat		= 2.0

	public static let hintTextColor				= KGColorPreference.TextColors(foreground: KGColorTable.darkGoldenrod4,
	                               				                               background: KGColorTable.darkGoldenrod3)
	public static let glyphNameTextColor			= KGColorPreference.TextColors(foreground: KGColorTable.gold,
	                                    			                               background: KGColorTable.black)

	public static let timerFontColor:CGColor		= KGColorTable.gold.cgColor

	public static let glyphVertexColor: CGColor		= KGColorTable.white.cgColor
	public static let glyphStrokeWidth: CGFloat		= 10.0
	public static let glyphStrokeColor: CGColor		= KGColorTable.gold.cgColor

	public static let buttonColor = KGColorPreference.ButtonColors(title: KGColorTable.cyan,
		background: KGColorPreference.BackgroundColors(highlight: KGColorTable.darkGray, normal: KGColorTable.black))
}
