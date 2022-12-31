local properties = {
	"Position","Size","Color","Color3","BrickColor","CastShandow","Material","Reflectance","Transparency","Locked","Name","Parent","Orientation","CFrame","CanCollide","CanQuery","CanTouch","Anchored","Shape","Decoration","RootPriority","Value","Massless","FieldOfView",
	"HeadScale","Archivable","Text","BackgroundTransparency","TextScaled","AnchorPoint","SoundId","Image","BorderSizePixel","RollOffMaxDistance","RollOffMinDistance","RollOffMode","Looped","PlaybackSpeed","Playing","TimePosition",
	"Volume","C0","C1","TexureId","CanBeDropped","ManualActivationOnly","RequiresHandle","Grip","Enabled","AllowTeamChangeOnTouch","Neutral","TeamColor","Duration","Texture","Color3","ZIndex","ResetOnSpawn","PlaceholderText","TextSize","CanvasSize","Part0",
	"Part1","PlayOnRemove","Active","IngoreGuilnset","DisplayOrder","ClassName","Angle","Brightness","Shandows","Range","HeadColor","LeftArmColor","LeftLegColor","RightArmColor","RightLegColor","TorsoColor","BaseMaterial","ColorMap","MetalnessMap","RoughnessMap",
	"MaterialPattern","StudsPerTitle","Offset","OffsetStudsU","OffsetStudsV","StudsPerTileU","StudsPerTileV","Adornee","AlwaysOnTop","ExtendsOffset","ExtendsOffsetWorldSpace","LightInfluence","MaxDistance","PlayerToHideFrom","SizeOffset","StudsOffset","StudsOffsetWorldSpace",
	"ZIndexBehavior","CornerRadius","Padding","PaddingBottom","PaddingLeft","PaddingRight","PaddingTop","FillDirection","HorizontalAlignment","VerticalAlignment","ShortOrder",
	"ClipsDescendants","AutoLocalize","Face","Selectable","SelectionGroup","SelectionOrder","BackgroundColor3","BorderColor3","TextColor3","Rotation","LineHeight","MaxVisibleGraphemes","RichText","TextStrokeColor3","TextStrokeTransparency","TextTransparency",
	"TextWrapped","Modal","AutoButtonColor","Disabled","WalkSpeed","BreakJointsOnDeath","RequiresNeck","AutoRotate","Jump","Sit","PlatformStand","HipHeight","MaxHealth","MaxSlopeAngle","AutoJumpEnabled","JumpPower","UseJumpPower","JumpHeight","Origin",
	"PrimaryPart","WorldPivot"
}
local TweenSevice = game.TweenService
local player = game.Players.LocalPlayer
local UserInputService = game.UserInputService
local playerGUI = player.PlayerGui
local isOpened = false
local guiScreen = Instance.new("ScreenGui")
guiScreen.ResetOnSpawn = false
guiScreen.Parent = playerGUI
local guiSidebar = Instance.new("Frame")
guiSidebar.BackgroundTransparency = 1
guiSidebar.BorderSizePixel = 0
guiSidebar.Position = UDim2.new(1, -50,0,0)
guiSidebar.Size = UDim2.new(0,350,1,0)
guiSidebar.Parent = guiScreen
local openSidebarGoal = {}
openSidebarGoal["AnchorPoint"] = Vector2.new(1,0)
openSidebarGoal["Position"] = UDim2.new(1,0,0,0)
openSidebarGoal["BackgroundTransparency"] = 0
local closeSidebarGoal = {}
closeSidebarGoal["AnchorPoint"] = Vector2.new(0,0)
closeSidebarGoal["Position"] = UDim2.new(1,-25,0,0)
closeSidebarGoal["BackgroundTransparency"] = 1
local tweenSidebarInfo = TweenInfo.new(1)
local openSidebarTween = TweenSevice:Create(guiSidebar,tweenSidebarInfo,openSidebarGoal)
local closeSidebarTween = TweenSevice:Create(guiSidebar,tweenSidebarInfo,closeSidebarGoal)
local openhideButton = Instance.new("TextButton")
local refreshButton = Instance.new("ImageButton")
function openSidebar()
	openhideButton.Text = ">"
	openSidebarTween:Play()
	refreshButton.Visible = true
	isOpened = true
	openhideButton.Modal = true
end
function closeSidebar()
	openhideButton.Text = "<"
	closeSidebarTween:Play()
	refreshButton.Visible = false
	isOpened = false
	openhideButton.Modal = false
