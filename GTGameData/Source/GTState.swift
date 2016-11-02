/**
 * @file	GTState.m
 * @brief	Define GTState
 * @par Copyright
 *   Copyright (C) 2015-2016 Steel Wheels Project
 */

import Canary

public enum GTScene {
	case TitleScene
}

public class GTState: CNState
{
	private var mScene: GTScene = .TitleScene

	public var scene: GTScene {
		get {
			return mScene
		}
		set(newscene) {
			mScene = newscene
			updateState()
		}
	}
}

