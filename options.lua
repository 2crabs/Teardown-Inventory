
function draw()
	--add value if nil
	if (GetBool("savegame.mod.sledge") == nil) then
		SetBool("savegame.mod.sledge", true)
	end

	if (GetBool("savegame.mod.outline") == nil) then
		SetBool("savegame.mod.outline", true)
	end

	if (GetBool("savegame.mod.smart") == nil) then
		SetBool("savegame.mod.smart", true)
	end

	UiTranslate(UiCenter(), 300)
	UiAlign("center middle")
	--Title
	UiTranslate(0, -160)
	UiFont("bold.ttf", 88)
	UiText("Inventory mod")
	UiFont("bold.ttf", 40)
	UiTranslate(0, 110)
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
	UiTranslate(0, 80)
	UiFont("bold.ttf", 40)
	UiText("Options")
	UiTranslate(-100, 80)
	UiFont("regular.ttf", 30)
	UiText("Only allow use with sledge")
	UiTranslate(250,-2)
	if (GetBool("savegame.mod.sledge")) then
		UiColor(1, 1, 0.4, 1)
		if UiTextButton("disabled") then
			SetBool("savegame.mod.sledge", false)
		end
	else
		UiColor(1, 1, 0.4, 1)
		if UiTextButton("enabled") then
			SetBool("savegame.mod.sledge", true)
		end
	end
	UiTranslate(-250, 50)
	UiColor(1, 1, 1, 1)
	UiFont("regular.ttf", 30)
	UiText("Outline objects")
	UiTranslate(250,-2)
	if (GetBool("savegame.mod.outline")) then
		UiColor(1, 1, 0.4, 1)
		if UiTextButton("disabled") then
			SetBool("savegame.mod.outline", false)
		end
	else
		UiColor(1, 1, 0.4, 1)
		if UiTextButton("enabled") then
			SetBool("savegame.mod.outline", true)
		end
	end
	UiTranslate(-250, 50)
	UiColor(1, 1, 1, 1)
	UiFont("regular.ttf", 30)
	UiText("Placement type")
	UiTranslate(250,-2)
	if (GetBool("savegame.mod.smart")) then
		UiColor(1, 1, 0.4, 1)
		if UiTextButton("regular") then
			SetBool("savegame.mod.smart", false)
		end
	else
		UiColor(1, 1, 0.4, 1)
		if UiTextButton("smart") then
			SetBool("savegame.mod.smart", true)
		end
	end
end

