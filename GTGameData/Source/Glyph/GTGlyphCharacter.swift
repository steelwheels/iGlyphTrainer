/**
 * @file	GTGlyphCharacter.m
 * @brief	Define GTGlyphCharacter enum
 * @par Copyright
 *   Copyright (C) 2015-2016 Steel Wheels Project
 */

import Foundation

public enum GTGlyphCharacter
{
	case Abandon
	case Adapt
	case Advance
	case After
	case Again	; case Repeat
	case All
	case Answer
	case Attack	; case War
	case Avoid
	case Barrier	; case Obstacle
	case Before
	case Begin
	case Being	; case Human
	case Body	; case Shell
	case Breathe ;	case Live
	case Capture
	case Change	; case Modify
	case Chaos	; case Disorder
	case Clear
	case ClearAll ;	case CloseAll
	case Complex
	case Conflict
	case Consequence
	case Contemplate
	case Contact	;	case Reduce
	case Courage
	case Create	;	case Creation
	case Creativity ;	case Thought ;	case Idea
	case Danger
	case Data	;	case Signal ;
	case Defend
	case Destination
	case Destiny
	case Destroy	;	case Destruction
	case Deteriorate ;	case Erode
	case Die
	case Difficult
	case Discover
	case Distance	;	case Outside
	case Easy
	case End	;	case Close ;	case Finality
	case Enlightened ;	case Enlightenment
	case Equal
	case Escape
	case Evolution ;	case Success ;	case Progress
	case Failure
	case Fear
	case Follow
	case Forget
	case Future ;		case ForwardTime
	case Gain
	case Goverment ;	case City ;	case Civilization ;	case Structure
	case Grow
	case Harm
	case Harmony ;		case Peace
	case Have
	case Help
	case Hide
	case I ;		case Me ;
	case Ignore
	case Imperfect
	case Improve
	case Impure
	case Intelligence
	case Interrupt
	case Journey
	case Knowledge
	case Lead
	case Legacy
	case Less
	case Liberate
	case Lie
	case LiveAgain ;	case Reincarnate
	case Lose ;		case Loss
	case Message
	case Mind
	case More
	case Mystery
	case Nzeer
	case Nature
	case New
	case No ;	case Not ;	case Absent ;	case Inside
	case Nourish
	case Old
	case Open ;	case Accept
	case OpenAll
	case Opening ;	case Doorway ;	case Portal
	case Past
	case Path
	case Perfection ;	case Balance
	case Perspective
	case Potential
	case Presence
	case Present ;		case Now
	case Pure ;		case Purity
	case Pursue ;		case Aspiration
	case Chase
	case Question
	case React
	case Rebel
	case Recharge ;	case Repair
	case Resist ;	case Resistance ;	case Struggle
	case Restraint
	case Retreat
	case Safety
	case Save ;	case Rescure
	case See
	case Seek ;	case Search
	case _Self
	case Separate
	case Shaper ;	case Collective
	case Share
	case Simple
	case Soul ;	case Split ;	case LifeFource
	case Stability ;	case Stay
	case Strong
	case Sustain
	//case SustainAll
	case Technology
	case Together
	case Truth
	case Unbounded
	case Use
	case Victory
	case Want ;	case Desire
	case We ;	case Us
	case Weak
	case Worth
	case XM
	case You ;	case Other

