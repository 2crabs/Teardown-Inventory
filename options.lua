function draw()
	UiTranslate(UiCenter(), 300)
	UiAlign("center middle")

	--Title
	UiTranslate(0, -100)
	UiFont("bold.ttf", 88)
	UiText("Inventory mod")
	UiFont("bold.ttf", 40)
	UiTranslate(0, 150)
	UiText("Controls")
	UiFont("regular.ttf", 30)
	UiTranslate(0, 40)
	UiText("q: Pick up object")
	UiTranslate(0, 60)
	UiText("r: open menu (need to hold down for menu to stay open)")
	UiTranslate(0, 40)
	UiText(" select item to place by clicking on word for the item")
	UiTranslate(0, 50)
	UiText("example: Click on Item 1 to place Item 1")
	UiTranslate(0, 60)
	UiText("t and y: Rotate a item when in placing mode")
	UiTranslate(0, 60)
	UiText("u and j: Move a item up and down when in placing mode")


end

