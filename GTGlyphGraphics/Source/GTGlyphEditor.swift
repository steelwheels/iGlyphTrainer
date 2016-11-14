/**
 * @file	GTGlyphEditor.swift
 * @brief	Define GTGlyphEditor class
 * @par Copyright
 *   Copyright (C) 2016 Steel Wheels Project
 */

import KiwiControls
import KiwiGraphics
import GTGameData

public class GTGlyphEditor: KCStrokeDrawer
{
	private weak var mState: GTState?

	public init(state s: GTState, bounds b: CGRect){
		mState = s
		super.init(bounds: b)
		super.lineWidth = GTGlyphPreference.glyphStrokeWidth
		super.lineColor = GTGlyphPreference.glyphStrokeColor
	}

	public override func mouseEvent(event evt: KCMouseEvent, at point: CGPoint) -> KCMouseEventResult {
		switch evt {
		case .down:
			setProgress(progress: .editing)
		case .drag:
			setProgress(progress: .editing)
		case .up:
			setProgress(progress: .finished)
		}
		return super.mouseEvent(event: evt, at: point)
	}

	private func setProgress(progress p: GTEditState.GTProgress){
		if let state = editState() {
			switch state.progress {
			case .idle:
				if p == .editing {
					state.progress = p
				}
			case .editing:
				if p == .finished {
					state.progress = p
				}
			case .finished:
				/* Can not change */
				break ;
			}
		}
	}

	private func editState() -> GTEditState? {
		if let state = mState {
			return state.childState as? GTEditState
		} else {
			return nil
		}
	}
}

