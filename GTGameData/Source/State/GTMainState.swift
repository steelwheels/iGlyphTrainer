/**
 * @file	GTMainState.m
 * @brief	Define GTMainState
 * @par Copyright
 *   Copyright (C) 2015-2016 Steel Wheels Project
 */

import Canary

public enum GTScene {
	case StartScene
	case QuestionScene
	case AnswerScene
	case CheckScene

	public var description: String {
		get {
			var result: String = "unknown"
			switch self {
			case .StartScene:	result = "start"
			case .QuestionScene:	result = "question"
			case .AnswerScene:	result = "answer"
			case .CheckScene:	result = "check"
			}
			return result
		}
	}
}

public class GTMainState: CNState
{
	public var scene	: GTScene
	public var childState	: GTSubState? = nil

	public override init(){
		scene      = .StartScene
		super.init()
		childState = GTStartState(mainState: self)
	}
}

/*
public class GTSceneState
{
	public weak var parentState: CNState? = nil

	public func updateState(){
		if let s = parentState {
			s.updateState()
		}
	}

	public var description: String {
		return ""
	}
}

public class GTTitleState: GTSceneState
{
}

public class GTEditState: GTSceneState
{
	public enum GTProgress {
		case idle
		case editing
		case finished

		public var description: String {
			get {
				var result = "unknown"
				switch self {
				case .idle:     result = "idle"
				case .editing:  result = "editing"
				case .finished: result = "finished"
				}
				return result
			}
		}
	}

	private var mProgress: GTProgress

	public override init(){
		mProgress = .idle
	}

	public var progress: GTProgress {
		get {
			return mProgress
		}
		set(newval){
			mProgress = newval
			super.updateState()
		}
	}

	public override var description: String {
		return "(progress: \(mProgress.description))"
	}
}

public class GTState: CNState
{
	private var mScene	: GTScene
	private var mSceneState	: GTSceneState

	public override init(){
		mScene	    = .TitleScene
		mSceneState = GTTitleState()
		super.init()
		mSceneState.parentState = self
	}

	public var scene: GTScene {
		get {
			return mScene
		}
		set(newscene) {
			mScene = newscene
			switch newscene {
			case .TitleScene:
				mSceneState = GTTitleState()
			case .EditScene:
				mSceneState = GTEditState()
			}
			mSceneState.parentState = self
			updateState()
		}
	}

	public var childState: GTSceneState {
		get { return mSceneState }
	}

	public override var description: String {
		let scenedesc = mScene.description
		let childdesc = mSceneState.description
		return "(scene:\(scenedesc) \(childdesc))"
	}
}
*/

