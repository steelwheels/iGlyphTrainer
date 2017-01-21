/**
 * @file	GTHackInterval.m
 * @brief	Define GTHackInterval
 * @par Copyright
 *   Copyright (C) 2017 Steel Wheels Project
 */

import Foundation

public struct GTHackInterval {
	public var totalInterval	: TimeInterval
	public var unitInterval		: TimeInterval

	public init(level lvl: GTGlyphHackLevel, count cnt: Int){
		var total: TimeInterval		/* [sec] */
		/* Calculate base interval */
		switch cnt {
		case 1,2:	total = 20.0
		case 3:		total = 19.0
		case 4:		total = 16.0
		default:	total = 15.0
		}
		/* Apply level */
		switch lvl {
		case .High:	total = total * 0.8
		case .Normal:	total = total * 1.0
		case .Low:	total = total * 1.2
		}
		totalInterval	= total
		if cnt > 0 {
			unitInterval = total / TimeInterval(cnt)
		} else {
			unitInterval = total
		}
	}
}
