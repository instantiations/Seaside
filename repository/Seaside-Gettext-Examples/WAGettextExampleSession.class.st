Class {
	#name : 'WAGettextExampleSession',
	#superclass : 'WASession',
	#category : 'Seaside-Gettext-Examples',
	#package : 'Seaside-Gettext-Examples'
}

{ #category : 'initialization' }
WAGettextExampleSession >> initializeFilters [
	super initializeFilters.
	self addFilter: WALocalizationContextFilter new
]