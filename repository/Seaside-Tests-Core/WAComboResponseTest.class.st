Class {
	#name : 'WAComboResponseTest',
	#superclass : 'WAResponseTest',
	#category : 'Seaside-Tests-Core-HTTP',
	#package : 'Seaside-Tests-Core',
	#tag : 'HTTP'
}

{ #category : 'accessing' }
WAComboResponseTest >> contents [
	| stream |
	stream := WriteStream on: String new.
	self response writeOn: stream.
	^ stream contents
]

{ #category : 'accessing' }
WAComboResponseTest >> response [
	^ super response ifNil: [ response := WAComboResponse external: (GRPlatform current writeCharacterStreamOn: (String new: 4096)) ]
]

{ #category : 'tests-conveniance' }
WAComboResponseTest >> testEmptyAfterReset [
	| resetPossible |
	resetPossible := self response
		status: WAResponse statusNotFound;
		attachmentWithFileName: 'upload.csv';
		nextPutAll: 'the content';
		resetIfPossible.
	self assert: resetPossible.
	self assertLines: #('HTTP/1.1 200 OK' 'Content-Length: 0' '')
]

{ #category : 'tests' }
WAComboResponseTest >> testIsCommitted [
	super testIsCommitted.
	self deny: self response isCommitted
]

{ #category : 'tests-conveniance' }
WAComboResponseTest >> testResetThenWrite [
	| resetPossible |
	resetPossible := self response
		status: WAResponse statusNotFound;
		attachmentWithFileName: 'upload.csv';
		nextPutAll: 'the wrong content';
		resetIfPossible.
	self assert: resetPossible.
	self response
		status: WAResponse statusImATeapot;
		headerAt: 'X-The-Header' put: 'the value';
		nextPutAll: 'the real content'.
	self assertLines: #('HTTP/1.1 418 I''m a teapot' 'X-The-Header: the value' 'Content-Length: 16' '' 'the real content')
]