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
	@IBOutlet weak var mTimerText: KCTextField!
	@IBOutlet weak var mGlyphName: KCTextField!
	@IBOutlet weak var mStartButton: KCButton!
	@IBOutlet weak var mLayerView: KCLayerView!
	private var	   mTimer		= KCTimer()
	private var	   mGlyphHackInterval	= GTHackInterval(level: .Normal, count: 1)

	override func viewDidLoad() {
		super.viewDidLoad()

		let state = sharedState()
		setupStartButton(gameState: state)
		setupTimerText(gameState: state)
		setupGlyphName(gameState: state)

		setupTimer(gameState: state)
	}

	override func viewDidLayoutSubviews() {
		let state = sharedState()
		setupProgressView(gameState: state)
		setupGlyphView(gameState: state)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	private func setupStartButton(gameState state: GTGameState) {
		mStartButton.state = state
		mStartButton.title = "Start"
		mStartButton.setColors(colors: GTGUIPreference.buttonColor)
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
			self.startGame()
		}
	}

	private func setupProgressView(gameState state: GTGameState) {
		let progress = GTProgressLayer(frame: mProgressView.bounds)
		mProgressView.state = state
		mProgressView.rootLayer.addSublayer(progress)
		mProgressView.backgroundColor = UIColor.black
	}

	private func setupTimerText(gameState state: GTGameState) {
		let colors = GTGUIPreference.glyphNameTextColor
		mTimerText.state	= state
		mTimerText.alignment	= .center
		mTimerText.text		= "Timer Text"
		mTimerText.font		= KGFontTable.sharedFontTable.font(withStyle: .Title)
		mTimerText.setColors(colors: colors)
	}

	private func setupGlyphName(gameState state: GTGameState) {
		let colors = GTGUIPreference.glyphNameTextColor
		mGlyphName.state	= state
		mGlyphName.alignment	= .center
		mGlyphName.text		= "Glyph Name"
		mGlyphName.font		= KGFontTable.sharedFontTable.font(withStyle: .Title)
		mGlyphName.setColors(colors: colors)
		mGlyphName.decideTextCallback = {
			(state: CNState) -> String? in
			var result: String? = nil
			if let s = state as? GTGameState {
				switch s.scene {
				case .StartScene:
					break
				case .QuestionScene:
					result = self.currentGlyphName(currentState: s)
				case .AnswerScene:
					break
				case .CheckScene:
					break
				}
			}
			return result
		}
	}

	private func currentGlyphName(currentState state: GTGameState) -> String? {
		let sequence  = state.glyphSequence
		let progress  = state.glyphProgress
		if progress >= 0 {
			let character = sequence[state.glyphProgress]
			Swift.print("currentGlyphName: \(character.title())")
			return character.title()
		} else {
			return nil
		}
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
				self.mTimerText.text = ""
			case .QuestionScene, .AnswerScene, .CheckScene:
				self.mTimerText.setDouble(value: time)
				if self.isIncrementInterval(time: time, state: state) {
					state.incrementGlyphProgress()
				}
			}
			return true
		}
		mTimer.doneCallback = {
			() -> Void in
			let nextscene: GTScene
			switch state.scene {
			case .StartScene:	nextscene = .QuestionScene
			case .QuestionScene:	nextscene = .StartScene // .AnswerScene
			case .AnswerScene:	nextscene = .StartScene //  .CheckScene
			case .CheckScene:	nextscene = .StartScene
			}
			state.scene = nextscene
		}
	}

	private func isIncrementInterval(time t: TimeInterval, state s: GTGameState) -> Bool {
		let pasttime      = mGlyphHackInterval.totalInterval - t
		let timeprogress  = Int(pasttime / mGlyphHackInterval.unitInterval)
		let glyphprogress = s.glyphProgress
		if timeprogress > glyphprogress && glyphprogress != GTGameState.NO_PROGRESS {
			return true
		} else {
			return false
		}
	}

	private func startGame() {
		let state    = sharedState()
		let count    = state.glyphSequenceCount
		let level    = GTGamePreference.sharedPreference.glyphHackLevel
		let interval = GTHackInterval(level: level, count: count)

		//Swift.print("start button pressed count=\(count)")
		state.scene = .QuestionScene
		state.incrementGlyphProgress()
		mGlyphHackInterval = interval
		mTimer.start(startValue: interval.totalInterval, stopValue: 0.0, stepValue: -0.1)
	}
}

