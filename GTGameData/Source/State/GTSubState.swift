/**
 * @file	GTSubState.m
 * @brief	Define GTSubState
 * @par Copyright
 *   Copyright (C) 2015-2016 Steel Wheels Project
 */

import Foundation
import Canary

public class GTSubState: CNState
{
	private weak var mMainState: GTMainState?

	public init(mainState ms: GTMainState){
		mMainState = ms
	}

	public var mainState: GTMainState {
		get {
			if let mstate = mMainState {
				return mstate
			} else {
				fatalError("No main state")
			}
		}
	}
}
