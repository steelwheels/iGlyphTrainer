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
import GTGlyphGraphics

class GameViewController: UIViewController
{
	@IBOutlet weak var mSetupBarButton: UIBarButtonItem!
	@IBOutlet weak var mAboutBarButton: UIBarButtonItem!
	@IBOutlet weak var mProgressView: KCLayerView!
	@IBOutlet weak var mStartButton: KCButton!
	@IBOutlet weak var mLayerView: KCLayerView!
	private var	   mTimer = KCTimer()

	override func viewDidLoad() {
		super.viewDidLoad()

		let state = sharedState()
		setupStartButton(gameState: state)
		setupProgressView(gameState: state)
		setupGlyphView(gameState: state)
		setupTimer(gameState: state)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	private func setupStartButton(gameState state: GTGameState) {
		mStartButton.state = state
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

	private func setupProgressView(gameState state: GTGameState) {
		let progress = GTProgressLayer(frame: mProgressView.bounds)
		mProgressView.state = state
		mProgressView.rootLayer.addSublayer(progress)
	}

	private func setupGlyphView(gameState state: GTGameState) {
		mLayerView.state = state
		let bounds = mLayerView.bounds

		/* Add vertices layer */
		let verticesLayer = GTVerticesLayer(frame: bounds)
		mLayerView.rootLayer.addSublayer(verticesLayer)
	}

	private func setupTimer(gameState state: GTGameState) {
		mTimer.updateCallback = {
			(time:TimeInterval) -> Bool in
			switch state.scene {
			case .StartScene:
				/* do nothing */
				break
			case .QuestionScene, .AnswerScene, .CheckScene:
				state.incrementGlyphProgress()
			}
			return true
		}
		mTimer.doneCallback = {
			() -> Void in
			let nextscene: GTScene
			switch state.scene {
			case .StartScene:	nextscene = .QuestionScene
			case .QuestionScene:	nextscene = .AnswerScene
			case .AnswerScene:	nextscene = .CheckScene
			case .CheckScene:	nextscene = .StartScene
			}
			state.scene = nextscene
		}
	}
}

