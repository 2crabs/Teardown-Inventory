function init()
	--creates arrays for object data
	isstored = {}
	storedhb = {}
	storedhbt = {}
	readytoplace = {}

	keyPos = 0
	keyPos2 = 4
end

function tick(dt)
	rejectBodies()

	local pt = GetPlayerTransform()
	local ct = GetCameraTransform()

	local md = 500
	local f = TransformToParentPoint(ct, Vec(0, 0, md * - 1))
	local d = VecSub(f, ct.pos)
	d = VecNormalize(d)
	hit, dist, normal, hs = QueryRaycast(ct.pos, d, md)

	hb = GetShapeBody(hs)
	hj = GetShapeJoints(hs)

	hbt = GetBodyTransform(hb)
	lookAt = TransformToParentPoint(ct, Vec(0, 0, dist * - 1))

	--checks if not static with GetBodyMass(hb) > 0
	if(hit and GetBodyMass(hb) > 0 and GetPlayerVehicle() == 0) then
		DrawBodyOutline(hb,1,1,1,0.5)
		if(InputPressed("q")) then
			--set storage
			for i = 1,4,1 
			do
				for i=1, #hj do
					Delete(hj[i])
				end
				if(not (isstored[i])) then
					storedhb[i] = hb
					storedhbt[i] = GetBodyTransform(storedhb[i])
					isstored[i] = true
					break
				end
				if (i ==4) then
					SetString("hud.notification","Inventory full")
				end
			end
		end
	end

	--Sends it beneath the world if it is stored
	for i = 1,4,1 
	do 
		if(isstored[i]) then
			SetBodyTransform(storedhb[i],Transform(Vec(0,-100*i,0),storedhbt[i].rot))
		end
	end

	--beginning of menu script
	if (InputDown("r")) then
		show = true
	else
		show = false
	end

	--placement

	for i = 1,4,1 
	do 
		if(readytoplace[i]) then
			--change amount of rotation.not currently used for control.
			if(InputDown("t")) then
				keyPos = keyPos + 0.1
			end
			if(InputDown("y")) then
				keyPos = keyPos - 0.1
			end

			if(InputDown("u")) then
				keyPos2 = keyPos2 + 0.1
			end
			if(InputDown("j") and keyPos2 > -0.1) then
				keyPos2 = keyPos2 - 0.1
			end
		
			--keyboard is used for rotation.
			SetBodyTransform(storedhb[i],Transform(VecAdd(lookAt, Vec(0,keyPos2/4,0)),QuatEuler(0,keyPos*15,0)))
			SetBodyVelocity(storedhb[i], Vec(0,0,0))
			SetBodyAngularVelocity(storedhb[i], Vec(0,0,0))
			DrawBodyHighlight(storedhb[i], 0.6)
			--drop object when lmb is pressed
			if (InputDown("lmb")or GetPlayerVehicle()>0) then
				readytoplace[i] = false
				storedhb[i] = nil
				keyPos2 = 4
			end
		end
	end
	
end

function draw()
	if (show) then
		UiMakeInteractive()
		UiTranslate(UiCenter(), 200)
		UiAlign("center middle")
		UiFont("bold.ttf", 70)
		UiText("Inventory")
		UiFont("regular.ttf", 48)
		UiTranslate(0, 200)
		UiColor(0.8,0.8,0.8,0.7)
		--big box
		UiRect(870,300)
		--start of middle boxes
		UiColor(0.2,0.2,0.2,09)

		UiTranslate(-300, 0)
		UiRect(190,250)
		if (isstored[1]) then
			if UiTextButton("Item 1",190, 250) then
				if(isstored[1] and hit) then
					StoreItem(1)
				end
			end
		else
			UiTextButton("Empty",190, 250)
		end

		UiTranslate(200, 0)
		UiRect(190,250)
		if (isstored[2]) then
			if UiTextButton("Item 2",190, 250) then
				if(isstored[2] and hit) then
					StoreItem(2)
				end
			end
		else
			UiTextButton("Empty",190, 250)
		end
		

		UiTranslate(200, 0)
		UiRect(190,250)
		if (isstored[3]) then
			if UiTextButton("Item 3",190, 250) then
				if(isstored[3] and hit) then
					StoreItem(3)
				end
			end
		else
			UiTextButton("Empty",190, 250)
		end

		UiTranslate(200, 0)
		UiRect(190,250)
		if (isstored[4]) then
			if UiTextButton("Item 4",190, 250) then
				if(isstored[4] and hit) then
					StoreItem(4)	
				end
			end
		else
			UiTextButton("Empty",190, 250)
		end
	end
end

--used to reject bodies when placing them. Raycast can not see them. Like when placing a car so raycast goes through car to ground instead of hitting the car.
function rejectBodies()
	for i = 1,4,1 
	do 
		QueryRejectBody(storedhb[i])
		if(GetBodyVehicle(storedhb[i])) then
			QueryRejectVehicle(GetBodyVehicle(storedhb[i]))
		end
	end
end

function StoreItem(StoredNum)
	SetBodyTransform(storedhb[StoredNum],Transform(VecAdd(lookAt, Vec(0,1,0)),storedhbt[StoredNum].rot))
	SetBodyVelocity(storedhb[StoredNum], Vec(0,0,0))
	isstored[StoredNum] = false
	readytoplace[StoredNum] = true
end
