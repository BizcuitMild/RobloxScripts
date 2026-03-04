local ESP = {}

function ESP.AddFolder(
    name: string
)
    local existing = workspace:FindFirstChild(name)
    if existing then return existing end

    local ESPFolder = Instance.new("Folder")
    ESPFolder.Parent = workspace
    ESPFolder.Name = name
    return ESPFolder
end

function ESP.AddESP(
    folderName: string,
    text: string,
    size: number,
    adornee: BasePart | Model,
    color: Color3,

    mutationtext: string,
    mutationColor: Color3,

    distancetext: string,

    enableName: boolean?,
    enableMutation: boolean?,
    enableDistance: boolean?
)
    local folder = workspace:FindFirstChild(folderName)
    if not folder then
        return
    end

    local ESPBillboardGui = Instance.new("BillboardGui")
    ESPBillboardGui.Name = adornee.Name .. "_Gui"
    ESPBillboardGui.Parent = folder
    ESPBillboardGui.Adornee = adornee
    ESPBillboardGui.Size = UDim2.new(0, 80, 0, 80)
    ESPBillboardGui.StudsOffset = Vector3.new(0, 3, 0)
    ESPBillboardGui.AlwaysOnTop = true

    if enableName then
        local ESPTextLabel = Instance.new("TextLabel")
        ESPTextLabel.Parent = ESPBillboardGui
        ESPTextLabel.Size = UDim2.new(1, 0, size, 0)
        ESPTextLabel.Position = UDim2.new(0, 0, 0, 0)
        ESPTextLabel.BackgroundTransparency = 1
        ESPTextLabel.Text = text
        ESPTextLabel.TextColor3 = color
        ESPTextLabel.TextStrokeTransparency = 0.5
        ESPTextLabel.TextScaled = true
    end

    if enableMutation then
        local mutation = Instance.new("TextLabel")
        mutation.Parent = ESPBillboardGui
        mutation.Size = UDim2.new(1, 0, size, 0)
        mutation.Position = UDim2.new(0, 0, 0.2, 0)
        mutation.BackgroundTransparency = 1
        mutation.Text = mutationtext
        mutation.TextColor3 = mutationColor
        mutation.TextStrokeTransparency = 0.5
        mutation.TextScaled = true
    end

    if enableDistance then
        local distance = Instance.new("TextLabel")
        distance.Parent = ESPBillboardGui
        distance.Size = UDim2.new(1, 0, size, 0)
        distance.Position = UDim2.new(0, 0, 0.4, 0)
        distance.BackgroundTransparency = 1
        distance.Text = distancetext
        distance.TextColor3 = color
        distance.TextStrokeTransparency = 0.5
        distance.TextScaled = true
    end
end

function ESP.Clear(
    folderName: string
)
    local folder = workspace:FindFirstChild(folderName)
    if folder then
        folder:ClearAllChildren()
    end
end

return ESP
