Class {
	#name : #GtRenamerExamples,
	#superclass : #Object,
	#category : #'GToolkit-Completer-Examples'
}

{ #category : #examples }
GtRenamerExamples >> smalltalkRenamer [
	<gtExample>
	| text styler editor editorElement completionStrategy completionController |
	text := 'double: anInteger
	^ anInteger + anInteger' asRopedText.
	text
		attributes:
			{BrFontGenericFamilyAttribute monospace beNotOverwritableByStyler.
			(BrFontSizeAttribute size: 14) beNotOverwritableByStyler}.
	styler := BrRBTextStyler new.
	styler classOrMetaClass: GtPharoCompletionStrategy.
	editorElement := BrEditorElement new.
	editor := BrTextEditor new.
	editor styler: styler.
	editor text: text.
	editor interactions
		add:
			(BlShortcut new
				combination:
					(BlKeyCombination builder
						meta;
						key: Key r;
						build);
				action: [ GtRenameAction pharoRenameLocalsOn: editorElement ]).
	editorElement
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
	editorElement editor: editor.
	completionStrategy := GtPharoCompletionStrategy newForMethod.
	completionStrategy classOrMetaClass: GtPharoCompletionStrategy.
	completionController := GtCompletionController on: editorElement strategy: completionStrategy.
	completionController install.
	^ editorElement
]