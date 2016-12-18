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
	public static let NO_PROGRESS		: Int = -1

	private weak var mMainState	: GTMainState?
	private var	 mProgress	: Int
	private var	 mGlyphSequence	: Array<GTGlyphCharacter>

	public init(mainState ms: GTMainState){
		mMainState	= ms
		mProgress	= GTSubState.NO_PROGRESS
		mGlyphSequence	= []
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

	public func setGlyphSequence(glyphSequence seq: Array<GTGlyphCharacter>){
		mGlyphSequence	= seq
		mProgress	= GTSubState.NO_PROGRESS
		self.updateState()
	}

	public var sequenceNum: Int {
		get { return mGlyphSequence.count }
	}

	public var progress: Int {
		get { return mProgress }
	}

	public func incrementProgress(){
		if 0<=mProgress && mProgress<mGlyphSequence.count-1 {
			mProgress += 1
		} else if mProgress == GTSubState.NO_PROGRESS {
			mProgress = 0
		} else {
			mProgress = GTSubState.NO_PROGRESS
		}
		self.updateState()
	}
}
