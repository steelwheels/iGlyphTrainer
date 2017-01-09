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
				let progress = state.glyphProgress
				Swift.print("Increment progress: \(progress)")
				state.incrementGlyphProgress()
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
			let interval = self.mGamePreference.glyphInterval
			let seqnum   = self.mGameState.glyphSequenceCount
			Swift.print("button pressed: interval=\(interval), seqnum=\(seqnum)")
			timer.start(startValue: interval*Double(seqnum), stopValue: 0.0, stepValue: -interval)
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

