/**
 * @file	GTGamePreference.m
 * @brief	Define GTGamePreference
 * @par Copyright
 *   Copyright (C) 2017 Steel Wheels Project
 */

import Foundation

public class GTGamePreference
{
	public static var sharedPreference = GTGamePreference()

	public var minimumWordNum	: Int
	public var maxmumWordNum	:  Int
	public var glyphInterval	: Double

	private init(){
		minimumWordNum	= 1
		maxmumWordNum	= 5
		glyphInterval	= 1.0
	}
}