	public func title() -> String {
		let result: String
		switch self {
		case .Abandon:		result = "Abandon"
		case .Adapt:		result = "Adapt"
		case .Advance:		result = "Advance"
		case .After:		result = "After"
		case .Again:		result = "Again"
		case .Repeat:		result = "Repeat"
		case .All:		result = "All"
		case .Answer:		result = "Answer"
		case .Attack:		result = "Attack"
		case .War:		result = "War"
		case .Avoid:		result = "Avoid"
		case .Barrier:		result = "Barrier"
		case .Obstacle:		result = "Obstacle"
		case .Before:		result = "Before"
		case .Begin:		result = "Begin"
		case .Being:		result = "Being"
		case .Human:		result = "Human"
		case .Body:		result = "Body"
		case .Shell:		result = "Shell"
		case .Breathe:		result = "Breathe"
		case .Live:		result = "Live"
		case .Capture:		result = "Capture"
		case .Change:		result = "Change"
		case .Modify:		result = "Modify"
		case .Chaos:		result = "Chaos"
		case .Disorder:		result = "Disorder"
		case .Clear:		result = "Clear"
		case .ClearAll:		result = "ClearAll"
		case .CloseAll:		result = "CloseAll"
		case .Complex:		result = "Complex"
		case .Conflict:		result = "Conflict"
		case .Consequence:	result = "Consequence"
		case .Contemplate:	result = "Contemplate"
		case .Contact:		result = "Contact"
		case .Reduce:		result = "Reduce"
		case .Courage:		result = "Courage"
		case .Create:		result = "Create"
		case .Creation:		result = "Creation"
		case .Creativity:	result = "Creativity"
		case .Thought:		result = "Thought"
		case .Idea:		result = "Idea"
		case .Danger:		result = "Danger"
		case .Data:		result = "Data"
		case .Signal:		result = "Signal"
		case .Defend:		result = "Defend"
		case .Destination:	result = "Destination"
		case .Destiny:		result = "Destiny"
		case .Destroy:		result = "Destroy"
		case .Destruction:	result = "Destruction"
		case .Deteriorate:	result = "Deteriorate"
		case .Erode:		result = "Erode"
		case .Die:		result = "Die"
		case .Difficult:	result = "Difficult"
		case .Discover:		result = "Discover"
		case .Distance:		result = "Distance"
		case .Outside:		result = "Outside"
		case .Easy:		result = "Easy"
		case .End:		result = "End"
		case .Close:		result = "Close"
		case .Finality:		result = "Finality"
		case .Enlightened:	result = "Enlightened"
		case .Enlightenment:	result = "Enlightenment"
		case .Equal:		result = "Equal"
		case .Escape:		result = "Escape"
		case .Evolution:	result = "Evolution"
		case .Success:		result = "Success"
		case .Progress:		result = "Progress"
		case .Failure:		result = "Failure"
		case .Fear:		result = "Fear"
		case .Follow:		result = "Follow"
		case .Forget:		result = "Forget"
		case .Future:		result = "Future"
		case .ForwardTime:	result = "ForwardTime"
		case .Gain:		result = "Gain"
		case .Goverment:	result = "Goverment"
		case .City:		result = "City"
		case .Civilization:	result = "Civilization"
		case .Structure:	result = "Structure"
		case .Grow:		result = "Grow"
		case .Harm:		result = "Harm"
		case .Harmony:		result = "Harmony"
		case .Peace:		result = "Peace"
		case .Have:		result = "Have"
		case .Help:		result = "Help"
		case .Hide:		result = "Hide"
		case .I:		result = "I"
		case .Me:		result = "Me"
		case .Ignore:		result = "Ignore"
		case .Imperfect:	result = "Imperfect"
		case .Improve:		result = "Improve"
		case .Impure:		result = "Impure"
		case .Intelligence:	result = "Intelligence"
		case .Interrupt:	result = "Interrupt"
		case .Journey:		result = "Journey"
		case .Knowledge:	result = "Knowledge"
		case .Lead:		result = "Lead"
		case .Legacy:		result = "Legacy"
		case .Less:		result = "Less"
		case .Liberate:		result = "Liberate"
		case .Lie:		result = "Lie"
		case .LiveAgain:	result = "LiveAgain"
		case .Reincarnate:	result = "Reincarnate"
		case .Lose:		result = "Lose"
		case .Loss:		result = "Loss"
		case .Message:		result = "Message"
		case .Mind:		result = "Mind"
		case .More:		result = "More"
		case .Mystery:		result = "Mystery"
		case .Nzeer:		result = "Nzeer"
		case .Nature:		result = "Nature"
		case .New: 		result = "New"
		case .No: 		result = "No"
		case .Not: 		result = "Not"
		case .Absent: 		result = "Absent"
		case .Inside: 		result = "Inside"
		case .Nourish: 		result = "Nourish"
		case .Old: 		result = "Old"
		case .Open: 		result = "Open"
		case .Accept: 		result = "Accept"
		case .OpenAll: 		result = "OpenAll"
		case .Opening: 		result = "Opening"
		case .Doorway: 		result = "Doorway"
		case .Portal: 		result = "Portal"
		case .Past: 		result = "Past"
		case .Path: 		result = "Path"
		case .Perfection: 	result = "Perfection"
		case .Balance: 		result = "Balance"
		case .Perspective: 	result = "Perspective"
		case .Potential: 	result = "Potential"
		case .Presence: 	result = "Presence"
		case .Present: 		result = "Present"
		case .Now: 		result = "Now"
		case .Pure: 		result = "Pure"
		case .Purity: 		result = "Purity"
		case .Pursue: 		result = "Pursue"
		case .Aspiration: 	result = "Aspiration"
		case .Chase: 		result = "Chase"
		case .Question: 	result = "Question"
		case .React: 		result = "React"
		case .Rebel: 		result = "Rebel"
		case .Recharge: 	result = "Recharge"
		case .Repair:		result = "Repair"
		case .Resist: 		result = "Resist"
		case .Resistance: 	result = "Resistance"
		case .Struggle: 	result = "Struggle"
		case .Restraint: 	result = "Restraint"
		case .Retreat: 		result = "Retreat"
		case .Safety: 		result = "Safety"
		case .Save: 		result = "Save"	
		case .Rescure: 		result = "Rescure"
		case .See: 		result = "See"
		case .Seek: 		result = "Seek"
		case .Search: 		result = "Search"
		case ._Self: 		result = "Self"
		case .Separate: 	result = "Separate"
		case .Shaper: 		result = "Shaper"
		case .Collective: 	result = "Collective"
		case .Share: 		result = "Share"
		case .Simple: 		result = "Simple"
		case .Soul: 		result = "Soul"
		case .Split: 		result = "Split"
		case .LifeFource: 	result = "LifeFource"
		case .Stability: 	result = "Stability"
		case .Stay: 		result = "Stay"
		case .Strong: 		result = "Strong"
		case .Sustain: 		result = "Sustain"
		//case .SustainAll: 	result = "SustainAll"
		case .Technology:	result = "Technology"
		case .Together: 	result = "Together"
		case .Truth: 		result = "Truth"
		case .Unbounded:	result = "Unbounded"
		case .Use: 		result = "Use"
		case .Victory: 		result = "Victory"
		case .Want: 		result = "Want"
		case .Desire: 		result = "Desire"
		case .We: 		result = "We"
		case .Us: 		result = "Us"
		case .Weak: 		result = "Weak"
		case .Worth: 		result = "Worth"
		case .XM: 		result = "XM"
		case .You: 		result = "You"
		case .Other: 		result = "Other"
		}
		return result
	}

