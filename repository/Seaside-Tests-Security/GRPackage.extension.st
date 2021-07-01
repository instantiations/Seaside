Extension { #name : #GRPackage }

{ #category : #'*seaside-tests-security' }
GRPackage class >> seasideTestsSecurity [
	^ self new
		name: 'Seaside-Tests-Security';
		addDependency: 'Seaside-Security';
		addDependency: 'Seaside-Tests-Core';
		url: #seasideUrl;
		yourself
]