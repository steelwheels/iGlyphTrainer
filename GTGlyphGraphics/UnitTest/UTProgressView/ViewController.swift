//
//  ViewController.swift
//  UTProgressView
//
//  Created by Tomoo Hamada on 2016/12/06.
//  Copyright © 2016年 Steel Wheels Project. All rights reserved.
//

import UIKit
import GTGlyphGraphics
import GTGameData
import KiwiControls

class ViewController: UIViewController
{
	@IBOutlet weak var mLayerView: KCLayerView!
	@IBOutlet weak var mButton: KCButton!

	private var mGameState		= GTGameState()
	private var mGamePreference	= GTGamePreference.sharedPreference
	private var mTimer		: KCTimer? = nil
	private var mHackInterval	: GTHackInterval = GTHackInterval(level: .Normal, count: 1)

	override func viewDidLoad() {
		super.viewDidLoad()

		mGamePreference.minimumWordNum = 5
		mGamePreference.maxmumWordNum  = 5
		
		// Do any additional setup after loading the view, typically from a nib
		let timer = KCTimer()
		timer.updateCallback = {
			(time:TimeInterval) -> Bool in
			if let state = self.mLayerView.state as? GTGameState {
				Swift.print("timer: \(time)")
				if self.isIncrementInterval(time: time, state: state) {
					state.incrementGlyphProgress()
				}
			}
			return true
		}
		mTimer = timer

		mButton.title = "Start"
		mButton.buttonPressedCallback = {
			() -> Void in
			if self.mGameState.scene == .QuestionScene {
				self.mGameState.scene = .AnswerScene
			} else {
				self.mGameState.scene = .QuestionScene
			}
			let seqnum   = self.mGameState.glyphSequenceCount
			let interval = GTHackInterval(level: .Normal, count: seqnum)
			Swift.print("button pressed: interval=\(interval.totalInterval), seqnum=\(seqnum)")
			self.mHackInterval = interval
			timer.start(startValue: interval.totalInterval, stopValue: 0.0, stepValue: -0.1)
		}
	}

	private func isIncrementInterval(time t: TimeInterval, state s: GTGameState) -> Bool {
		let pasttime      = mHackInterval.totalInterval - t
		let timeprogress  = Int(pasttime / mHackInterval.unitInterval)
		let glyphprogress = s.glyphProgress
		if timeprogress > glyphprogress && glyphprogress != GTGameState.NO_PROGRESS {
			return true
		} else {
			return false
		}
	}

	override func viewDidLayoutSubviews() {
		let progress = GTProgressLayer(frame: mLayerView.bounds)
		mLayerView.state = mGameState
		mLayerView.rootLayer.addSublayer(progress)

		mGameState.scene = .QuestionScene
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}

