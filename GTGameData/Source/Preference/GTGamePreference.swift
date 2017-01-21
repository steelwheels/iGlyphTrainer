/**
 * @file	GTGamePreference.m
 * @brief	Define GTGamePreference
 * @par Copyright
 *   Copyright (C) 2017 Steel Wheels Project
 */

import Foundation

public enum GTGlyphHackLevel {
	case High
	case Normal
	case Low
}

public class GTGamePreference
{
	public static var sharedPreference = GTGamePreference()

	public var minimumWordNum	: Int
	public var maxmumWordNum	: Int
	public var glyphHackLevel	: GTGlyphHackLevel

	private init(){
		minimumWordNum	= 1
		maxmumWordNum	= 5
		glyphHackLevel	= .Normal
	}
}
