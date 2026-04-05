--[[
    Aimbot de Habilidades Avanzado para Blox Fruits
    Características: Detección avanzada, predicción dinámica, GUI, On-Demand, y más.
    Creado para ser eficiente, preciso y discreto.
]]

-- Servicios
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local Stats = game:GetService("Stats")

-- Jugador Local
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Camera = workspace.CurrentCamera

-- CONFIGURACIÓN (será manejada por la GUI)
local Settings = {
    Enabled = true,
    MaxDistance = 250,
    PredictionFactor = 1.0, -- Multiplicador de predicción base
    PingCompensation = true,
    LoSCheck = true,
    PriorityMode = "Crosshair", -- Opciones: "Crosshair", "Distance"
    AimbotKeybinds = { -- Teclas que activan el aimbot al ser presionadas
        Enum.KeyCode.Z,
        Enum.KeyCode.X,
        Enum.KeyCode.C,
        Enum.KeyCode.V,
        Enum.KeyCode.F,
        Enum.KeyCode.B,
        Enum.KeyCode.N,
        Enum.KeyCode.M,
        Enum.UserInputType.MouseButton1,
        Enum.UserInputType.MouseButton2
    },
    WhitelistedPlayers = {},
    AimbotSpeed = 0.2, -- Suavizado del movimiento del mouse (0.1 = rápido, 0.5 = lento)
    GUIKeybind = Enum.KeyCode.RightShift,
}

-- VARIABLES DE ESTADO
local isAiming = false
local currentTarget = nil
local lastPing = 0
local mouse = LocalPlayer:GetMouse()

-- FUNCIÓN PARA OBTENER PING
local function getPing()
    local stats = Stats.Network
    if stats and stats.ServerStatsItem then
        local ping = stats:FindFirstChild("Ping"):GetValue()
        return ping / 1000 -- Convertir a segundos
    end
    return 0.05 -- Valor por defecto si no se puede obtener
end

-- FUNCIÓN DE DETECCIÓN DE OBJETIVOS AVANZADA
local function getBestTarget()
    local bestTarget = nil
    local bestScore = -math.huge

    for _, player in ipairs(Players:GetPlayers()) do
        if player == LocalPlayer or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then continue end
        if table.find(Settings.WhitelistedPlayers, player.Name) then continue end

        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if not humanoid or humanoid.Health <= 0 then continue end

        local rootPart = player.Character.HumanoidRootPart
        local distance = (HumanoidRootPart.Position - rootPart.Position).Magnitude
        if distance > Settings.MaxDistance then continue end

        -- Verificación de Línea de Visión (LoS)
        if Settings.LoSCheck then
            local rayOrigin = HumanoidRootPart.Position
            local rayDirection = (rootPart.Position - rayOrigin).Unit * distance
            local raycastParams = RaycastParams.new()
            raycastParams.FilterDescendantsInstances = {Character, workspace:FindFirstChild("RaycastIgnore")}
            raycastParams.FilterType = Enum.RaycastFilterType.Exclude
            local hitResult = workspace:Raycast(rayOrigin, rayDirection, raycastParams)
            if hitResult and hitResult.Instance:IsDescendantOf(player.Character) then
                -- Línea de visión clara
            else
                continue -- Objetivo bloqueado
            end
        end

        -- Control de Eje Z (no apuntar a objetivos detrás de la cámara)
        local vectorOnScreen = Camera:WorldToScreenPoint(rootPart.Position)
        if vectorOnScreen.Z <= 0 then continue end

        -- Sistema de Puntuación y Prioridad
        local score = 0
        if Settings.PriorityMode == "Crosshair" then
            local mousePos = Vector2.new(mouse.X, mouse.Y)
            local targetScreenPos = Vector2.new(vectorOnScreen.X, vectorOnScreen.Y)
            score = - (mousePos - targetScreenPos).Magnitude -- Menor distancia al mouse = mayor puntuación
        elseif Settings.PriorityMode == "Distance" then
            score = -distance
        end

        if score > bestScore then
            bestScore = score
            bestTarget = player
        end
    end

    return bestTarget
end

-- FUNCIÓN DE PREDICCIÓN DINÁMICA
local function getPredictedPosition(target)
    if not target or not target.Character then return nil end

    local rootPart = target.Character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return nil end

    local velocity = rootPart.Velocity
    local distance = (HumanoidRootPart.Position - rootPart.Position).Magnitude

    -- Predicción base ajustada por distancia
    local basePrediction = (distance / 100) * Settings.PredictionFactor
    
    -- Compensación de ping
    local pingCompensation = 0
    if Settings.PingCompensation then
        pingCompensation = getPing()
    end
    
    local totalPredictionTime = basePrediction + pingCompensation
    
    return rootPart.Position + (velocity * totalPredictionTime)
end

-- FUNCIÓN PARA MOVER EL MOUSE (ROBUSTA)
local function moveMouseToPosition(targetPos)
    local screenPos = Camera:WorldToScreenPoint(targetPos)
    if screenPos.Z <= 0 then return end -- No mover si está detrás

    local success, err = pcall(function()
        -- Método preferido: getgenv().movemouse (común en exploits potentes)
        if getgenv().movemouse then
            getgenv().movemouse(screenPos.X, screenPos.Y)
            return
        end
        -- Método alternativo: mousemoverel (común en exploits gratuitos)
        if getgenv().mousemoverel then
            local currentMousePos = UserInputService:GetMouseLocation()
            local delta = Vector2.new(screenPos.X - currentMousePos.X, screenPos.Y - currentMousePos.Y)
            getgenv().mousemoverel(delta.X * Settings.AimbotSpeed, delta.Y * Settings.AimbotSpeed)
            return
        end
    end)

    if not success then
        warn("[Aimbot Error] No se pudo mover el mouse. Asegúrate de que tu exploit soporte 'movemouse' o 'mousemoverel'.")
        warn("Error: " .. tostring(err))
    end
end

-- BUCLE PRINCIPAL "ON-DEMAND"
RunService.Heartbeat:Connect(function()
    if not Settings.Enabled then return end

    -- El aimbot solo se activa si se está presionando una tecla de habilidad
    local anyKeyPressed = false
    for _, keybind in ipairs(Settings.AimbotKeybinds) do
        if UserInputService:IsKeyDown(keybind) then
            anyKeyPressed = true
            break
        end
    end

    if anyKeyPressed then
        currentTarget = getBestTarget()
        if currentTarget then
            local predictedPos = getPredictedPosition(currentTarget)
            if predictedPos then
                moveMouseToPosition(predictedPos)
            end
        end
    else
        currentTarget = nil
    end
end)

-- =================== GUI ===================

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ToggleButton = Instance.new("TextButton")
local SettingsFrame = Instance.new("ScrollingFrame")
local DistanceSlider = Instance.new("TextBox")
local PredictionSlider = Instance.new("TextBox")
local SpeedSlider = Instance.new("TextBox")
local LosToggle = Instance.new("TextButton")
local PriorityDropdown = Instance.new("TextButton")
local WhitelistBox = Instance.new("TextBox")
local StatusLabel = Instance.new("TextLabel")

ScreenGui.Name = "AimbotGUI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame
