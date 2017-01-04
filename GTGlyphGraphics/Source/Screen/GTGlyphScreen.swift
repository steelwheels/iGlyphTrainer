/**
 * @file	GTGlyphCore.swift
 * @brief	Define GTGlyphCore class
 * @par Copyright
 *   Copyright (C) 2016 Steel Wheels Project
 */

import KiwiControls

public class GTGlyphScreen: KCView
{
	private var mCoreView: GTGlyphScreenCore? = nil

	#if os(OSX)
	public override init(frame : NSRect){
	super.init(frame: frame) ;
	setupContext() ;
	}
	#else
	public override init(frame: CGRect){
		super.init(frame: frame) ;
		setupContext()
	}
	#endif

	public required init?(coder: NSCoder) {
		super.init(coder: coder) ;
		setupContext() ;
	}

	private func setupContext(){
		if let coreview = loadChildXib(thisClass: GTGlyphScreen.self, nibName: "GTGlyphScreenCore") as? GTGlyphScreenCore {
			mCoreView = coreview
			coreview.setup()
		} else {
			fatalError("Can not load GTGlyphScreenCore")
		}
	}

	public final override func observe(state stat: CNState){
	}

	private func coreView() -> GTGlyphScreenCore {
		if let coreview = mCoreView {
			return coreview
		} else {
			fatalError("No core view")
		}
	}
}
