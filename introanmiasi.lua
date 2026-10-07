--================================================================
-- INTRO ANIMATION "SYSX"
--================================================================
local introGui = Instance.new("ScreenGui")
introGui.Name = "SYSX_Intro"
introGui.ResetOnSpawn = false
introGui.IgnoreGuiInset = true
introGui.DisplayOrder = 99999999
introGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
introGui.Parent = playerGui

-- Background gelap dengan glow
local bg = Instance.new("Frame")
bg.Size = UDim2.fromScale(1, 1)
bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bg.BackgroundTransparency = 1
bg.BorderSizePixel = 0
bg.Parent = introGui

-- Container tengah
local container = Instance.new("Frame")
container.Size = UDim2.fromOffset(600, 200)
container.Position = UDim2.new(0.5, 0, 0.5, 0)
container.AnchorPoint = Vector2.new(0.5, 0.5)
container.BackgroundTransparency = 1
container.Parent = introGui

-- Fungsi buat huruf
local function makeLetter(char, offsetX, color, glowColor)
    local letter = Instance.new("TextLabel")
    letter.Text = char
    letter.Size = UDim2.fromOffset(120, 160)
    letter.Position = UDim2.new(0.5, offsetX, 0.5, 0)
    letter.AnchorPoint = Vector2.new(0.5, 0.5)
    letter.BackgroundTransparency = 1
    letter.TextColor3 = color
    letter.TextSize = 130
    letter.Font = Enum.Font.GothamBlack
    letter.TextTransparency = 1
    letter.TextStrokeTransparency = 1
    letter.TextStrokeColor3 = glowColor
    letter.Parent = container

    -- Glow effect (UIStroke)
    local stroke = Instance.new("UIStroke")
    stroke.Color = glowColor
    stroke.Thickness = 0
    stroke.Transparency = 0.3
    stroke.Parent = letter

    return letter, stroke
end

-- Warna accent
local mainColor = Color3.fromRGB(180, 220, 255)
local glowColor = Color3.fromRGB(60, 130, 220)

-- Buat 4 huruf S Y S X
local S1, S1s = makeLetter("S", -500, mainColor, glowColor)
local Y,  Ys  = makeLetter("Y", 500, mainColor, glowColor)
local S2, S2s = makeLetter("S", -500, mainColor, glowColor)
local X,  Xs  = makeLetter("X", 500, mainColor, glowColor)

-- Posisi akhir tiap huruf setelah slide (merapat ke tengah)
local finalPositions = {
    [S1] = UDim2.new(0.5, -135, 0.5, 0),
    [Y]  = UDim2.new(0.5, -45,  0.5, 0),
    [S2] = UDim2.new(0.5, 45,   0.5, 0),
    [X]  = UDim2.new(0.5, 135,  0.5, 0),
}

-- Teks Freemium di bawah
local freemium = Instance.new("TextLabel")
freemium.Text = "FreeMium"
freemium.Size = UDim2.fromOffset(400, 40)
freemium.Position = UDim2.new(0.5, 0, 0.5, 130)
freemium.AnchorPoint = Vector2.new(0.5, 0.5)
freemium.BackgroundTransparency = 1
freemium.TextColor3 = glowColor
freemium.TextSize = 32
freemium.Font = Enum.Font.GothamBold
freemium.TextTransparency = 1
freemium.TextStrokeColor3 = mainColor
freemium.TextStrokeTransparency = 1
freemium.Parent = container

-- Garis horizontal (untuk efek dramatis)
local line = Instance.new("Frame")
line.Size = UDim2.new(0, 0, 0, 2)
line.Position = UDim2.new(0.5, 0, 0.5, 90)
line.AnchorPoint = Vector2.new(0.5, 0.5)
line.BackgroundColor3 = mainColor
line.BorderSizePixel = 0
line.BackgroundTransparency = 1
line.Parent = container

-- Fungsi bikin tween
local function tw(obj, time, props, style, dir)
    local ti = TweenInfo.new(time, style or Enum.EasingStyle.Quint, dir or Enum.EasingDirection.Out)
    local t = TweenService:Create(obj, ti, props)
    t:Play()
    return t
end

