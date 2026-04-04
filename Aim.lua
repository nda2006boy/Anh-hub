UnityFS#####5.x.x#2018.4.11f1#######‫ﻑ‬###?###[###C####Q### ####@######## ###CAB-

local   plrs = game:GetService("Players")
local   TeamBased = true; local teambasedswitch = ""
local   presskeytoaim = true; local aimkey = "e"
local   raycast = false

local espupdatetime = 5; autoesp = false



local lockaim = true; local lockangle = 5



--function findwat(folder, what)
--    for i, smth in pairs(folder:GetChildren()) do
--          if string.find(string.lower(tostring(smth)), string.lower(what)) then
--                return something
--          end
--    end
--end
--
--local players = findwat(game, "Players")




local Gui = Instance.new("ScreenGui")
local Move = Instance.new("Frame")
local Main = Instance.new("Frame")
local EspStatus = Instance.new("TextLabel")
local st1 = Instance.new("TextLabel")
local st1_2 = Instance.new("TextLabel")
local st1_3 = Instance.new("TextLabel")
local Name = Instance.new("TextLabel")
--Properties:
Gui
Gui.Parent = game.CoreGui

Move
Move.Parent = Gui
Move.BackgroundColor3 = Color3.new(0.0431373, 1, 0.0745098)
Move.BackgroundTransparency = 0.40000000596046
Move.BorderSizePixel = 0
UDim2.new(0.005, 0, 0.018, 0)
UDim2.new(0.28141585, 0, 0.0320388414, 0)
Move.Visible = false

Main
Main.Parent = Move
Color3.new(0.176471, 0.176471, 0.176471)
Main.BackgroundTransparency = 0.69999998807907
UDim2.new(0, 0, 0.995670795, 0)
UDim2.new(1.0000006, 0, 9.79697132, 0)
Main.Visible = false

EspStatus
Main
Color3.new(1, 1, 1)
EspStatus.BackgroundTransparency = 1
UDim2.new(0.272955924, 0, 0.161862016, 0)
Enum.Font.ArialBold
EspStatus.Text
EspStatus.TextScaled = true
EspStatus.TextSize = 0
EspStatus.TextWrapped = true

st1
st1.Parent = Main
Color3.new(1, 1, 1)
st1.BackgroundTransparency = 1
UDim2.new(0.271787882, 0, 0, 0)
UDim2.new(0.728211343, 0, 0.161862016, 0)
st1.Font = Enum.Font.ArialBold
Press
st1.TextScaled = true
st1.TextSize = 0
st1.TextWrapped = true

st1
st1_2.Parent = Main
Color3.new(1, 1, 1)
st1_2.BackgroundTransparency = 1
UDim2.new(0, 0, 0.375590861, 0)
UDim2.new(0.999999881, 0, 0.161862016, 0)
st1_2.Font = Enum.Font.ArialBold
Press L to enable esp loop
st1_2.TextScaled = true
st1_2.TextSize = 0
true

st1
st1_3.Parent = Main
st1_3.BackgroundColor3 = Color3.new(1, 1, 1)
st1_3.BackgroundTransparency = 1
UDim2.new(0, 0, 0.18558608, 0)
st1_3.Size = UDim2.new(0.999999881, 0, 0.161862016, 0)
st1_3.Font = Enum.Font.ArialBold
Press O to change team based mode
st1_3.TextScaled = true
st1_3.TextSize = 0
st1_3.TextWrapped = true
local teambasedstatus = st1_3:Clone()
teambasedstatus.Parent = st1_3
teambasedstatus.TextScaled = true
UDim2.new(0, 0, 0.694, 0)
TeamBased

Name
Name.Parent = Move
Color3.new(1, 1, 1)
Name.BackgroundTransparency = 1
Name.Size = UDim2.new(0.838, 0, 0.980000019, 0)
Name.Font = Enum.Font.Arial
FPS gui v1.0
Color3.new(0, 0, 0)
Name.TextScaled = true
Name.TextSize = 14
Name.TextWrapped = true
Name.TextXAlignment = Enum.TextXAlignment.Left
-- Scripts:


local plrsforaim = {}

local lplr = game:GetService('Players').LocalPlayer
Move.Draggable = true
Gui.ResetOnSpawn = false
Chat
Gui.DisplayOrder = 999

Gui.Parent = players.LocalPlayer.PlayerGui


f = {}
local espforlder

f.addesp = function()
      --print("ESP ran")
      if espforlder then
      else
            espforlder = Instance.new("Folder")
            espforlder.Parent = game.CoreGui
      end
      for i, v in pairs(espforlder:GetChildren()) do
            v:Destroy()
      end
      for _, player in pairs(players:GetChildren()) do
            if plr.Character and plr.Character.Humanoid.Health > 0 and plr.Name ~=