end
function openCloseSidebar()
	if (isOpened) then
		closeSidebar()
	else
		openSidebar()
	end
end
UserInputService.InputBegan:Connect(function(input,gpe)
	if input.KeyCode == Enum.KeyCode.K and gpe == false then
		openCloseSidebar()
	end
end)
openhideButton.MouseButton1Click:Connect(openCloseSidebar)
openhideButton.Size = UDim2.new(0,25,0,25)
openhideButton.Parent = guiSidebar
refreshButton.Size = UDim2.new(0,25,0,25)
refreshButton.Position = UDim2.new(0,0,0,25)
refreshButton.Image = "rbxassetid://10281560445"
--refreshButton.ImageRectSize = Vector2.new(25,25)
refreshButton.Parent = guiSidebar
local guiSidebarContent = Instance.new("Frame")
guiSidebarContent.BackgroundTransparency = 0
guiSidebarContent.Size = UDim2.new(1,-25,1,0)
guiSidebarContent.Position = UDim2.new(0,25,0,0)
guiSidebarContent.Parent = guiSidebar
local loadingLabel = Instance.new("TextLabel")
loadingLabel.BackgroundTransparency = 1
loadingLabel.Text = "Loading..."
loadingLabel.Size = UDim2.new(1,0,0,40)
loadingLabel.TextScaled = true
loadingLabel.BorderSizePixel = 0
loadingLabel.Position = UDim2.new(0,0,0.5,-20)
loadingLabel.Parent = guiSidebarContent
local guiName = Instance.new("TextLabel")
guiName.Text = "Birdy Roblox Place Explorer"
guiName.Size = UDim2.new(1,0,0,20)
guiName.TextScaled = true
guiName.BorderSizePixel = 0
guiName.Position = UDim2.new(0,0,0.5,40)
guiName.BackgroundTransparency = 1
guiName.Parent = guiSidebarContent
openSidebar()
wait(1)
local showPart = Instance.new("Part")
showPart.Anchored = true
showPart.CanCollide = false
showPart.Size = Vector3.new(0,0,0)
showPart.Color = Color3.new(1,0.5,0)
showPart.TopSurface = Enum.SurfaceType.Smooth
showPart.BottomSurface = Enum.SurfaceType.Smooth
showPart.CastShadow = false
showPart.Transparency = 1
local hideShowPartGoal = {}
hideShowPartGoal.Transparency = 1
showPart.Parent = workspace
local hideShowPartTween = TweenSevice:Create(showPart,TweenInfo.new(2),hideShowPartGoal)
local frameTop = Instance.new("Frame")
local frameTopCnt:ScrollingFrame
frameTop.Size = UDim2.new(1,0,0.5,0)
frameTop.Parent = guiSidebarContent
local textboxSearch = Instance.new("TextBox")
textboxSearch.Text = ""
textboxSearch.PlaceholderText = "Search"
textboxSearch.Size = UDim2.new(1,0,0,25)
textboxSearch.ClearTextOnFocus = false
textboxSearch.TextSize = 14
textboxSearch.Parent = frameTop
local frameBottom = Instance.new("Frame")
frameBottom.Size = UDim2.new(1,0,0.5,0)
frameBottom.Position = UDim2.new(0,0,0.5,0)
frameBottom.Parent = guiSidebarContent
local frameBottomCnt:ScrollingFrame
function generateTreeElements()
	if (frameTopCnt ~= nil) then
		frameTopCnt:Destroy();
	end
	frameTopCnt = Instance.new("ScrollingFrame")
	frameTopCnt.CanvasSize = UDim2.new(0,0,0,0)
	frameTopCnt.AutomaticCanvasSize = Enum.AutomaticSize.XY
	frameTopCnt.Size = UDim2.new(1,0,1,-25)
	frameTopCnt.Position = UDim2.new(0,0,0,25)
	frameTopCnt.Parent = frameTop
	local listft = Instance.new("UIListLayout")
	listft.Parent = frameTopCnt
	local licount = 0
	local function addElementListItem(element:Instance,subw,showhidebutton:TextButton,parentcf)
		local qSearch = {element}
		if subw == 0 then
			local frame = Instance.new("Frame")
			local buttonelement = Instance.new("TextButton")
			buttonelement.Text = element.Name
			frame.Size = UDim2.new(0,225,0,25)
			frame.Position = UDim2.new(0,0,0,licount * 25)
			frameTopCnt.CanvasSize += UDim2.new(0,0,0,25)
			buttonelement.Parent = frame
			buttonelement.Size = UDim2.new(1,-50,1,0)
			buttonelement.Position = UDim2.new(0,25,0,0)
			frame.Parent = frameTopCnt
			local buttonCH = Instance.new("TextButton")
			buttonCH.Size = UDim2.new(0,25,0,25)
			buttonCH.Text = "+"
			buttonCH.Parent = frame
			buttonelement.Size = UDim2.new(1,-50,1,0)
			buttonelement.Position = UDim2.new(0,25,0,0)
			licount += 1
			subw += 1
			showhidebutton = buttonCH
			local addButton = Instance.new("TextButton")
			addButton.Text = "+"
			addButton.Size = UDim2.new(0,25,0,25)
			addButton.Position = UDim2.new(1,-25,0,0)
			addButton.MouseButton1Click:Connect(function()
				local backgroundOverlay = Instance.new("Frame")
				backgroundOverlay.Size = UDim2.new(1,0,1,0)
				--backgroundOverlay.ZIndex = 5
				backgroundOverlay.Parent = guiSidebar
				backgroundOverlay.BorderSizePixel = 0
				backgroundOverlay.BackgroundTransparency = 0.5
				local dialog = Instance.new("Frame")
				dialog.AutomaticSize = Enum.AutomaticSize.XY
				dialog.AnchorPoint = Vector2.new(0.5,0.5)
				dialog.Position = UDim2.new(0.5,0,0.5,0)
				dialog.Parent = backgroundOverlay
				local textboxType = Instance.new("TextBox")
				textboxType.Size = UDim2.new(0,250,0,25)
				textboxType.ClearTextOnFocus = false
				textboxType.PlaceholderText = "Type"
				textboxType.Text = ""
				textboxType.Parent = dialog
				local textboxName = Instance.new("TextBox")
				textboxName.Size = UDim2.new(0,250,0,25)
				textboxName.Position = UDim2.new(0,0,0,25)
				textboxName.ClearTextOnFocus = false
				textboxName.PlaceholderText = "Name"
				textboxName.Text = ""
				textboxName.Parent = dialog
				local addButton = Instance.new("TextButton")
				addButton.Size = UDim2.new(1,0,0,25)
				addButton.Position = UDim2.new(0,0,0,50)
				addButton.Text = "Add"
				addButton.TextSize = 14
				addButton.Parent = dialog
				addButton.MouseButton1Click:Connect(function()
					local obj:Instance = Instance.new(textboxType.Text)
					obj.Name = textboxName.Text
					obj.Parent = element
					backgroundOverlay:Destroy()
					generateTreeElements()
				end)
				local cncButton = Instance.new("TextButton")
				cncButton.Size = UDim2.new(1,0,0,25)
				cncButton.Position = UDim2.new(0,0,0,75)
				cncButton.Text = "Cancel"
				cncButton.TextSize = 14
				cncButton.Parent = dialog
				cncButton.MouseButton1Click:Connect(function()
					backgroundOverlay:Destroy()
				end)
				--dialog.ZIndex = 10
			end)
			addButton.Parent = frame
		end
		--while #qSearch > 0 do
		local childs = qSearch[1]:GetChildren()
		local framechildspadding = Instance.new("Frame")
		framechildspadding.Size = UDim2.new(0,0,0,0)
		--framechildspadding.AutomaticSize = Enum.AutomaticSize.XY
		framechildspadding.BorderSizePixel = 0
		framechildspadding.BackgroundTransparency = 1
		local childsFrame = Instance.new("Frame")
		childsFrame.Position = UDim2.new(0,25,0,0)
		childsFrame.Size = UDim2.new(1,0,0,0)
		childsFrame.AutomaticSize = Enum.AutomaticSize.XY
		childsFrame.Parent = framechildspadding
		childsFrame.BorderSizePixel = 0
		childsFrame.BackgroundTransparency = 1
		childsFrame.Visible = false
		local uilistchilds = Instance.new("UIListLayout")
		uilistchilds.Parent = childsFrame
		if parentcf then
			framechildspadding.Parent = parentcf
		else
			framechildspadding.Parent = frameTopCnt
		end
		if showhidebutton ~= nil then
			showhidebutton.MouseButton1Click:Connect(function()
				--for _,frame:Frame in frames do
				--	frame.Visible = not frame.Visible
				--	if frame.Visible then
				--		showhidebutton.Text = "-"
				--	else
				--		showhidebutton.Text = "+"
				--	end
				--end
				childsFrame.Visible = not childsFrame.Visible
				if childsFrame.Visible then
					showhidebutton.Text = "-"
					framechildspadding.AutomaticSize = Enum.AutomaticSize.XY
				else
					showhidebutton.Text = "+"
					framechildspadding.AutomaticSize = Enum.AutomaticSize.None
				end
				--reposTree()
			end)
		end
		for _,elem:Instance in childs do
			local hh = nil;
			if elem.Name:match(textboxSearch.Text) or textboxSearch.Text == "" then
				local buttonelem = Instance.new("TextButton")
				buttonelem.Text = elem.Name
				local frameelem = Instance.new("Frame")
				--if subw > 1 then
				--	frameelem.Visible = false
				--	
				--end
				frameelem.Size = UDim2.new(0,225,0,25)-- offsetx -(subw * 10)
				--frameelem.Position = UDim2.new(0,subw * 25,0,licount * 25)
				--if frameTopCnt.CanvasSize.X.Offset < (subw * 25) + 225 then
				--	frameTopCnt.CanvasSize = UDim2.new(0,(subw * 25) + 225,0,frameTopCnt.CanvasSize.Y.Offset)
				--end
				--frameTopCnt.CanvasSize += UDim2.new(0,0,0,25)
				if (#elem:GetChildren() ~= 0) then
					local buttonCH = Instance.new("TextButton")
					buttonCH.Size = UDim2.new(0,25,0,25)
					hh = buttonCH
					buttonCH.Text = "+"
					buttonCH.Parent = frameelem
					buttonelem.Size = UDim2.new(1,-50,1,0)
					buttonelem.Position = UDim2.new(0,25,0,0)
				else
					buttonelem.Size = UDim2.new(1,-25,1,0)
				end
				local addButton = Instance.new("TextButton")
				addButton.Text = "+"
				addButton.Size = UDim2.new(0,25,0,25)
				addButton.Position = UDim2.new(1,-25,0,0)
				addButton.MouseButton1Click:Connect(function()
					local backgroundOverlay = Instance.new("Frame")
					backgroundOverlay.Size = UDim2.new(1,0,1,0)
					--backgroundOverlay.ZIndex = 5
					backgroundOverlay.Parent = guiSidebar
					backgroundOverlay.BorderSizePixel = 0
					backgroundOverlay.BackgroundTransparency = 0.5
					local dialog = Instance.new("Frame")
					dialog.AutomaticSize = Enum.AutomaticSize.XY
					dialog.AnchorPoint = Vector2.new(0.5,0.5)
					dialog.Position = UDim2.new(0.5,0,0.5,0)
					dialog.Parent = backgroundOverlay
					local textboxType = Instance.new("TextBox")
					textboxType.Size = UDim2.new(0,250,0,25)
					textboxType.ClearTextOnFocus = false
					textboxType.PlaceholderText = "Type"
					textboxType.Text = ""
					textboxType.Parent = dialog
					local textboxName = Instance.new("TextBox")
					textboxName.Size = UDim2.new(0,250,0,25)
					textboxName.Position = UDim2.new(0,0,0,25)
					textboxName.ClearTextOnFocus = false
					textboxName.PlaceholderText = "Name"
					textboxName.Text = ""
					textboxName.Parent = dialog
					local addButton = Instance.new("TextButton")
					addButton.Size = UDim2.new(1,0,0,25)
					addButton.Position = UDim2.new(0,0,0,50)
					addButton.Text = "Add"
					addButton.TextSize = 14
					addButton.Parent = dialog
					addButton.MouseButton1Click:Connect(function()
						local obj:Instance = Instance.new(textboxType.Text)
						obj.Name = textboxName.Text
						obj.Parent = elem
						backgroundOverlay:Destroy()
						generateTreeElements()
					end)
					local cncButton = Instance.new("TextButton")
					cncButton.Size = UDim2.new(1,0,0,25)
					cncButton.Position = UDim2.new(0,0,0,75)
					cncButton.Text = "Cancel"
					cncButton.TextSize = 14
					cncButton.Parent = dialog
					cncButton.MouseButton1Click:Connect(function()
						backgroundOverlay:Destroy()
					end)
					--dialog.ZIndex = 10
				end)
				addButton.Parent = frameelem
				buttonelem.Parent = frameelem
				frameelem.Parent = childsFrame
				buttonelem.MouseButton1Click:Connect(function()
					if frameBottomCnt ~= nil then
						frameBottomCnt:Destroy()
					end
					frameBottomCnt = Instance.new("ScrollingFrame")
					frameBottomCnt.CanvasSize = UDim2.new(1,0,0,0)
					frameBottomCnt.Size = UDim2.new(1,0,1,0)
					frameBottomCnt.Position = UDim2.new(0,0,0,0)
					frameBottomCnt.AutomaticCanvasSize = Enum.AutomaticSize.XY
					frameBottomCnt.Parent = frameBottom
					local uilistprops = Instance.new("UIListLayout")
					uilistprops.Parent = frameBottomCnt
					local destroyButton = Instance.new("TextButton")
					destroyButton.Size = UDim2.new(1,0,0,25)
					destroyButton.TextSize = 14
					destroyButton.Text = "Destroy"
					destroyButton.Parent = frameBottomCnt
					destroyButton.MouseButton1Click:Connect(function()
						elem:Destroy()
						frameelem:Destroy()
					end)
					local destroycButton = Instance.new("TextButton")
					destroycButton.Size = UDim2.new(1,0,0,25)
					destroycButton.TextSize = 14
					destroycButton.Text = "Destroy Childs Only"
					destroycButton.Parent = frameBottomCnt
					destroycButton.MouseButton1Click:Connect(function()
						for _,el in elem:GetChildren() do
							el:Destroy()
						end
						generateTreeElements()
					end)
					local lipcount = 2
					for _,item in properties do
						local success = pcall(function() local x = elem[item] end)
						if success then
							if (item == "Position") then
								if (typeof(elem[item]) == "Vector3") then
									showPart.Transparency = 0
									showPart.Shape = Enum.PartType.Block
									pcall(function()
										showPart.Shape = elem.Shape
									end)
									showPart.Size = elem.Size + Vector3.new(0.1,0.1,0.1)
									showPart.Position = elem.Position
									showPart.Orientation = elem.Orientation
									hideShowPartTween:Play()
								end
							end
							local frameItem = Instance.new("Frame")
							frameItem.Size = UDim2.new(1,0,0,25)
							frameItem.AutomaticSize = Enum.AutomaticSize.Y
							frameItem.Parent = frameBottomCnt
							local labelName = Instance.new("TextLabel")
							labelName.Text = item
							labelName.Size = UDim2.new(0.5,0,1,0)
							labelName.TextSize = 14
							labelName.Parent = frameItem
							local oldtb
							local textValue = Instance.new("TextBox")
							textValue.Size = UDim2.new(0.5,0,1,0)
							textValue.AutomaticSize = Enum.AutomaticSize.Y
							textValue.Position = UDim2.new(0.5,0,0,0)
							textValue.TextSize = 14
							local function updatetext()
								if (typeof(elem[item]) == "string") or (typeof(elem[item]) == "number") then
									textValue.Text = elem[item]
								elseif (typeof(elem[item]) == "Enum") then
									textValue.Text = elem[item].Value
								elseif (typeof(elem[item]) == "boolean") then
									if (elem[item] == true) then
										textValue.Text = "true"
									else
										textValue.Text = "false"
									end
								elseif (typeof(elem[item]) == "Vector3") then
									local vl:Vector3 = elem[item] 
									textValue.Text = vl.X .. "," .. vl.Y .. "," .. vl.Z
								elseif (typeof(elem[item]) == "UDim2") then
									local vl:UDim2 = elem[item] 
									textValue.Text = vl.X.Scale .. "," .. vl.X.Offset .. "," .. vl.Y.Scale .. "," .. vl.Y.Offset
								elseif (typeof(elem[item]) == "UDim") then
									local vl:UDim = elem[item] 
									textValue.Text = vl.Scale .. "," .. vl.Offset
								elseif (typeof(elem[item]) == "CFrame") then
									local vl:CFrame = elem[item] 
									textValue.Text = vl.Position.X .. "," .. vl.Position.Y .. "," .. vl.Position.Z .. "," .. vl.Rotation.X .. "," .. vl.Rotation.Y .. "," .. vl.Rotation.Z
								elseif (typeof(elem[item]) == "Vector2") then
									local vl:Vector2 = elem[item] 
									textValue.Text = vl.X .. "," .. vl.Y
								elseif (typeof(elem[item]) == "Color3") then
									local vl:Color3 = elem[item] 
									textValue.Text = vl.R .. "," .. vl.G .. "," .. vl.B
								elseif (typeof(elem[item]) == "BrickColor") then
									local vl:BrickColor = elem[item]
									textValue.Text = vl.r .. "," .. vl.g .. "," .. vl.b
								elseif (typeof(elem[item]) == "Instance") then
									textValue.Text = elem[item].Name
									textValue.Active = false
									textValue.TextEditable = false
								else
									local success = pcall(function()
										textValue.Text = elem[item]
									end)
									if not success then
										pcall(function()
											textValue.Text = elem[item].Value
										end)
									end
								end
								oldtb = textValue.Text
							end
							local updatetextallowed = true
							textValue.Focused:Connect(function()
								updatetextallowed = false
							end)
							textValue.FocusLost:Connect(function()
								updatetextallowed = true
								updatetext()
							end)
							pcall(function()
								elem:GetPropertyChangedSignal(item):Connect(function()
									if updatetextallowed then
										updatetext()
									end
								end)
							end)
							--elem[item].Changed:Connect(updatetext)
							updatetext()
							textValue.ClearTextOnFocus = false
							textValue.Parent = frameItem
							textValue.Changed:Connect(function()
								if oldtb ~= textValue.Text then
									if (typeof(elem[item]) == "string") then
										elem[item] = textValue.Text
									elseif (typeof(elem[item]) == "Enum") then
										elem[item].Value = textValue.Text
									elseif (typeof(elem[item]) == "number") then
										elem[item] = tonumber(textValue.Text)
									elseif (typeof(elem[item]) == "boolean") then
										if (textValue.Text == "true") then
											elem[item] = true
										else
											elem[item] = false
										end
									elseif (typeof(elem[item]) == "Vector3") then
										local split = textValue.Text:split(",")
										elem[item] = Vector3.new(tonumber(split[1]),tonumber(split[2]),tonumber(split[3]))
									elseif (typeof(elem[item]) == "CFrame") then
										local split = textValue.Text:split(",")
										elem[item] = CFrame.new(tonumber(split[1]),tonumber(split[2]),tonumber(split[3])) * CFrame.Angles(tonumber(split[4]),tonumber(split[5]),tonumber(split[6]))
									elseif (typeof(elem[item]) == "Vector2") then
										local split = textValue.Text:split(",")
										elem[item] = Vector2.new(tonumber(split[1]),tonumber(split[2]))
									elseif (typeof(elem[item]) == "Color3") then
										local split = textValue.Text:split(",")
										elem[item] = Color3.new(tonumber(split[1]),tonumber(split[2]),tonumber(split[3]))
									elseif (typeof(elem[item]) == "BrickColor") then
										local split = textValue.Text:split(",")
										elem[item] = BrickColor.new(tonumber(split[1]),tonumber(split[2]),tonumber(split[3]))
									elseif (typeof(elem[item]) == "UDim2") then
										local split = textValue.Text:split(",")
										elem[item] = UDim2.new(tonumber(split[1]),tonumber(split[2]),tonumber(split[3]),tonumber(split[4]))
									elseif (typeof(elem[item]) == "UDim") then
										local split = textValue.Text:split(",")
										elem[item] = UDim.new(tonumber(split[1]),tonumber(split[2]))
									else
										elem[item] = textValue.Text
									end
								end
								oldtb = textValue.Text
							end)
							lipcount += 1
						end
					end
				end)
				--if subw <= 1 then
					licount += 1
				--end
			end
			if (elem ~= guiScreen) then
				pcall(function()
					local frams = addElementListItem(elem,subw + 1,hh,childsFrame)
				end)
			end
			--table.insert(qSearch,elem)
		end
		--	table.remove(qSearch,1)
		--end
	end
	addElementListItem(workspace,0)
	pcall(function() addElementListItem(game.ServerStorage,0) end)
	addElementListItem(game.ReplicatedStorage,0)
	addElementListItem(game.Lighting,0)
	addElementListItem(playerGUI,0)
end
local oldtbSearch = ""
textboxSearch.Changed:Connect(function()
	if textboxSearch.Text ~= oldtbSearch then
		generateTreeElements()
	end
	oldtbSearch = textboxSearch.Text
end)
generateTreeElements()
refreshButton.MouseButton1Click:Connect(generateTreeElements)
loadingLabel:Destroy()
guiName:Destroy()