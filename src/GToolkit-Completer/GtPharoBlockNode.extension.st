Extension { #name : #GtPharoBlockNode }

{ #category : #'*GToolkit-Completer' }
GtPharoBlockNode >> defines: aString [
	^ variables anySatisfy: [ :each | each name value = aString ]
]

{ #category : #'*GToolkit-Completer' }
GtPharoBlockNode >> guessType: aClass [
	^ [  ] class
]

{ #category : #'*GToolkit-Completer' }
GtPharoBlockNode >> localVariablesInto: aCollection [
	variables do: [ :each | aCollection add: each name value ].
	super localVariablesInto: aCollection
]