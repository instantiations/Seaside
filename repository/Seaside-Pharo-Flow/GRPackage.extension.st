Extension { #name : 'GRPackage' }

{ #category : '*seaside-pharo-flow' }
GRPackage class >> seasidePharoFlow [
	^ self new
		name: 'Seaside-Pharo-Flow';
		addDependency: 'Seaside-Flow';
		addDependency: 'Grease-Pharo-Core';
		addDependency: 'Seaside-Pharo-Continuation';
		url: #seasideUrl;
		yourself
]