-- ================= MAIN ANIMATION =================
task.spawn(function()
    task.wait(0.1)

    -- Fade in background
    tw(bg, 0.3, {BackgroundTransparency = 0.85})

    -- 1. S1 muncul dari KANAN
    S1.Position = UDim2.new(0.5, 600, 0.5, 0)
    tw(S1, 0.4, {
        Position = finalPositions[S1],
        TextTransparency = 0,
        TextStrokeTransparency = 0.5,
    }, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    tw(S1s, 0.4, {Thickness = 3}, Enum.EasingStyle.Quint)
    task.wait(0.35)

    -- 2. Y muncul dari KIRI
    Y.Position = UDim2.new(0.5, -600, 0.5, 0)
    tw(Y, 0.4, {
        Position = finalPositions[Y],
        TextTransparency = 0,
        TextStrokeTransparency = 0.5,
    }, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    tw(Ys, 0.4, {Thickness = 3}, Enum.EasingStyle.Quint)
    task.wait(0.35)

    -- 3. S2 muncul dari KANAN
    S2.Position = UDim2.new(0.5, 600, 0.5, 0)
    tw(S2, 0.4, {
        Position = finalPositions[S2],
        TextTransparency = 0,
        TextStrokeTransparency = 0.5,
    }, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    tw(S2s, 0.4, {Thickness = 3}, Enum.EasingStyle.Quint)
    task.wait(0.35)

    -- 4. X muncul dari KIRI
    X.Position = UDim2.new(0.5, -600, 0.5, 0)
    tw(X, 0.4, {
        Position = finalPositions[X],
        TextTransparency = 0,
        TextStrokeTransparency = 0.5,
    }, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    tw(Xs, 0.4, {Thickness = 3}, Enum.EasingStyle.Quint)
    task.wait(0.6)

    -- 5. Semua huruf "gabung" (glow burst)
    tw(S1s, 0.2, {Transparency = 0.05, Thickness = 5}, Enum.EasingStyle.Quad)
    tw(Ys,  0.2, {Transparency = 0.05, Thickness = 5}, Enum.EasingStyle.Quad)
    tw(S2s, 0.2, {Transparency = 0.05, Thickness = 5}, Enum.EasingStyle.Quad)
    tw(Xs,  0.2, {Transparency = 0.05, Thickness = 5}, Enum.EasingStyle.Quad)

    -- Pulse tiap huruf sedikit
    tw(S1, 0.15, {TextSize = 145}, Enum.EasingStyle.Quad)
    tw(Y,  0.15, {TextSize = 145}, Enum.EasingStyle.Quad)
    tw(S2, 0.15, {TextSize = 145}, Enum.EasingStyle.Quad)
    tw(X,  0.15, {TextSize = 145}, Enum.EasingStyle.Quad)
    task.wait(0.15)
    tw(S1, 0.15, {TextSize = 130}, Enum.EasingStyle.Quad)
    tw(Y,  0.15, {TextSize = 130}, Enum.EasingStyle.Quad)
    tw(S2, 0.15, {TextSize = 130}, Enum.EasingStyle.Quad)
    tw(X,  0.15, {TextSize = 130}, Enum.EasingStyle.Quad)

    task.wait(0.25)

    -- 6. Garis horizontal muncul lebar
    tw(line, 0.35, {Size = UDim2.new(0, 380, 0, 2), BackgroundTransparency = 0}, Enum.EasingStyle.Quint)

    task.wait(0.2)

    -- 7. Teks "FreeMium" fade in dari bawah
    freemium.Position = UDim2.new(0.5, 0, 0.5, 160)
    tw(freemium, 0.4, {
        Position = UDim2.new(0.5, 0, 0.5, 130),
        TextTransparency = 0,
        TextStrokeTransparency = 0.5,
    }, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

    task.wait(1.2)

    -- 8. Fade out seluruh intro
    for _, obj in ipairs({S1, Y, S2, X}) do
        tw(obj, 0.4, {TextTransparency = 1, TextStrokeTransparency = 1}, Enum.EasingStyle.Quad)
    end
    tw(freemium, 0.4, {TextTransparency = 1, TextStrokeTransparency = 1}, Enum.EasingStyle.Quad)
    tw(line, 0.4, {BackgroundTransparency = 1}, Enum.EasingStyle.Quad)

    for _, obj in ipairs({S1s, Ys, S2s, Xs}) do
        tw(obj, 0.4, {Transparency = 1}, Enum.EasingStyle.Quad)
    end

    tw(bg, 0.5, {BackgroundTransparency = 1}, Enum.EasingStyle.Quad)

    task.wait(0.6)

    -- Destroy intro
    introGui:Destroy()

    -- Setelah intro selesai, buka UI utama
    if main then
        main.Visible = true
    end
end)

-- Sembunyikan UI utama sampai intro selesai
if main then
    main.Visible = false
end
