/**
 * @file	GTFontPreference.m
 * @brief	Define GTFontPreference
 * @par Copyright
 *   Copyright (C) 2016 Steel Wheels Project
 */

import KiwiGraphics

public class GTFontPreference
{
	public static var sharedPreference = GTFontPreference()

	public var timerFont: KGFont

	private init(){
		if let tmfont = KGFont(name: "Helvetica", size: 32.0) {
			timerFont = tmfont
		} else {
			fatalError("Could not allocate timer font")
		}
	}
}
