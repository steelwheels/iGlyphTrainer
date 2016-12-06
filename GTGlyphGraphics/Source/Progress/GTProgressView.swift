/**
 * @file	GTProgressView.swift
 * @brief	Define GTProgressView class
 * @par Copyright
 *   Copyright (C) 2016 Steel Wheels Project
 */

import UIKit
import KiwiControls
import GTGameData

public class GTProgressView: KCView
{
	public var scene: GTScene = .QuestionScene

	private let MAX_STEP_NUM			= 5
	private var mSymbols: Array<GTProgressSymbol>	= []

	public override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}

	private func setup()
	{
		let width  = min(frame.size.width / CGFloat(MAX_STEP_NUM), frame.size.height)
		let height = width
		let left   = (frame.size.width - (width * CGFloat(MAX_STEP_NUM))) / 2.0
		let top    = (frame.size.height - height) / 2.0

		/* Initialize symbols */
		let symorigin = bounds.origin
		var symbounds = CGRect(x: symorigin.x + left,
		                       y: symorigin.y + top,
		                       width: width,
		                       height: height)
		for _ in 0..<MAX_STEP_NUM {
			mSymbols.append(GTProgressSymbol(scene: scene, bounds: symbounds))
			symbounds.origin.x += width
		}
	}

	public override func draw(_ rect: CGRect) {
		if let context = currentContext {
			for symbol in mSymbols {
				symbol.draw(context: context, in: rect)
			}
		}
	}
}
