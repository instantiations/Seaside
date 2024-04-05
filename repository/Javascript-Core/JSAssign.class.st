"
I assign the decorated object to a global variable.
"
Class {
	#name : 'JSAssign',
	#superclass : 'JSMember',
	#category : 'Javascript-Core-Decorations',
	#package : 'Javascript-Core',
	#tag : 'Decorations'
}

{ #category : 'printing' }
JSAssign >> javascriptContentOn: aStream [
	aStream
		nextPutAll: self name;
		nextPut: $=.
	super javascriptContentOn: aStream
]