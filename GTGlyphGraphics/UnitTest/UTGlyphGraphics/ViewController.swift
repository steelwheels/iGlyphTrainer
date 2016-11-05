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
	private var mGraphicsDrawer = KCGraphicsDrawer()

	private static let DO_DEBUG = false

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func viewDidLayoutSubviews() {
		let bounds = mGraphicsView.bounds

		/* Add Background */
		let background = KCBackgroundDrawer(bounds: bounds)
		background.color = KGColorTable.black.cgColor
		mGraphicsDrawer.addLayer(layer: background)

		/* Add GlyphVertex */
		let verticedrawer = GTVerticesDrawer(bounds: bounds)
		mGraphicsDrawer.addLayer(layer: verticedrawer)

		/* Add GlyphDrawer */
		let glyphdrawer = GTGlyphDrawer(bounds: bounds)
		mGraphicsDrawer.addLayer(layer: glyphdrawer)

		glyphdrawer.glyphCharacter = .Destiny
		
		mGraphicsView!.drawCallback = {
			(context:CGContext, bounds:CGRect, dirtyRect:CGRect) -> Void in
			if ViewController.DO_DEBUG {
				Swift.print("ViewController.drawCallback: bounds:\(bounds.description) dirty:\(dirtyRect.description)")
			}
			self.mGraphicsDrawer.drawContent(context: context, bounds: bounds, dirtyRect: dirtyRect)
		}

		mGraphicsView!.mouseEventCallback = {
			(event: KCMouseEvent, point: CGPoint) -> KCMouseEventResult in
			return self.mGraphicsDrawer.mouseEvent(event: event, at: point)
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

