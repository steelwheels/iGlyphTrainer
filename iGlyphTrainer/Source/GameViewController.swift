//
//  StartViewController.swift
//  iGlyphTrainer
//
//  Created by Tomoo Hamada on 2016/12/22.
//  Copyright © 2016年 Steel Wheels Project. All rights reserved.
//

import UIKit
import KiwiControls
import GTGameData

class GameViewController: UIViewController
{
	@IBOutlet weak var mSetupBarButton: UIBarButtonItem!
	@IBOutlet weak var mAboutBarButton: UIBarButtonItem!
	@IBOutlet weak var mStartButton: KCButton!

	override func viewDidLoad() {
		super.viewDidLoad()

		setupStartButton()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	private func setupStartButton() {
		mStartButton.title = "Start"
		mStartButton.setColors(colors: GTColorPreference.buttonColor)
		mStartButton.decideVisibleCallback = {
			(s: CNState) -> Bool? in
			if let state = s as? GTGameState {
				var result: Bool
				switch state.scene {
				case .StartScene:
					result = true
				case .QuestionScene, .AnswerScene, .CheckScene:
					result = false
				}
				return result
			} else {
				return nil
			}
		}
		mStartButton.decideEnableCallback = {
			(s: CNState) -> Bool? in
			if let state = s as? GTGameState {
				var result: Bool
				switch state.scene {
				case .StartScene:
					if state.glyphProgress == GTGameState.NO_PROGRESS {
						result = true
					} else {
						result = false
					}
				case .QuestionScene, .AnswerScene, .CheckScene:
					result = false
				}
				return result
			} else {
				return nil
			}
		}
		mStartButton.buttonPressedCallback = {
			() -> Void in
			Swift.print("start button pressed")
		}
	}
}