	public func stroke() -> Array<(Int, Int)> {
		let result: Array<(Int, Int)>
		switch self {
		case .Abandon:		result = [( 3, 4), ( 4, 9), ( 9, 7), ( 7, 10), (10, 1)]
		case .Adapt:		result = [( 5, 9), ( 9, 7), ( 7, 8)]
		case .Advance:		result = [( 4, 6), ( 6, 0)]
		case .After:		result = [( 7,10), (10, 1), ( 1, 2), ( 2,  8), ( 8, 7)]
		case .Again,
		     .Repeat:		result = [( 4, 6), ( 6, 9), ( 9,10), (10, 8)]
		case .All:		result = [( 0, 1), ( 1, 2), ( 2, 3), ( 3, 4), (4, 5), ( 5, 0)]
		case .Answer:		result = [( 6,10), (10, 8), ( 8, 7)]
		case .Attack,
		     .War:		result = [( 4, 6), ( 6,10), ( 0,10), (10, 2)]
		case .Avoid:		result = [( 5,10), ( 0,10), (10, 1), ( 1, 8)]
		case .Barrier,
		     .Obstacle:		result = [( 0, 7), ( 7, 8), ( 8, 2)]
		case .Before:		result = [( 5, 6), ( 6, 7), ( 7, 9), ( 9, 4), ( 4, 5)]
		case .Begin:		result = [( 8, 3), ( 3, 9), ( 9, 0)]
		case .Being,
		     .Human:		result = [( 6,10), (10, 8), ( 8, 3), ( 3, 9), ( 9, 6)]
		case .Body,
		     .Shell:		result = [( 7, 6), ( 6,10), (10, 7)]
		case .Breathe,
		     .Live:		result = [( 5, 6), ( 6, 7), ( 7,10), (10, 1)]
		case .Capture:		result = [( 1, 8), ( 8, 7), ( 7, 9), ( 9, 4), ( 4, 3)]
		case .Change,
		     .Modify:		result = [( 9, 7), ( 7, 3), ( 3, 8)]
		case .Chaos,
		     .Disorder:		result = [( 4, 5), ( 5, 0), ( 0, 1), ( 1,10), (10, 7), ( 7, 9), ( 9, 3)]
		case .Clear:		result = [( 0, 7), ( 7, 3)]
		case .ClearAll,
		     .CloseAll:		result = [( 0, 1), ( 1, 2), ( 2, 3), ( 3, 4), ( 4, 5), ( 5, 0), ( 0, 7), ( 7, 3)]
		case .Complex:		result = [(10, 6), ( 6, 7), ( 7, 9)]
		case .Conflict:		result = [( 4, 6), ( 6, 9), ( 9, 8), ( 8,10), (10, 2)]
		case .Consequence:	result = [( 5, 6), ( 6, 9), ( 9, 8), ( 8, 2)]
		case .Contemplate:	result = [( 0, 1), ( 1, 2), ( 2, 3), ( 3, 9), ( 9, 6), ( 6, 7), ( 7,10)]
		case .Contact,
		     .Reduce:		result = [( 8,10), (10, 2)]
		case .Courage:		result = [( 4, 6), ( 6, 9), ( 9, 8)]
		case .Create,
		     .Creation:		result = [( 4, 9), ( 9, 7), ( 7,10), (10, 1)]
		case .Creativity:	result = [( 6, 7), ( 7, 3), ( 3, 6)]
		case .Thought,
		     .Idea:		result = [(10, 1), ( 1, 2), ( 2, 8), ( 8, 7), ( 7, 6), ( 6, 5), ( 5, 4), ( 4, 9)]
		case .Danger:		result = [( 0, 6), ( 6, 7), ( 7, 3)]
		case .Data,
		     .Signal:		result = [( 0,10), (10, 7), ( 7, 9), ( 9, 3)]
		case .Defend:		result = [( 5, 9), ( 9, 3), ( 3, 8), ( 8, 1)]
		case .Destination:	result = [( 1, 2), ( 2, 3)]
		case .Destiny:		result = [( 6, 7), ( 7,10), (10, 8), ( 8, 9), ( 9, 3)]
		case .Destroy,
		     .Destruction:	result = [( 5, 6), ( 6, 7), ( 7, 8), ( 8, 2)]
		case .Deteriorate,
		     .Erode:		result = [( 6, 7), ( 7, 9), ( 9, 4)]
		case .Die:		result = [( 4, 9), ( 9, 7), ( 7, 8), ( 8, 2)]
		case .Difficult:	result = [( 9, 7), ( 7, 8), ( 8,10), (10, 1)]
		case .Discover:		result = [( 1, 2), ( 2, 3), ( 3, 4)]
		case .Distance,
		     .Outside:		result = [( 0, 5), ( 5, 4)]
		case .Easy:		result = [(10, 7), ( 7, 9), ( 9, 3)]
		case .End,
		     .Close,
		     .Finality:		result = [( 0, 1), ( 1, 3), ( 3, 7), ( 7, 0)]
		case .Enlightened,
		     .Enlightenment:	result = [( 3, 2), ( 2, 1), ( 1, 0), ( 0, 6), ( 6, 7), ( 7,10), (10, 6)]
		case .Equal:		result = [( 9, 6), ( 6,10), (10, 8)]
		case .Escape:		result = [( 0, 1), ( 1,10), (10, 6), ( 6, 9)]
		case .Evolution,
		     .Success,
		     .Progress:		result = [( 0, 7), ( 7, 6), ( 6, 9)]
		case .Failure:		result = [( 0, 7), ( 7,10), (10, 8)]
		case .Fear:		result = [( 6,10), (10, 8), ( 8, 1)]
		case .Follow:		result = [( 0,10), (10, 1), ( 1, 2)]
		case .Forget:		result = [( 4, 9)]
		case .Future,
		     .ForwardTime:	result = [( 1,10), (10, 8), ( 8, 2)]
		case .Gain:		result = [( 5, 9)]
		case .Goverment,
		     .City,
		     .Civilization,
		     .Structure:	result = [( 5, 6), ( 6, 9), ( 9, 8), ( 8,10), (10, 1)]
		case .Grow:		result = [( 4, 6), ( 6, 9)]
		case .Harm:		result = [( 7, 6), ( 6, 0), ( 0,10), (10, 7), ( 7, 8), ( 8, 2)]
		case .Harmony,
		     .Peace:		result = [( 7, 6), ( 6,10), ( 0,10), (10, 7), ( 7, 9), ( 9, 3), ( 3, 8), ( 8, 7)]
		case .Have:		result = [( 8, 7), ( 7, 9), ( 9, 3)]
		case .Help:		result = [( 5, 6), ( 6, 7), ( 7, 9), ( 9, 8)]
		case .Hide:		result = [( 6,10), (10, 1), ( 1, 8), ( 8, 9)]
		case .I,
		     .Me:		result = [( 6,10), (10, 3), ( 3, 6)]
		case .Ignore:		result = [( 8, 2)]
		case .Imperfect:	result = [( 7, 6), ( 6, 9), ( 9, 7), ( 7,10), (10, 9)]
		case .Improve:		result = [( 1,10), (10, 7), ( 7, 8)]
		case .Impure:		result = [( 7, 6), ( 6, 9), ( 9, 7), ( 7, 3)]
		case .Intelligence:	result = [( 4, 9), ( 9, 6), ( 7,10), (10, 1)]
		case .Interrupt:	result = [( 0, 7), ( 7, 6), ( 6, 5), ( 5, 4), ( 4, 9), ( 9, 7), ( 7, 3)]
		case .Journey:		result = [( 1,10), (10, 7), ( 7, 6), ( 6, 5), ( 5, 4), ( 4, 3)]
		case .Knowledge:	result = [( 6, 7), ( 7,10), (10, 3), ( 3, 6)]
		case .Lead:		result = [( 0, 5), ( 5, 4), ( 4, 9), ( 9, 3)]
		case .Legacy:		result = [( 4, 9), ( 9, 6), ( 6, 5), ( 5, 0), ( 0, 1), ( 1,10), (10, 8), ( 8, 2)]
		case .Less:		result = [( 6, 7), ( 7,10)]
		case .Liberate:		result = [( 0, 1), ( 1,10), (10, 7), ( 7, 6), ( 6, 4)]
		case .Lie:		result = [( 7,10), (10, 8), ( 8, 7), ( 7, 6), ( 6, 9)]
		case .LiveAgain,
		     .Reincarnate:	result = [( 4, 6), ( 6, 9), ( 9, 7), ( 7,10), (10, 1)]
		case .Lose,
		     .Loss:		result = [( 1, 8)]
		case .Message:		result = [( 1, 8), ( 8, 7), ( 7, 6), ( 6, 4)]
		case .Mind:		result = [( 6, 7), ( 7, 3), ( 3, 9), ( 9, 6)]
		case .More:		result = [( 9, 7), ( 7, 8)]
		case .Mystery:		result = [( 5, 6), ( 6,10), (10, 0), ( 0, 6), ( 6, 9)]
		case .Nzeer:		result = [( 0, 6), ( 6, 7), ( 7,10), (10, 0), ( 0, 7), ( 7, 3)]
		case .Nature:		result = [( 4, 9), ( 9, 6), ( 6,10), (10, 8), ( 8, 2)]
		case .New:		result = [(10, 8), ( 8, 2)]
		case .No,
		     .Not,
		     .Absent,
		     .Inside:		result = [( 6,10), (10, 8)]
		case .Nourish:		result = [( 7, 3), ( 3, 4), ( 4, 9), (9, 7)]
		case .Old:		result = [( 5, 6), ( 6, 9)]
		case .Open,
		     .Accept:		result = [( 8, 3), ( 3, 9), ( 9, 8)]
		case .OpenAll:		result = [( 3, 4), ( 4, 5), ( 5, 0), ( 0, 1), ( 1, 2), ( 2, 3), ( 3, 9), ( 9, 8), ( 8, 3)]
		case .Opening,
		     .Doorway,
		     .Portal:		result = [( 5, 6), ( 6,10), (10, 1), ( 1, 2), ( 2, 8), ( 8, 9), ( 9, 4), ( 4, 5)]
		case .Past:		result = [( 5, 6), ( 6, 9), ( 9, 4)]
		case .Path:		result = [( 0, 7), ( 7, 9), ( 9, 4)]
		case .Perfection,
		     .Balance:		result = [( 0, 7), ( 7, 9), ( 9, 4), ( 4, 3), ( 3, 2), ( 2, 8), ( 8, 7)]
		case .Perspective:	result = [( 2, 8), ( 8, 7), ( 7, 6), ( 6, 0), ( 0,10), (10, 7), ( 7, 9), ( 9, 4)]
		case .Potential:	result = [( 0, 7), ( 7, 8), ( 8, 2), ( 2, 1)]
		case .Presence:		result = [( 9, 6), ( 6, 7), ( 7,10), (10, 8), ( 8, 9), ( 9, 3), ( 3, 8)]
		case .Present,
		     .Now:		result = [( 6, 9), ( 9, 8), ( 8, 10)]
		case .Pure,
		     .Purity:		result = [( 0, 7), ( 7, 8), ( 8, 10), (10, 7)]
		case .Pursue,
		     .Aspiration:	result = [( 5, 6), ( 6,10), ( 0,10)]
		case .Chase:		result = [( 0, 7), ( 7, 6), ( 6, 9), ( 9, 4)]
		case .Question:		result = [( 0,10), (10, 6), ( 6, 9)]
		case .React:		result = [(10, 6), ( 6, 7), ( 7, 8), ( 8, 2)]
		case .Rebel:		result = [( 5, 9), ( 9, 7), ( 7,10), (10, 1), ( 1, 2)]
		case .Recharge,
		     .Repair:		result = [( 0, 7), ( 7, 6), ( 6, 5), ( 5, 0)]
		case .Resist,
		     .Resistance,
		     .Struggle:		result = [(10, 6), ( 6, 0), ( 0, 7), ( 7, 3), ( 3, 9)]
		case .Restraint:	result = [( 5, 6), ( 6, 7), ( 7, 8), ( 8, 2), ( 2, 3)]
		case .Retreat:		result = [( 0,10), (10, 2)]
		case .Safety:		result = [( 4, 6), ( 6,10), (10, 2)]
		case .Save,
		     .Rescure:		result = [( 1, 8), ( 8, 7), ( 7, 9)]
		case .See:		result = [( 0, 6)]
		case .Seek,
		     .Search:		result = [( 7,10), (10, 6), ( 6, 9), ( 9, 8)]
		case ._Self:		result = [( 2, 3), ( 3, 4)]
		case .Separate:		result = [( 5, 6), ( 6, 9), ( 9, 7), ( 7,10), (10, 8), ( 8, 2)]
		case .Shaper,
		     .Collective:	result = [( 4, 9), ( 9, 6), ( 6, 0), ( 0,10), (10, 8), ( 8, 2)]
		case .Share:		result = [( 2, 8), ( 8, 9), ( 9, 4), ( 4, 3)]
		case .Simple:		result = [( 9, 8)]
		case .Soul,
		     .Split,
		     .LifeFource:	result = [(10, 8), ( 8, 3), ( 3, 7), ( 7,10)]
		case .Stability,
		     .Stay:		result = [( 4, 9), ( 9, 8), ( 8, 2)]
		case .Strong:		result = [( 6,10), (10, 8), ( 8, 9), ( 9, 6)]
		case .Sustain:		result = [( 0, 7), ( 7,10), (10, 1), ( 1, 2), ( 2, 8), ( 8, 7), ( 7, 3)]
		//case .SustainAll:	result = []
		case .Technology:	result = [( 1,10), (10, 7), ( 7, 9), ( 9, 6), ( 6, 7), ( 7, 8), ( 8, 2)]
		case .Together:		result = [( 7, 6), ( 6,10), (10, 7), ( 7, 9), ( 9, 4)]
		case .Truth:		result = [( 7, 9), ( 9, 6), ( 6, 7), ( 7, 8), ( 8,10), (10, 7)]
		case .Unbounded:	result = [( 7,10), (10, 6), ( 6, 9), ( 9, 8), ( 8, 1), ( 1, 0), ( 0, 5), ( 5, 4), ( 4, 3), ( 3, 2)]
		case .Use:		result = [( 7, 8), ( 8, 1)]
		case .Victory:		result = [( 0,10), (10, 3), ( 3, 6), ( 6, 0)]
		case .Want,
		     .Desire:		result = [( 4, 9), ( 9, 3), ( 3, 8)]
		case .We,
		     .Us:		result = [( 6,10), (10, 3)]
		case .Weak:		result = [( 5, 6), ( 6,10), (10, 8)]
		case .Worth:		result = [( 5, 9), ( 9, 7), ( 7, 8), ( 8, 1)]
		case .XM:		result = [( 6,10), (10, 8), ( 8, 7), ( 7, 9), ( 9, 6)]
		case .You,
		     .Other:		result = [( 0, 8), ( 8, 9), ( 9, 0)]
		}

		return result
	}
}