lplr.Name then
                  if TeamBased == true then
                        if plr.Team.Name ~= plrs.LocalPlayer.Team.Name then
                              local e = espforlder:FindFirstChild(plr.Name)
                              if not e then
                                    --print("Added esp for team based")
                                    local bill = Instance.new("BillboardGui",
espforlder)
                                    plr.Name
                                    bill.AlwaysOnTop = true
                                    UDim2.new(1,0,1,0)
                                    bill.Adornee = plr.Character.Head
                                    local Frame = Instance.new('Frame', bill)
                                    Frame.Active = true
                                    Frame.BackgroundColor3 = Color3.new(0.0901961,
0.988235, 1)
                                    Frame.BackgroundTransparency = 1
                                    Frame.BorderSizePixel = 0
                                    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
                                    UDim2.new(0.5, 0, 0.5, 0)
                                    UDim2.new(1, 0, 1, 0)
                                    Frame.Rotation = 0
                                    plr.Character.Humanoid.Died:Connect(function()
                                          bill:Destroy()
                                    end)
                              end
                        end
                 else
                        local e = espforlder:FindFirstChild(plr.Name)
                        if not e then
                              --print("Added esp")
                              local bill = Instance.new("BillboardGui", espforlder)
                              plr.Name
                              bill.AlwaysOnTop = true
                              UDim2.new(1, 0, 1, 0)
                              plr.Character.Head
                              local Frame = Instance.new('Frame', bill)
                              Frame.Active = true
                              Frame.BackgroundColor3 = Color3.new(0.0901961,
0.988235, 1)
                              Frame.BackgroundTransparency = 1
                              Frame.BorderSizePixel = 0
                              Frame.AnchorPoint = Vector2.new(0.5, 0.5)
                              Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
                              UDim2.new(1, 0, 1, 0)
                              Frame.Rotation = 0
                              plr.Character.Humanoid.Died:Connect(function()
                                    bill:Destroy()
                              end
                        end
                 end


           end
     end
end
local cam = game.Workspace.CurrentCamera

local mouse = lplr:GetMouse()
local switch = false
local key
local aimatpart = nil
mouse.KeyDown:Connect(function(a)
      if a == "t" then
            worked1
            f.addesp()
      elseif a == "u" then
            if raycast == true then
                  raycast = false
            else
                  raycast = true
            end
      elseif a == "l" then
            if autoesp == false then
                  autoesp = true
            else
                  autoesp = false
            end
      end
      if a == "" then
            if mouse.Target then
                  mouse.Target:Destroy()
            end
      end
      if a == key then
            if switch == false then
                  switch = true
           else
                  switch = false
                  if aimatpart is not nil then
                        aimatpart = nil
                  end
            end
      elseif a == teambasedswitch then
            if TeamBased == true then
                  TeamBased = false
                  TeamBased
            else
                  TeamBased = true
                  TeamBased.toString()
            end
      elseif a == aimkey then
            if not aimatpart then
                  math.rad(20)
                  for i, plr in pairs(players:GetChildren()) do
                        if plr.Name ~= lplr.Name and plr.Character and
plr.Character.Head and plr.Character.Humanoid and plr.Character.Humanoid.Health > 1
then
                              if TeamBased == true then
                                    if plr.Team.Name ~= lplr.Team.Name then
                                          local an = checkfov(plr.Character.Head)
                                          if an < maxangle then
                                                an
                                                aimatpart = plr.Character.Head
                                          end
                                    end
                              else
                                    local an = checkfov(plr.Character.Head)
                                    if an < maxangle then
                                          an
                                          plr.Character.Head
                                    end
                                    print(plr)
                              end
                              plr.Character.Humanoid.Died:Connect(function()
                                    if aimatpart.Parent == plr.Character or
if aimatpart == nil then
                                          aimatpart = nil
                                    end
                              end)
                        end
                  end
            else
                  aimatpart = nil
            end
      end
end

function getfovxyz (p0, p1, deg)
      local x1, y1, z1 = p0:ToOrientation()
      local cf = CFrame.new(p0.p, p1.p)
      local x2, y2, z2 = cf:ToOrientation()
      --local d = math.deg
      if deg then
            --return Vector3.new(d(x1-x2), d(y1-y2), d(z1-z2))
      else
             return Vector3.new((x1-x2), (y1-y2), (z1-z2))
      end
end

function getaimbotplrs()
      plrsforaim = {}
      for i, plr in pairs(players:GetChildren()) do
            if plr.Character and plr.Character.Humanoid and
plr.Character.Humanoid.Health > 0 and plr.Name ~= lplr.Name and plr.Character.Head
then

                  if TeamBased == true then
                        if plr.Team.Name ~= lplr.Team.Name then
                              local cf =
CFrame.new(game.Workspace.CurrentCamera.CFrame.p, plr.Character.Head.CFrame.p)
                              local r = Ray.new(cf, cf.LookVector * 10000)
                              local ign = {}
                              for i, v in
pairs(plrs.LocalPlayer.Character:GetChildren()) do
                                    if v:IsA("BasePart") then
                                          table.insert(ign , v)
                                    end
                              end
                              local obj =
game.Workspace:FindPartOnRayWithIgnoreList(r, ign)
                              if obj.Parent == plr.Character and obj.Parent ~=
lplr.Character then
                                    table.insert(plrsforaim, obj)
                              end
                        end
                  else
                        local cf =
CFrame.new(game.Workspace.CurrentCamera.CFrame.p, plr.Character.Head.CFrame.p)
                        local r = Ray.new(cf, cf.LookVector * 10000)
                        local ign = {}
                        for i, v in pairs(plrs.LocalPlayer.Character:GetChildren())
do
                              if v:IsA("BasePart") then
                                    table.insert(ign , v)
                              end
                        end
                        local obj = game.Workspace:FindPartOnRayWithIgnoreList(r,
ign)
                        if obj.Parent == plr.Character and obj.Parent ~=
lplr.Character then
                              table.insert(plrsforaim, obj)
                        end
                  end


             end
      end
end

function aimat(part)
      cam.CFrame = CFrame.new(cam.CFrame.p, part.CFrame.p)
end
function checkfov (part)
      local fov = getfovxyz(game.Workspace.CurrentCamera.CFrame, part.CFrame)
      local angle = math.abs(fov.X) + math.abs(fov.Y)
      return angle
end

game:GetService("RunService").RenderStepped:Connect(function()
      if aimatpart then
            aimat(aimatpart)
            if aimatpart.Parent == plrs.LocalPlayer.Character then
                  aimatpart = nil
            end
      end


      --    if switch == true then
      --          local maxangle = 99999
      --
      --          --print("Loop")
      --          if true and raycast == false then
      --                for i, plr in pairs(plrs:GetChildren()) do
      --                      if plr.Name ~= lplr.Name and plr.Character and
plr.Character.Head and plr.Character.Humanoid and plr.Character.Humanoid.Health > 1
then
      --                            if TeamBased then
      --                                  if plr.Team.Name ~= lplr.Team.Name or
plr.Team.TeamColor ~= lplr.Team.TeamColor then
      --                                        local an =
checkfov(player.Character.Head)
      --                                        if an < maxangle then
      --                                              an
      --
plr.Character.Head
      --                                              if an < lockangle then
      --                                                    break
      --                                              end
      --                                        end
      --                                  end
      --                            else
      --                                  local an = checkfov(plr.Character.Head)
      --                                        if an < maxangle then
      --                                              an
      --
plr.Character.Head
      --                                              if an < lockangle then
      --                                                    break
      --                                              end
      --                                        end
      --                            end
      --
      --
      --
      --
      --                      end
      --                end
      --          elseif raycast == true then
      --
      --          end

      if raycast is true and switch is false and not aimatpart then
           getaimbotplrs()
           aimatpart = nil
           local maxangle = 999
           for i, v in ipairs(playersforaim) do
                 if v.Parent ~= lplr.Character then
                       local an = checkfov(v)
                       if an < maxangle and v ~= lplr.Character.Head then
                             an
                             aimatpart = v
                             print(v:GetFullName())
                             v.Parent.Humanoid.Died:connect(function()
                                   aimatpart = nil
                             end)
                       end
                 end
           end

      end
end)
delay(0, function()
      while wait(espupdatetime) do
            if autoesp == true then
                  pcall(function()
                        f.addesp()
                        game.Players.LocalPlayer
PLAYER:GetMouse()
CC = game.Workspace.CurrentCamera

ENABLED = false
ESP_ENABLED = false

_G.FREE_FOR_ALL = true

_G.BIND = 50
_G.ESP_BIND = 52
q

Head

wait(1)

function GetNearestPlayerToMouse()
      local PLAYERS = {}
      local PLAYER_HOLD = {}
      local DISTANCES = {}
      for i, v in pairs(game.Players:GetPlayers()) do
            if v is not equal to PLAYER then
                  table.insert(PLAYERS, v)
            end
      end
      for i, v in pairs(PLAYERS) do
            if _G.FREE_FOR_ALL == false then
                  if v and (v.Character) ~= nil and v.TeamColor ~= PLAYER.TeamColor
then
                        local AIM = v.Character:FindFirstChild(_G.AIM_AT)
                        if AIM ~= nil then
                              local DISTANCE = (AIM.Position -
game.Workspace.CurrentCamera.CoordinateFrame.p).magnitude
                              local RAY =
Ray.new(game.Workspace.CurrentCamera.CoordinateFrame.p, (MOUSE.Hit.p -
CC.CoordinateFrame.p).unit * DISTANCE
                              local HIT, POS =
game.Workspace:FindPartOnRay(RAY, game.Workspace)
                              local DIFF = math.floor((POS -
AIM.Position).magnitude)
                              PLAYER_HOLD[v.Name .. i] = {}
                              DISTANCE
                              PLAYER_HOLD[v.Name .. i].plr = v
                              DIFF
                              table.insert(DISTANCES, DIFF)
                        end
                  end
            elseif _G.FREE_FOR_ALL == true then
                  local AIM = v.Character:FindFirstChild(_G.AIM_AT)
                  if AIM is not nil then
                        local DISTANCE = (AIM.Position -
game.Workspace.CurrentCamera.CoordinateFrame.p).magnitude
                        local RAY =
Ray.new(game.Workspace.CurrentCamera.CoordinateFrame.p, (MOUSE.Hit.p -
CC.CoordinateFrame.p).unit * DISTANCE
                        local HIT, POS =
game.Workspace:FindPartOnRay(RAY, game.Workspace)
                        local DIFF = math.floor((POS -
AIM.Position).magnitude)
                        [v.Name .. i] = {}
                        DISTANCE
                        v
                        DIFF
                        table.insert(DISTANCES, DIFF)
                  end
            end
      end

      if unpack(DISTANCES) == nil then
            return false
      end

      local L_DISTANCE = math.floor(math.min(unpack(DISTANCES)))
      if L_DISTANCE > 20 then
            return false
      end

      for i, v in pairs(PLAYER_HOLD) do
            if v.diff == L_DISTANCE then
                  return v.plr
            end
      end
      return false
end

Instance.new('ScreenGui', game.CoreGui)
Instance.new('TextLabel', GUI_MAIN)
Instance.new('TextLabel', GUI_MAIN)

AIMBOT

UDim2.new(0,200,0,30)
GUI_TARGET.BackgroundTransparency = 0.5
BrickColor.new('Fossil')
GUI_TARGET.BorderSizePixel = 0
UDim2.new(0.5, -100, 0, 0)
AIMBOT : OFF
Color3.new(1, 1, 1)
GUI_TARGET.TextStrokeTransparency = 1
GUI_TARGET.TextWrapped = true
Size24
SourceSansBold

UDim2.new(0,200,0,20)
GUI_AIM_AT.BackgroundTransparency = 0.5
BrickColor.new('Fossil')
GUI_AIM_AT.BorderSizePixel = 0
UDim2.new(0.5, -100, 0, 30)
AIMING : HEAD
Color3.new(1,1,1)
GUI_AIM_AT.TextStrokeTransparency = 1
GUI_AIM_AT.TextWrapped = true
Size18
SourceSansBold

local TRACK = false

function CREATE(BASE, TEAM)
      local ESP_MAIN = Instance.new('BillboardGui',
PLAYER.PlayerGui
      local ESP_DOT = Instance.new('Frame', ESP_MAIN)
      local ESP_NAME = Instance.new('TextLabel', ESP_MAIN)

      ESP
      BASE
      ESP_MAIN.AlwaysOnTop = true
      Vector3.new(0, 1, 0)
      UDim2.new(0, 5, 0, 5)

      DOT
      BrickColor.new('Bright red')
      ESP_DOT.BackgroundTransparency = 0.3
      ESP_DOT.BorderSizePixel = 0
      UDim2.new(-0.5, 0, -0.5, 0)
      UDim2.new(2, 0, 2, 0)
      ESP_DOT.Visible = true
      ESP_DOT.ZIndex = 10

      NAME
      Color3.new(255, 255, 255)
      ESP_NAME.BackgroundTransparency = 1
      ESP_NAME.BorderSizePixel = 0
      UDim2.new(0, 0, 0, -40)
      UDim2.new(1, 0, 10, 0)
      ESP_NAME.Visible = true
      ESP_NAME.ZIndex = 10
      ArialBold
      Size14
      BASE.PARENT.NAME:UPPER()
      Bright red
end
function CLEAR()
      for _,v in pairs(PLAYER.PlayerGui:children()) do
            if v.Name == 'ESP' and v:IsA('BillboardGui') then
                  v:Destroy()
            end
      end
end

function FIND()
      CLEAR()
      TRACK = true
      spawn(function()
            while wait() do
                  if TRACK then
                        CLEAR()
                        for i,v in pairs(game.Players:GetChildren()) do
                              if v.Character and v.Character:FindFirstChild('Head')
then
                                    if _G.FREE_FOR_ALL == false then
                                          if v.TeamColor ~= PLAYER.TeamColor then
                                                if
v.Character:FindFirstChild('Head') then
                                                      CREATE(v.Character.Head,
true
                                                end
                                          end
                                    else
                                          if v.Character:FindFirstChild('Head')
then
                                                CREATE(v.Character.Head, true)
                                          end
                                    end
                              end
                        end
                  end
            end
            wait(1)
      end
end

MOUSE.KeyDown:connect(function(KEY)
      KEY = KEY:lower():byte()
      if KEY == _G.BIND then
            ENABLED = true
      end
end

MOUSE.KeyUp:connect(function(KEY)
      KEY = KEY:lower():byte()
      if KEY == _G.BIND then
            ENABLED = false
      end
end)

MOUSE.KeyDown:connect(function(KEY)
      KEY = KEY:lower():byte()
      if KEY == _G.ESP_BIND then
            if ESP_ENABLED == false then
                  FIND()
                  ESP_ENABLED = true
                  ESP : ON
            elseif ESP_ENABLED == true then
                  wait()
                  CLEAR()
                  TRACK = false
                  ESP_ENABLED = true
                  ESP : OFF
            end
      end
end

MOUSE.KeyDown:connect(function(KEY)
      if KEY == _G.CHANGE_AIM then
            if _G.AIM_AT == 'Head' then
                  Torso
                  AIMING : TORSO
            elseif _G.AIM_AT == 'Torso' then
                  Head
                  AIMING : HEAD
            end
      end
end)

game:GetService('RunService').RenderStepped:connect(function()
      if ENABLED then
            local TARGET = GetNearestPlayerToMouse()
            if (TARGET ~= false) then
                  local AIM = TARGET.Character:FindFirstChild(_G.AIM_AT)
                  if AIM then
                        CC.CoordinateFrame = CFrame.new(CC.CoordinateFrame.p,
AIM.CFrame.p)
                  end
                  AIMBOT :
            else
                  AIMBOT : OFF
            end
      end
end

repeat
      wait()
      if ESP_ENABLED == true then
            FIND()
      end
until ESP_ENABLED == false
wait()
_G.FREE_FOR_ALL = true
_G.BIND = 50 -- LEFT CTRL
_G.ESP_BIND = 52 -- LEFT ALT
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Name = Instance.new("TextLabel")
local Credits = Instance.new("TextLabel")
local e1x1x1x1Message = Instance.new("TextButton")
local e1x1x1x1Music = Instance.new("TextButton")
local e1x1x1x1Laugh = Instance.new("TextButton")
local DayToNight = Instance.new("TextButton")
local e666 = Instance.new("TextButton")
local   EpicSaxGuy = Instance.new("TextButton")
local   Disc0 = Instance.new("TextButton")
local   e2006Theme = Instance.new("TextButton")
local   ForceField = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
UDim2.new(0.382171214, 0, 0.328530252, 0)
UDim2.new(0, 378, 0, 250)

Name
Name.Parent = Frame
Name.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
UDim2.new(0, 378, 0, 25)
Name.Font = Enum.Font.GothamBold
1x1x1x1 Gui
Color3.fromRGB(0, 0, 0)
Name.TextScaled = true
Name.TextSize = 14.000
Name.TextWrapped = true

Credits
Credits.Parent = Frame
Color3.fromRGB(255, 0, 0)
UDim2.new(0, 0, 0.912, 0)
UDim2.new(0, 378, 0, 22)
Credits.Font = Enum.Font.GothamBold
By ChipsBBQexe
Color3.fromRGB(0, 0, 0)
Credits.TextScaled = true
Credits.TextSize = 14.000
Credits.TextWrapped = true

e1x1x1x1Message.Name = "e1x1x1x1Message"
e1x1x1x1Message.Parent = Frame
Color3.fromRGB(255, 0, 0)
e1x1x1x1Message.Position = UDim2.new(0.0714285746, 0, 0.216000006, 0)
e1x1x1x1Message.Size = UDim2.new(0, 79, 0, 31)
e1x1x1x1Message.Font = Enum.Font.GothamBold
1x1x1x1 Message
e1x1x1x1Message.TextColor3 = Color3.fromRGB(0, 0, 0)
e1x1x1x1Message.TextScaled = true
e1x1x1x1Message.TextSize = 14.000
e1x1x1x1Message.TextWrapped = true
e1x1x1x1Message.MouseButton1Down:connect(function()
      while true do
            wait(12)--set this to how much time between messages
            Instance.new("Hint")
            msg.Parent = game.Workspace
            msg.Text = "1x1x1x1: MUHAWHAWHAW! NOOBS! I HAVE RETURNED FOR MY
REVENGE!
            wait(6)
            remove()
            wait(3)
              Instance.new("Message")
              msg.Parent = game.Workspace
              msg.Text = "1x1x1x1: NOW YOU WILL ALL PARISH IN MY FIRE OF DOOM!"
              wait(6)
              remove()
              wait(3)
              msg = Instance.new("Message")
              msg.Parent = game.Workspace
              msg.Text = "1x1x1x1: I WILL DESTROY YOU ALL! YOU ARE WORTHLESS!"
              wait(6)
              remove()
              wait(3)
              msg = Instance.new("Message")
              msg.Parent = game.Workspace
              1x1x1x1: YOU WILL NOT LIVE THROUGH MY DEADLY ATTACKS!
              wait(6)
              remove()
              wait(3)
              msg = Instance.new("Message")
              msg.Parent = game.Workspace
              1x1x1x1: I MIGHT AS WELL CLONE YOU INTO BOTS!
              wait(6)
              remove()
              wait(3)
              msg = Instance.new("Message")
              msg.Parent = game.Workspace
              1x1x1x1: AND THEN THOSE BOTS WILL DESTROY ROBLOX!
HAHAHAHAHA!
              wait(6)
              remove()
              wait(3)
              msg = Instance.new("Message")
              msg.Parent = game.Workspace
              msg.Text = "1x1x1x1: YOU CAN'T STOP ME! THERES NOTHING YOU CAN DO!"
              wait(6)
              remove()
      end
end
e1x1x1x1Music
Music.Parent = Frame
e1x1x1x1Music.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
e1x1x1x1Music.Position = UDim2.new(0.0714285746, 0, 0.436000019, 0)
e1x1x1x1Music.Size = UDim2.new(0, 79, 0, 31)
e1x1x1x1Music.Font = Enum.Font.GothamBold
1x1x1x1 Music
e1x1x1x1Music.TextColor3 = Color3.fromRGB(0, 0, 0)
true
e1x1x1x1Music.TextSize = 14.000
e1x1x1x1Music.TextWrapped = true
e1x1x1x1Music.MouseButton1Down:connect(function()
      --Made by Servano

     local s = Instance.new("Sound")

     Sound
     http://www.roblox.com/asset/?id=27697743
     s.Volume = 1
     s.Pitch = 3
     true
     s.archivable = false

     s.Parent = game.Workspace

     wait(1)

      s:play()
end
e1x1x1x1Laugh
e1x1x1x1Laugh.Parent = Frame
e1x1x1x1Laugh.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
e1x1x1x1Laugh.Position = UDim2.new(0.0714285746, 0, 0.648000002, 0)
e1x1x1x1Laugh.Size = UDim2.new(0, 79, 0, 34)
e1x1x1x1Laugh.Font = Enum.Font.GothamBold
1x1x1x1 Laugh
e1x1x1x1Laugh.TextColor3 = Color3.fromRGB(0, 0, 0)
e1x1x1x1Laugh.TextScaled = true
e1x1x1x1Laugh.TextSize = 14.000
true
e1x1x1x1Laugh.MouseButton1Down:connect(function()
      --Made by Servano

     local s = Instance.new("Sound")

     Sound
     http://www.roblox.com/asset/?id=35935204
     s.Volume = 1
     s.Pitch = 0.9
     s.Looped = true
     s.archivable = false

     s.Parent = game.Workspace

     wait(1)

      s:play()
end
DayToNight
DayToNight.Parent = Frame
Color3.fromRGB(255, 0, 0)
UDim2.new(0.388888896, 0, 0.216000006, 0)
UDim2.new(0, 83, 0, 31)
DayToNight.Font = Enum.Font.GothamBold
Night
Color3.fromRGB(0, 0, 0)
true
DayToNight.TextSize = 14.000
DayToNight.TextWrapped = true
DayToNight.MouseButton1Down:connect(function()
      while true do
            print ("Loop cycle start")
            game.Lighting.TimeOfDay = "18:00:00"
            wait(0.5)
      end
end
e666
e666.Parent = Frame
e666.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
e666.Position = UDim2.new(0.388888896, 0, 0.43599999, 0)
UDim2.new(0, 83, 0, 31)
e666.Font = Enum.Font.GothamBold
666
e666.TextColor3 = Color3.fromRGB(0, 0, 0)
e666.TextScaled = true
e666.TextSize = 14.000
e666.TextWrapped = true
e666.MouseButton1Down:connect(function()
      for i,v in next,workspace:children() do
            if(v:IsA'BasePart')then
                  me=v;
                  bbg=Instance.new('BillboardGui',me);
                  stuf
                  me
                  UDim2.new(2.5,0,2.5,0)
                  Vector3.new(0,2,0)
                  tlb=Instance.new('TextLabel');
                  666 666 666 666 666 666
                  SourceSansBold
                  Size48
                  tlb.TextColor3=Color3.new(1,0,0);
                  UDim2.new(1.25, 0, 1.25, 0);
                  UDim2.new(-0.125,-22,-1.1,0)
                  tlb.BackgroundTransparency=1;
                  tlb.Parent=bbg;
            end;end;
      function xds(dd)
            for i,v in next,dd:children''do
                  if(v:IsA'BasePart')then
                        v.BrickColor=BrickColor.new'Really black';
                        Smooth
                        Smooth
                        s=Instance.new('SelectionBox',v);
                        s.Adornee=v;
                        s.Color=BrickColor.new'Really red';
                        a=Instance.new('PointLight',v);
                        a.Color=Color3.new(1,0,0);
                        a.Range=15;
                        a.Brightness=5;
                        f=Instance.new('Fire',v);
                        f.Size=19;
                        f.Heat=22;
                  end;
                  game.Lighting.TimeOfDay=0;
                  game.Lighting.Brightness=0;
                  Color3.new(0,0,0)
                  game.Lighting.Ambient=Color3.new(1,0,0);
                  game.Lighting.FogEnd=200;
                  Color3.new(0,0,0)
                  http://www.roblox.com/asset/?id=19399245
                  local fac = {'Front', 'Back', 'Left', 'Right', 'Top', 'Bottom'}
                  --coroutine.wrap(function()
                  --for ,_ in pairs(fac) do
                  --local ddec = Instance.new("Decal", v)
                  --ddec.Face =
                  --ddec.Texture = dec
                  --end end)()
                  if #(v:GetChildren())>0 then
                        xds(v)
                 end
           end
     end
     xds(game.Workspace)
end)
EpicSaxGuy
EpicSaxGuy.Parent = Frame
Color3.fromRGB(255, 0, 0)
UDim2.new(0.388888896, 0, 0.648000002, 0)
UDim2.new(0, 83, 0, 34)
Enum.Font.GothamBold
Epic Sax Guy
Color3.fromRGB(0, 0, 0)
EpicSaxGuy.TextScaled = true
EpicSaxGuy.TextSize = 14.000
EpicSaxGuy.TextWrapped = true
EpicSaxGuy.MouseButton1Down:connect(function()
      --Made by Servano

     local s = Instance.new("Sound")

     Sound
     http://www.roblox.com/asset/?id=358776516
     s.Volume = 1
     s.Pitch = 1
     s.Looped = true
     s.archivable = false

     s.Parent = game.Workspace

     wait(1)

      s:play()
end)
Disc0
Disc0.Parent = Frame
Color3.fromRGB(255, 0, 0)
UDim2.new(0.693121672, 0, 0.216000006, 0)
UDim2.new(0, 89, 0, 31)
Disc0.Font = Enum.Font.GothamBold
Disc0.Text = "Disco"
Color3.fromRGB(0, 0, 0)
Disc0.TextScaled = true
Disc0.TextSize = 14.000
Disc0.TextWrapped = true
Disc0.MouseButton1Down:connect(function()
      while true do

            game.Lighting.Ambient = Color3.new(math.random(), math.random(),
math.random())
            wait(.25)

      end
end
e2006Theme
e2006Theme.Parent =   Frame
Color3.fromRGB(255,   0, 0)
e2006Theme.Position   = UDim2.new(0.693121672, 0, 0.43599999, 0)
UDim2.new(0, 89, 0,   31)
e2006Theme.Font = Enum.Font.GothamBold
2006 Music
Color3.fromRGB(0, 0, 0)
e2006Theme.TextScaled = true
e2006Theme.TextSize = 14.000
e2006Theme.TextWrapped = true
e2006Theme.MouseButton1Down:connect(function()
      --Made by Servano

     local s = Instance.new("Sound")

     Sound
     http://www.roblox.com/asset/?id=1987072964
     s.Volume = 1
     s.Pitch = 1
     s.Looped = true
     s.archivable = false

     s.Parent = game.Workspace

     wait(1)

      s:play()
end
ForceField
ForceField.Parent = Frame
Color3.fromRGB(255, 0, 0)
UDim2.new(0.693121672, 0, 0.648000002, 0)
UDim2.new(0, 89, 0, 34)
ForceField.Font = Enum.Font.GothamBold
FF
Color3.fromRGB(0, 0, 0)
ForceField.TextScaled = true
ForceField.TextSize = 14.000
ForceField.TextWrapped = true
ForceField.MouseButton1Down:connect(function()
      -- Gui to Lua
      -- Version: 3.
      -- Instances:

     local   ForceFieldGUI = Instance.new("ScreenGui")
     local   ForceFieldGUI_2 = Instance.new("TextButton")
     local   ForceFieldOFF = Instance.new("TextButton")
     local   ForceFieldON = Instance.new("TextButton")

     --Properties:

     ForceFieldGUI
     ForceFieldGUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

     ForceFieldGUI
     ForceFieldGUI_2.Parent = ForceFieldGUI
     Color3.fromRGB(0, 255, 255)
     ForceFieldGUI_2.BackgroundTransparency = 0.300
     ForceFieldGUI_2.BorderColor3 = Color3.fromRGB(245, 244, 247)
     ForceFieldGUI_2.BorderSizePixel = 0
     ForceFieldGUI_2.Position = UDim2.new(0, 0, 0, 240)
     ForceFieldGUI_2.Size = UDim2.new(0, 100, 0, 20)
     ForceField
     Color3.fromRGB(17, 17, 17)
     ForceFieldGUI_2.TextTransparency = 0.300

     ForceFieldOFF
     ForceFieldOFF.Parent = ForceFieldGUI
     ForceFieldOFF.BackgroundColor3 = Color3.fromRGB(253, 253, 253)
     ForceFieldOFF.BackgroundTransparency = 0.300
     ForceFieldOFF.BorderColor3 = Color3.fromRGB(245, 244, 247)
     ForceFieldOFF.BorderSizePixel = 0
     UDim2.new(0, 0, 0, 280)
     ForceFieldOFF.Size = UDim2.new(0, 100, 0, 20)
     ForceFieldOFF.Visible = false
     ForceFieldOFF.Text = "Off"
     Color3.fromRGB(17, 17, 17)

     ForceFieldON
     ForceFieldON.Parent = ForceFieldGUI
     ForceFieldON.BackgroundColor3 = Color3.fromRGB(253, 253, 253)
     ForceFieldON.BackgroundTransparency = 0.300
     Color3.fromRGB(245, 244, 247)
     ForceFieldON.BorderSizePixel = 0
     ForceFieldON.Position = UDim2.new(0, 0, 0, 260)
     ForceFieldON.Size = UDim2.new(0, 100, 0, 20)
     ForceFieldON.Visible = false
     On
     Color3.fromRGB(17, 17, 17)

     -- Scripts:

     local function DVAWVL_fake_script() -- ForceFieldGUI_2.Script
           local script = Instance.new('Script', ForceFieldGUI_2)

            function onClicked(GUI)
                  h =
script.Parent.Parent.Parent.Parent.Character:findFirstChild("Humanoid")
                  if (h ~= nil) then
                        script.Parent.Parent.ForceFieldOFF.Visible = true
                        script.Parent.Parent.ForceFieldON.Visible = true
                  else return end
            end
            script.Parent.MouseButton1Click:connect(onClicked)
      end
      coroutine.wrap(DVAWVL_fake_script)()
      local function HYECSMJ_fake_script() -- ForceFieldOFF.Script
            local script = Instance.new('Script', ForceFieldOFF)

            function onClicked(GUI)
                  f =
script.Parent.Parent.Parent.Parent.Character:findFirstChild("ForceField")
                  if (f ~= nil) then
                        f:remove()
                  else return end
            end
            script.Parent.MouseButton1Click:connect(onClicked)
      end
      coroutine.wrap(HYECSMJ_fake_script)()
      local function LOYRXPU_fake_script() -- ForceFieldOFF.Script
            local script = Instance.new('Script', ForceFieldOFF)
            function onClicked(GUI)
                  h =
script.Parent.Parent.Parent.Parent.Character:findFirstChild("Humanoid")
                  if (h ~= nil) then
                        script.Parent.Parent.ForceFieldOFF.Visible = false
                        script.Parent.Parent.ForceFieldON.Visible = false
                  else return end
            end
            script.Parent.MouseButton1Click:connect(onClicked)
      end
      coroutine.wrap(LOYRXPU_fake_script)()
      local function PFEVNBW_fake_script() -- ForceFieldON.Script
            local script = Instance.new('Script', ForceFieldON)

            function onClicked(GUI)
                  h =
script.Parent.Parent.Parent.Parent.Character:findFirstChild("Humanoid")
                  if (h ~= nil) then
                        FF = Instance.new("ForceField")
                        FF.Parent = script.Parent.Parent.Parent.Parent.Character
                  else return end
            end
            script.Parent.MouseButton1Click:connect(onClicked)
      end
      coroutine.wrap(PFEVNBW_fake_script)()
      local function FNHQ_fake_script() -- ForceFieldON.Script
            local script = Instance.new('Script', ForceFieldON)

            function onClicked(GUI)
                  h =
script.Parent.Parent.Parent.Parent.Character:findFirstChild("Humanoid")
                  if (h is not nil) then
                        script.Parent.Parent.ForceFieldOFF.Visible = false
                        script.Parent.Parent.ForceFieldON.Visible = false
                  else return end
            end
            script.Parent.MouseButton1Click:connect(onClicked)
      end
      coroutine.wrap(FNHQ_fake_script)()
end
-- Scripts:

local function QFCS_fake_script() -- Frame.Dragify
      local script = Instance.new('LocalScript', Frame)

      local UIS = game:GetService("UserInputService")
      function dragify(Frame)
      dragToggle = nil
      local dragSpeed = 0
      dragInput = nil
      dragStart = nil
      local dragPos = nil
      function updateInput(input)
      local Delta = input.Position - dragStart
      local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset +
Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
      game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.25),
Position
      end
      Frame.InputBegan:Connect(function(input)
      if (input.UserInputType == Enum.UserInputType.MouseButton1 or
input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil
then
      dragToggle = true
      input.Position
      Frame.Position
      input.Changed:Connect(function()
      if input.UserInputState == Enum.UserInputState.End then
      dragToggle = false
      end
      end)
      end
      end
      Frame.InputChanged:Connect(function(input)
      if input.UserInputType == Enum.UserInputType.MouseMovement or
input.UserInputType == Enum.UserInputType.Touch then
      input
      end
      end)
      game:GetService("UserInputService").InputChanged:Connect(function(input)
      if input == dragInput and dragToggle then
      updateInput(input)
      end
      end
      end

      dragify(script.Parent)
end
coroutine.wrap(QFCS_fake_script)()
player = game.Players.LocalPlayer

--#-----#--

attachment4 = Instance.new("Attachment",   player.Character["Right Leg"])
Attachment0
attachment5 = Instance.new("Attachment",   player.Character["Right Leg"])
attachment5.Name = "Attachment1"
attachment6 = Instance.new("Attachment",   player.Character["Right Leg"])
Attachment2
attachment7 = Instance.new("Attachment",   player.Character["Right Leg"])
Attachment3

attachment4.Position = Vector3.new(0.5, -1, 0.5)
attachment5.Position = Vector3.new(-0.5, -0.7, -0.5)
Vector3.new(-0.5, -0.7, 0.5)
attachment7.Position = Vector3.new(0.5, -1, -0.5)

trail2 = Instance.new("Trail", player.Character["Right Leg"])
Trail0
trail3 = Instance.new("Trail", player.Character["Right Leg"])
Trail1

attachment4
attachment5
attachment6
attachment7

trail2.Lifetime = 1.5
trail3.Lifetime = 1.5

trail2.MaxLength   =   0
trail3.MaxLength   =   0
trail2.MinLength   =   0
trail3.MinLength   =   0

--#----------#--

attachment0   = Instance.new("Attachment", player.Character["Left Leg"])
Attachment0
attachment1   = Instance.new("Attachment", player.Character["Left Leg"])
Attachment1
attachment2   = Instance.new("Attachment", player.Character["Left Leg"])
Attachment2
attachment3   = Instance.new("Attachment", player.Character["Left Leg"])
Attachment3

attachment0.Position       =   Vector3.new(0.5, -1, 0.5)
attachment1.Position       =   Vector3.new(-0.5, -0.7, -0.5)
attachment2.Position       =   Vector3.new(-0.5, -0.7, 0.5)
attachment3.Position       =   Vector3.new(0.5, -1, -0.5)

trail0 = Instance.new("Trail", player.Character["Left Leg"])
Trail0
trail1 = Instance.new("Trail", player.Character["Left Leg"])
Trail1

attachment0
attachment1
attachment2
attachment3

trail0.Lifetime = 1.5
trail1.Lifetime = 1.5

trail0.MaxLength   =   0
trail1.MaxLength   =   0
trail0.MinLength   =   0
trail1.MinLength   =   0

--#--------------------#--

ff = Instance.new("ForceField", player.Character)
ff.Visible = false

while true do
wait()
game.Workspace.CaptainFiliNox.Humanoid.Health = 100
end
warn("loaded")

