//
//  ViewController.swift
//  UTGlyphEditor
//
//  Created by Tomoo Hamada on 2016/11/13.
//  Copyright © 2016年 Steel Wheels Project. All rights reserved.
//

import UIKit
import KiwiControls
import KiwiGraphics
import GTGlyphGraphics
import GTGameData

class ViewController: KCViewController
{
	@IBOutlet weak var mLayerView: KCLayerView!
	private static let DO_DEBUG = false
	
	override func viewDidLoad() {
		super.viewDidLoad()

		/* Set state */
		self.state = GTMainState()
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()

		let bounds = mLayerView.bounds

		/* Add background layer */
		let backgroundLayer = KCBackgroundLayer(frame: bounds)
		backgroundLayer.color = KGColorTable.black.cgColor
		mLayerView.rootLayer.addSublayer(backgroundLayer)

		/* Add vertices layer */
		let verticesLayer = GTVerticesLayer(frame: bounds)
		mLayerView.rootLayer.addSublayer(verticesLayer)

		/* Editor */
		let strokelayer = GTGlyphEditLayer(frame: bounds)
		mLayerView.rootLayer.addSublayer(strokelayer)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	open override func observe(state s: CNState){
		if let state = s as? GTMainState {
			print("state: \(state.description)")
		} else {
			fatalError("Invalid state")
		}
	}
}

