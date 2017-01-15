/**
 * @file	GTGameState.m
 * @brief	Define GTGameState
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

public class GTGameState: CNState
{
	public enum Factor: Int {
		case Scene
		case GlyphProgress
	}

	public static let NO_PROGRESS	: Int = -1

	private var mScene		: GTScene
	private var mGlyphSequence	: Array<GTGlyphCharacter>
	private var mGlyphProgress	: Int

	public override init(){
		mScene		= .StartScene
		mGlyphSequence	= []
		mGlyphProgress	= GTGameState.NO_PROGRESS

		super.init()
		transitScene(scene: .StartScene)
	}

	public var factor: Factor {
		if let f = Factor(rawValue: factorValue) {
			return f
		} else {
			fatalError("Invalid factor")
		}
	}

	public var scene: GTScene {
		get {
			return mScene
		}
		set(newscene){
			if mScene != newscene {
				mScene = newscene
				transitScene(scene: newscene)
				self.updateState(factorValue: Factor.Scene.rawValue)
			}
		}
	}
	
	private func transitScene(scene newScene: GTScene) -> Void
	{
		switch newScene {
		case .StartScene:
			mGlyphSequence = selectSequence()
			mGlyphProgress = GTGameState.NO_PROGRESS
		case .QuestionScene:
			mGlyphProgress = GTGameState.NO_PROGRESS
			break
		case .AnswerScene:
			mGlyphProgress = GTGameState.NO_PROGRESS
			break
		case .CheckScene:
			mGlyphProgress = GTGameState.NO_PROGRESS
			break
		}
	}

	private func selectSequence() -> Array<GTGlyphCharacter>
	{
		let pref    = GTGamePreference.sharedPreference
		let minnum  = UInt32(pref.minimumWordNum)
		let maxnum  = UInt32(pref.maxmumWordNum)
		let wordnum = random(between: minnum, and: maxnum)

		var sequences: Array<Array<GTGlyphCharacter>>
		switch wordnum {
		case 1: sequences = GTGlyphSentence.glyphSequence1
		case 2: sequences = GTGlyphSentence.glyphSequence2
		case 3: sequences = GTGlyphSentence.glyphSequence3
		case 4: sequences = GTGlyphSentence.glyphSequence4
		case 5: sequences = GTGlyphSentence.glyphSequence5
		default: fatalError("Illegal word num")
		}

		let seqnum = UInt32(sequences.count)
		let seqid: UInt32
		if seqnum > 0 {
			seqid = random(between: 0, and: seqnum-1)
		} else {
			fatalError("Illegal sequence num")
		}

		return sequences[Int(seqid)]
	}

	public var glyphSequence: Array<GTGlyphCharacter> {
		get { return mGlyphSequence }
	}

	public var glyphSequenceCount: Int {
		get { return mGlyphSequence.count }
	}

	public var glyphProgress: Int {
		get {
			return mGlyphProgress
		}
	}

	public func incrementGlyphProgress(){
		if 0<=mGlyphProgress && mGlyphProgress<mGlyphSequence.count-1 {
			mGlyphProgress += 1
		} else if mGlyphProgress == GTGameState.NO_PROGRESS {
			mGlyphProgress = 0
		} else {
			mGlyphProgress = GTGameState.NO_PROGRESS
		}
		self.updateState(factorValue: Factor.GlyphProgress.rawValue)
	}
}


