//
//  ViewController.swift
//  UTProgressView
//
//  Created by Tomoo Hamada on 2016/12/06.
//  Copyright © 2016年 Steel Wheels Project. All rights reserved.
//

import UIKit
import GTGlyphGraphics
import KiwiControls

class ViewController: UIViewController
{
	@IBOutlet weak var mLayerView: KCLayerView!

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view, typically from a nib
	}

	override func viewDidLayoutSubviews() {
		let progress = GTProgressLayer(kind: .Question, stepNum: 3, frame: mLayerView.bounds)
		//progress.backgroundColor = KGColorTable.yellow.cgColor
		mLayerView.rootLayer.addSublayer(progress)
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}

