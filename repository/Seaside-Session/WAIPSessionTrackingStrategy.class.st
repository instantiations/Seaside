"
I track sessions using the remote address of a client. Usually you don't want to use this because it causes troubles when multiple users share the same IP (eg. several users from the same company). That's why I'm marked as abstract.

There are some special cases like crawlers where it can work though.
"
Class {
	#name : 'WAIPSessionTrackingStrategy',
	#superclass : 'WAInvisibleSessionTrackingStrategy',
	#category : 'Seaside-Session-Tracking',
	#package : 'Seaside-Session',
	#tag : 'Tracking'
}

{ #category : 'testing' }
WAIPSessionTrackingStrategy class >> isAbstract [
	^ true
]

{ #category : 'private' }
WAIPSessionTrackingStrategy >> sessionIdFromContext: aRequestContext [
	^ aRequestContext request forwardedFor ifNil:[ aRequestContext request remoteAddress ]
]