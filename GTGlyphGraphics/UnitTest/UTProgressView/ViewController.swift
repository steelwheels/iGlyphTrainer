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

	private var mGameState		= GTGameState()
	private var mGamePreference	= GTGamePreference.sharedPreference
	private var mTimer		: KCTimer? = nil

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view, typically from a nib
		let timer = KCTimer()
		timer.updateCallback = {
			(time:TimeInterval) -> Bool in
			if let state = self.mLayerView.state as? GTGameState {
				Swift.print("timer: \(time)")
				let progress = state.glyphProgress
				if state.scene == .QuestionScene {
					Swift.print("Increment progress: \(progress)")
					state.incrementGlyphProgress()
				}
			}
			return true
		}
		mTimer = timer
	}

	override func viewDidLayoutSubviews() {
		let progress = GTProgressLayer(frame: mLayerView.bounds)
		mLayerView.state = mGameState
		mLayerView.rootLayer.addSublayer(progress)

		mGameState.scene = .QuestionScene
		if let timer = mTimer {
			let interval = mGamePreference.glyphInterval
			let seqnum   = mGameState.glyphSequenceCount
			timer.start(startValue: interval*Double(seqnum), stopValue: 0.0, stepValue: -interval)
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}

