/**
 * @file	GTGlyphScreenCore.swift
 * @brief	Define GTGlyphScreenCore class
 * @par Copyright
 *   Copyright (C) 2016 Steel Wheels Project
 */

import KiwiControls
import GTGameData

public class GTGlyphScreenCore: KCView
{
	@IBOutlet weak var mStartButton: KCButton!

	public var startButtonPressedCallback: (() -> Void)? {
		get { return mStartButton.buttonPressedCallback }
		set(newcallback){ mStartButton.buttonPressedCallback = newcallback }
	}

	public func setup() -> Void
	{
		setupButton()
	}

	private func setupButton() -> Void
	{
		mStartButton.decideVisibleCallback = {
			(state: CNState) -> Bool? in
			var result = false
			if let gstate = state as? GTGameState {
				switch gstate.scene {
				case .StartScene:
					result = true
				case .QuestionScene:
					break
				case .AnswerScene:
					break
				case .CheckScene:
					break
				}
			}
			return result
		}
		mStartButton.decideEnableCallback = {
			(state: CNState) -> Bool? in
			var result = false
			if let gstate = state as? GTGameState {
				switch gstate.scene {
				case .StartScene:
					if gstate.glyphProgress == GTGameState.NO_PROGRESS {
						result = true
					} else {
						result = false
					}
				case .QuestionScene:
					break
				case .AnswerScene:
					break
				case .CheckScene:
					break
				}
			}
			return result
		}
	}
}

