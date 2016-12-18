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

	private var mMainState		: GTMainState = GTMainState()
	private var mTimer		: KCTimer? = nil

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view, typically from a nib
		mTimer = KCTimer(startValue: 4.0, stopValue: 1.0, stepValue: -1.0)
		mTimer?.updateCallback = {
			(time:TimeInterval) -> Bool in
			if let qstate = self.mLayerView.state as? GTSubState {
				Swift.print("timer: \(time)")
				qstate.incrementProgress()
			}
			return true
		}

		let qstate = GTQuestionState(mainState: mMainState)
		mLayerView.state = qstate
	}

	override func viewDidLayoutSubviews() {
		let progress = GTProgressLayer(kind: .Question, frame: mLayerView.bounds)
		//progress.backgroundColor = KGColorTable.yellow.cgColor
		mLayerView.rootLayer.addSublayer(progress)

		if let qstate = mLayerView.state as? GTSubState {
			qstate.setGlyphSequence(glyphSequence: GTGlyphSentence.glyphSequence4[0])
		}
		if let timer = mTimer {
			timer.start()
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}

