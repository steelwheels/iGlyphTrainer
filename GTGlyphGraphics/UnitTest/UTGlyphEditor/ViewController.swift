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
	@IBOutlet weak var mGraphicsView: KCGraphicsView!
	private var mGraphicsDrawer = KCGraphicsDrawer()
	private static let DO_DEBUG = false
	
	override func viewDidLoad() {
		super.viewDidLoad()

		/* Set state */
		self.state = GTState()
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()

		let bounds = mGraphicsView.bounds
		
		/* Add Background */
		let background = KCBackgroundDrawer(bounds: bounds)
		background.color = KGColorTable.black.cgColor
		mGraphicsDrawer.addLayer(layer: background)

		/* Add GlyphVertex */
		let verticedrawer = GTVerticesDrawer(bounds: bounds)
		mGraphicsDrawer.addLayer(layer: verticedrawer)

		/* Add GlyphEditor */
		let state = self.state as! GTState
		state.scene = .EditScene
		let glypheditor = GTGlyphEditor(state: state, bounds: bounds)
		mGraphicsDrawer.addLayer(layer: glypheditor)
		
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

	open override func observe(state s: CNState){
		if let state = s as? GTState {
			print("state: \(state.description)")
		} else {
			fatalError("Invalid state")
		}
	}
}

