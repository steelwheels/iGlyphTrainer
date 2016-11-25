//
//  ViewController.swift
//  UTGlyphGraphics
//
//  Created by Tomoo Hamada on 2016/11/03.
//  Copyright © 2016年 Steel Wheels Project. All rights reserved.
//

import UIKit
import GTGlyphGraphics
import KiwiControls

class ViewController: KCViewController
{
	@IBOutlet weak var mGraphicsView: KCGraphicsView!

	private static let DO_DEBUG = false

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func viewDidLayoutSubviews() {
		let bounds = mGraphicsView.bounds

		/* Add background layer */
		let backgroundLayer = KCBackgroundLayer(frame: bounds)
		backgroundLayer.color = KGColorTable.black.cgColor
		mGraphicsView.rootLayer.addSublayer(backgroundLayer)

		/* Add vertices layer */
		let verticesLayer = GTVerticesLayer(frame: bounds)
		mGraphicsView.rootLayer.addSublayer(verticesLayer)

		/* Drawer */
		let glyphdrawer = GTGlyphDrawLayer(frame: bounds)
		mGraphicsView.rootLayer.addSublayer(glyphdrawer)
		glyphdrawer.glyphCharacter = .Human
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

