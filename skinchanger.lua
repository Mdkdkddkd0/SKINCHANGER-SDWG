-- MM2 Skinchanger TOP-20 (часть 1/2)
-- 5 ножей + 5 пушек. Часть 2 добавляет ещё 10.

local CONFIG = { PollRate = 0.1 }

local Players = game:GetService('Players')
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local RunService = game:GetService('RunService')
local InsertService = game:GetService('InsertService')
local LocalPlayer = Players.LocalPlayer

pcall(function() if setthreadidentity then setthreadidentity(2) end end)

if _G.__MM2Viz and _G.__MM2Viz.destroy then
    pcall(_G.__MM2Viz.destroy)
end

local SELF = { conns = {} }
_G.__MM2Viz = SELF

local ClientServices = ReplicatedStorage:WaitForChild('ClientServices')
local EquipService = require(ClientServices:WaitForChild('EquipService'))
local Sync = require(ReplicatedStorage:WaitForChild('Database'):WaitForChild('Sync'))
local ProfileData = require(ReplicatedStorage:WaitForChild('Modules'):WaitForChild('ProfileData'))
local WeaponDB = Sync.Weapons
local Remotes = ReplicatedStorage:WaitForChild('Remotes')
local InvDataChanged = Remotes:WaitForChild('Inventory'):WaitForChild('InventoryDataChanged')

-- ============================================================
-- MESHES
-- ============================================================
local MESHES = {}

-- ===== НОЖИ (5 шт) =====

MESHES.UFOKnifeChroma = {
    Meta = {
        Chroma = true, Event = 'Halloween',
        Image = 'rbxthumb://type=Asset&w=150&h=150&id=104256106059730',
        ItemID = 77607127867154, ItemName = 'Alienbeam',
        ItemType = 'Knife', Rarity = 'Godly', Year = '2025',
        Angles = { X = 0, Y = 0, Z = 0 },
    },
    Display = {
        { Class = 'Part', Name = 'KnifeDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(163, 162, 165),
            Material = Enum.Material.Glass, Reflectance = 0,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.933, 3.791, 1.054), Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://86649405964534', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(0.077,0.077,0.077),
            TextureId = 'rbxassetid://94763497877100', VertexColor = Vector3.new(1,1,1) } },
        { Class = 'Decal', Name = 'Chroma', Props = {
            Color3 = Color3.fromRGB(255,20,0), Face = Enum.NormalId.Left,
            Texture = 'rbxassetid://138018131999412', Transparency = 0 } },
    },
}

MESHES.HeartWandChroma = {
    Meta = {
        Chroma = true, Event = 'Valentines',
        Image = 'rbxassetid://83357695007777',
        ItemID = 78479059410850, ItemName = 'Heart Wand',
        ItemType = 'Knife', Rarity = 'Godly', Season = 1, Year = '2026',
        Angles = { X = 0, Y = 0, Z = 0 },
    },
    Display = {
        { Class = 'Part', Name = 'KnifeDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(163,162,165),
            Material = Enum.Material.Plastic, Reflectance = 0,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.804, 2.2835, 3.4627), Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://77738838473091', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(0.0782,0.0782,0.0782),
            TextureId = 'rbxassetid://78842905206144', VertexColor = Vector3.new(1,1,1) } },
        { Class = 'Decal', Name = 'Chroma', Props = {
            Color3 = Color3.fromRGB(255,19,0), Face = Enum.NormalId.Left,
            Texture = 'rbxassetid://106915560132163', Transparency = 0 } },
    },
}

MESHES.SnowDaggerChroma = {
    Meta = {
        Chroma = true, Event = 'Christmas',
        Image = 'rbxassetid://102260232089801',
        ItemID = 95328449981238, ItemName = 'Snow Dagger',
        ItemType = 'Knife', Rarity = 'Godly', Year = '2025',
        Angles = { X = 0, Y = 0, Z = 0 },
    },
    Display = {
        { Class = 'Part', Name = 'KnifeDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(163,162,165),
            Material = Enum.Material.Plastic, Reflectance = 0,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.3313, 2.7513, 0.657), Transparency = 0 } },
        { Class = 'Decal', Name = 'Chroma', Props = {
            Color3 = Color3.fromRGB(255,19,0), Face = Enum.NormalId.Left,
            Texture = 'rbxassetid://109403096491788', Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://140633396635861', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(0.0598,0.0598,0.0598),
            TextureId = 'rbxassetid://77812964601215', VertexColor = Vector3.new(1,1,1) } },
    },
}

MESHES.ElderwoodKnifeChroma = {
    Meta = {
        Chroma = true, Event = 'Halloween',
        Image = 'http://www.roblox.com/asset/?id=11255021976',
        ItemID = 11254975176, ItemName = 'Elderwood Blade',
        ItemType = 'Knife', Rarity = 'Godly', Year = '2022',
        Angles = { X = 0, Y = 0, Z = 0 },
    },
    Display = {
        { Class = 'Part', Name = 'KnifeDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(163,162,165),
            Material = Enum.Material.Plastic, Reflectance = 0,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.276, 3.531, 1.041), Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://11238166013', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(0.07,0.07,0.07),
            TextureId = 'http://www.roblox.com/asset/?id=11370088878', VertexColor = Vector3.new(1,1,1) } },
        { Class = 'Decal', Name = 'Chroma', Props = {
            Color3 = Color3.fromRGB(255,20,0), Face = Enum.NormalId.Right,
            Texture = 'rbxassetid://11370095395', Transparency = 0 } },
    },
}

MESHES.CandleflameChroma = {
    Meta = {
        Chroma = true, Event = 'Halloween',
        Image = 'http://www.roblox.com/asset/?id=7806149582',
        ItemID = 7806121918, ItemName = 'Candleflame',
        ItemType = 'Knife', Rarity = 'Godly', Year = '2021',
        Angles = { X = 0, Y = 0, Z = 0 },
    },
    Display = {
        { Class = 'Part', Name = 'KnifeDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(17,17,17),
            Material = Enum.Material.Plastic, Reflectance = 0,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.4, 3, 0.8), Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://7791364860', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(0.06,0.06,0.06),
            TextureId = 'rbxassetid://7806078587', VertexColor = Vector3.new(1,1,1) } },
        { Class = 'Decal', Name = 'Chroma', Props = {
            Color3 = Color3.fromRGB(255,19,0), Face = Enum.NormalId.Front,
            Texture = 'rbxassetid://7806088865', Transparency = 0 } },
    },
}
-- ===== НОЖИ (часть 2, 5 шт) =====

MESHES.BonebladeChroma = {
    Meta = {
        Chroma = true, Event = 'Halloween',
        Image = 'http://www.roblox.com/Thumbs/Asset.ashx?format=png&width=250&height=250&assetId=2513597845',
        ItemID = 2513598419, ItemName = 'Boneblade',
        ItemType = 'Knife', Rarity = 'Godly', Year = '2018',
        Angles = { X = 0, Y = 0, Z = 0 },
    },
    Display = {
        { Class = 'Part', Name = 'KnifeDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(163,162,165),
            Material = Enum.Material.Plastic, Reflectance = 0,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.4, 3, 0.7), Transparency = 0 } },
        { Class = 'Decal', Name = 'Chroma', Props = {
            Color3 = Color3.fromRGB(255,19,0), Face = Enum.NormalId.Front,
            Texture = 'rbxassetid://2513578115', Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://1857106669', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(0.73,0.73,0.73),
            TextureId = 'rbxassetid://2513576265', VertexColor = Vector3.new(1,1,1) } },
    },
}

MESHES.GingerbladeChroma = {
    Meta = {
        Chroma = true, Event = 'Christmas',
        Image = 'http://www.roblox.com/Thumbs/Asset.ashx?format=png&width=250&height=250&assetId=2672351679',
        ItemID = 2672349340, ItemName = 'Gingerblade',
        ItemType = 'Knife', Rarity = 'Godly', Year = '2018',
        Angles = { X = 0, Y = 0, Z = 0 },
    },
    Display = {
        { Class = 'Part', Name = 'KnifeDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(248,248,248),
            Material = Enum.Material.Fabric, Reflectance = 0,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.25, 3, 0.5), Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://2682453204', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(0.61,0.61,0.61),
            TextureId = 'rbxassetid://2672327402', VertexColor = Vector3.new(1,1,1) } },
        { Class = 'Decal', Name = 'Chroma', Props = {
            Color3 = Color3.fromRGB(255,18,0), Face = Enum.NormalId.Front,
            Texture = 'rbxassetid://2672332704', Transparency = 0 } },
        { Class = 'Decal', Name = 'Chroma', Props = {
            Color3 = Color3.fromRGB(255,18,0), Face = Enum.NormalId.Front,
            Texture = 'rbxassetid://2672332700', Transparency = 0 } },
    },
}

MESHES.DeathshardChroma = {
    Meta = {
        Chroma = true,
        Image = 'rbxassetid://3187397317',
        ItemID = 3187390667, ItemName = 'Deathshard',
        ItemType = 'Knife', Rarity = 'Godly',
        Angles = { X = 0, Y = 0, Z = 0.7854 },
        RadioAngles = { X = -1.0472, Y = 1.5708, Z = 3.14159 },
    },
    Display = {
        { Class = 'Part', Name = 'KnifeDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(99,95,98),
            Material = Enum.Material.Concrete, Reflectance = 0,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.55, 2.39, 0.2), Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://62275962', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(0.8,0.8,0.8),
            TextureId = 'rbxassetid://3167029738', VertexColor = Vector3.new(1,1,1) } },
        { Class = 'Decal', Name = 'Chroma', Props = {
            Color3 = Color3.fromRGB(255,18,0), Face = Enum.NormalId.Front,
            Texture = 'rbxassetid://3167033529', Transparency = 0 } },
    },
}

MESHES.FangChroma = {
    Meta = {
        Chroma = true,
        Image = 'rbxassetid://3187397850',
        ItemID = 3187392501, ItemName = 'Fang',
        ItemType = 'Knife', Rarity = 'Godly',
        Angles = { X = 0, Y = 0, Z = 0.7854 },
        RadioAngles = { X = -1.0472, Y = 1.5708, Z = 3.14159 },
    },
    Display = {
        { Class = 'Part', Name = 'KnifeDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(231,231,236),
            Material = Enum.Material.DiamondPlate, Reflectance = 0.01,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.99, 3, 0.23), Transparency = 0 } },
        { Class = 'Decal', Name = 'Chroma', Props = {
            Color3 = Color3.fromRGB(255,20,0), Face = Enum.NormalId.Front,
            Texture = 'rbxassetid://3167057391', Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://117500241', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(0.4,0.37,0.37),
            TextureId = '', VertexColor = Vector3.new(1,1,1) } },
    },
}

MESHES.SeerChroma = {
    Meta = {
        Chroma = true,
        Image = 'rbxassetid://3184140321',
        ItemID = 3184125538, ItemName = 'Seer',
        ItemType = 'Knife', Rarity = 'Godly',
        Angles = { X = 0, Y = 0, Z = 0 },
    },
    Display = {
        { Class = 'Part', Name = 'KnifeDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(163,162,165),
            Material = Enum.Material.Plastic, Reflectance = 0,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.4, 3, 0.7), Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://156092238', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(0.7,0.91,1),
            TextureId = 'rbxassetid://3184059718', VertexColor = Vector3.new(1,1,1) } },
        { Class = 'Decal', Name = 'Chroma', Props = {
            Color3 = Color3.fromRGB(255,19,0), Face = Enum.NormalId.Front,
            Texture = 'rbxassetid://3184061374', Transparency = 0 } },
    },
}
-- ===== НОЖИ (часть 3, 5 шт) =====

MESHES.BloodKnife = {
    Meta = {
        Image = 'http://www.roblox.com/asset/?id=144307188',
        ItemID = 473573464, ItemName = 'Blood',
        ItemType = 'Knife', Rarity = 'Classic',
        RadioAngles = { X = 0.3491, Y = 0, Z = 0 },
        RadioOffset = { X = -1, Y = -1.3, Z = 0 },
    },
    Display = {
        { Class = 'Part', Name = 'KnifeDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(17,17,17),
            Material = Enum.Material.DiamondPlate, Reflectance = 0.01,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.6, 0.4, 2.4), Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://51682254', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(0.5, 0.5, 0.3),
            TextureId = 'http://www.roblox.com/asset/?id=51941734',
            VertexColor = Vector3.new(1,1,1) } },
    },
}

MESHES.GhostKnife = {
    Meta = {
        Image = 'http://www.roblox.com/asset/?id=144268841',
        ItemID = 473574401, ItemName = 'Ghost',
        ItemType = 'Knife', Rarity = 'Classic',
        RadioAngles = { X = 0.3491, Y = 0, Z = 0 },
        RadioOffset = { X = -1, Y = -1.4, Z = 0.1 },
    },
    Display = {
        { Class = 'Part', Name = 'KnifeDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(17,17,17),
            Material = Enum.Material.DiamondPlate, Reflectance = 0.01,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.6, 0.4, 2.4), Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://64131019', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(3, 2, 2),
            TextureId = 'http://www.roblox.com/asset/?id=64131051',
            VertexColor = Vector3.new(1,1,1) } },
        { Class = 'Part', Name = 'EffectCenter', Props = {
            CanCollide = false, Color = Color3.fromRGB(17,17,17),
            Material = Enum.Material.DiamondPlate, Reflectance = 0.01,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.2, 0.2, 0.4), Transparency = 1 } },
        { Class = 'Part', Name = 'EffectHalf', Props = {
            CanCollide = false, Color = Color3.fromRGB(17,17,17),
            Material = Enum.Material.DiamondPlate, Reflectance = 0.01,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.2, 1.6, 0.4), Transparency = 1 } },
        { Class = 'Part', Name = 'EffectFull', Props = {
            CanCollide = false, Color = Color3.fromRGB(17,17,17),
            Material = Enum.Material.DiamondPlate, Reflectance = 0.01,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.2, 1.6, 0.4), Transparency = 1 } },
    },
}

MESHES.TimeKnife = {
    Meta = {
        Angles = { X = -1.5708, Y = -0.7854, Z = 0 },
        Image = 'http://www.roblox.com/asset/?id=143917700',
        ItemID = 473575049, ItemName = 'Prince',
        ItemType = 'Knife', Rarity = 'Classic',
        RadioAngles = { X = 0.3491, Y = 0, Z = 1.5708 },
        RadioOffset = { X = -1, Y = -1.4, Z = 0.23 },
    },
    Display = {
        { Class = 'Part', Name = 'KnifeDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(17,17,17),
            Material = Enum.Material.DiamondPlate, Reflectance = 0.01,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.6, 0.4, 2.4), Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://70990583', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(0.5, 0.8, 0.5),
            TextureId = 'http://www.roblox.com/asset/?id=70990591',
            VertexColor = Vector3.new(1,1,1) } },
    },
}

MESHES.ShadowKnife = {
    Meta = {
        Angles = { X = -1.5708, Y = -0.7854, Z = 0 },
        Image = 'http://www.roblox.com/asset/?id=144070096',
        ItemID = 474030882, ItemName = 'Shadow',
        ItemType = 'Knife', Rarity = 'Classic',
        RadioAngles = { X = 0.3491, Y = 0, Z = 1.5708 },
        RadioOffset = { X = -1, Y = -1.3, Z = 0.1 },
    },
    Display = {
        { Class = 'Part', Name = 'KnifeDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(17,17,17),
            Material = Enum.Material.DiamondPlate, Reflectance = 0.01,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.6, 0.4, 2.4), Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://86297695', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(0.4, 0.2, 0.2),
            TextureId = 'http://www.roblox.com/asset/?id=86290910',
            VertexColor = Vector3.new(1,1,1) } },
    },
}

MESHES.Knife1 = {
    Meta = {
        Angles = { X = -1.5708, Y = 0.7854, Z = 0 },
        Image = 'http://www.roblox.com/asset/?id=143820641',
        ItemID = 473574001, ItemName = 'Splitter',
        ItemType = 'Knife', Rarity = 'Classic',
        RadioAngles = { X = 0.3491, Y = 0, Z = 1.5708 },
        RadioOffset = { X = -1, Y = -1.3, Z = 0 },
    },
    Display = {
        { Class = 'Part', Name = 'KnifeDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(17,17,17),
            Material = Enum.Material.DiamondPlate, Reflectance = 0.01,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.6, 0.4, 2.4), Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://22771612', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(0.15, 0.15, 0.15),
            TextureId = 'http://www.roblox.com/asset/?id=22771560',
            VertexColor = Vector3.new(1,1,1) } },
    },
}

-- ===== ПУШКИ (часть 3, 5 шт) =====

MESHES.Shark = {
    Meta = {
        Angles = { X = -2.0944, Y = 0, Z = 0 },
        Image = 'rbxassetid://3187421705',
        ItemID = 203858533, ItemName = 'Shark',
        ItemType = 'Gun', Rarity = 'Godly',
    },
    Display = {
        { Class = 'Part', Name = 'GunDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(163,162,165),
            Material = Enum.Material.Plastic, Reflectance = 0,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.58, 1.34, 2.48), Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://118269783', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(0.44, 0.44, 0.44),
            TextureId = 'rbxassetid://1106696354',
            VertexColor = Vector3.new(1,1,1) } },
    },
}

MESHES.Luger = {
    Meta = {
        Angles = { X = 4.1888, Y = 0, Z = 0 },
        Image = 'rbxassetid://3187399148',
        ItemID = 198042673, ItemName = 'Luger',
        ItemType = 'Gun', Rarity = 'Godly',
    },
    Display = {
        { Class = 'Part', Name = 'GunDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(0,143,156),
            Material = Enum.Material.Plastic, Reflectance = 0,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.51, 1.18, 1.35), Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://95356090', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(1.8, 1.8, 1.8),
            TextureId = 'rbxassetid://126534866',
            VertexColor = Vector3.new(1,1,1) } },
    },
}

MESHES.GingerLuger = {
    Meta = {
        Angles = { X = 4.1888, Y = 0, Z = 0 },
        Event = 'Christmas',
        Image = 'http://www.roblox.com/Thumbs/Asset.ashx?format=png&width=250&height=250&assetId=2674983099',
        ItemID = 2674983099, ItemName = 'Ginger Luger',
        ItemType = 'Gun', Rarity = 'Godly', Year = '2018',
    },
    Display = {
        { Class = 'Part', Name = 'GunDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(0,143,156),
            Material = Enum.Material.Plastic, Reflectance = 0,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.51, 1.18, 1.35), Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://95356090', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(1.8, 1.8, 1.8),
            TextureId = 'rbxassetid://2702668339',
            VertexColor = Vector3.new(1,1,1) } },
    },
}

MESHES.Hallowgun = {
    Meta = {
        Angles = { X = 2.7925, Y = 1.5708, Z = 0.7854 },
        Event = 'Halloween',
        Image = 'http://www.roblox.com/Thumbs/Asset.ashx?format=png&width=250&height=250&assetId=5877089721',
        ItemID = 5878721461, ItemName = 'Hallowgun',
        ItemType = 'Gun', Rarity = 'Godly', Year = '2020',
    },
    Display = {
        { Class = 'Part', Name = 'GunDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(17,17,17),
            Material = Enum.Material.Brick, Reflectance = 0,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(2.04, 1.0799, 0.3719), Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://5841866437', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(0.1012, 0.1012, 0.1012),
            TextureId = 'rbxassetid://5841868338',
            VertexColor = Vector3.new(1,1,1) } },
    },
}

MESHES.Icebeam = {
    Meta = {
        Event = 'Christmas',
        Image = 'http://www.roblox.com/Thumbs/Asset.ashx?format=png&width=250&height=250&assetId=8305000161',
        ItemID = 8311005531, ItemName = 'Icebeam',
        ItemType = 'Gun', Rarity = 'Godly', Year = '2021',
        Angles = { X = 0, Y = 0, Z = 0 },
    },
    Display = {
        { Class = 'Part', Name = 'GunDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(17,17,17),
            Material = Enum.Material.Brick, Reflectance = 0,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.328, 2.199, 1.09), Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://8310908064', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(0.1012, 0.1012, 0.1012),
            TextureId = 'rbxassetid://8231066536',
            VertexColor = Vector3.new(1,1,1) } },
    },
}
-- ===== ПУШКИ (часть 2, 5 шт) =====

MESHES.Darkbringer = {
    Meta = {
        Angles = { X = 3.7525, Y = 0, Z = 0 },
        Image = 'http://www.roblox.com/asset/?id=4751387674',
        ItemID = 4749071819, ItemName = 'Darkbringer',
        ItemType = 'Gun', Rarity = 'Godly', Season = 1,
    },
    Display = {
        { Class = 'Part', Name = 'GunDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(0,143,156),
            Material = Enum.Material.Plastic, Reflectance = 0,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.45, 1.26, 1.7), Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://4730813852', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(0.0384,0.035,0.035),
            TextureId = 'rbxassetid://4728494788', VertexColor = Vector3.new(1,1,1) } },
    },
}

MESHES.Amerilaser = {
    Meta = {
        Angles = { X = -2.1817, Y = 0, Z = 0 },
        Image = 'http://www.roblox.com/Thumbs/Asset.ashx?format=png&width=250&height=250&assetId=446050753',
        ItemID = 446050753, ItemName = 'Amerilaser',
        ItemType = 'Gun', Rarity = 'Godly',
    },
    Display = {
        { Class = 'Part', Name = 'GunDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(163,162,165),
            Material = Enum.Material.Plastic, Reflectance = 0,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.6, 1, 1.8), Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://116657254', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(0.7,0.7,0.7),
            TextureId = 'https://www.roblox.com/asset/?id=445884341',
            VertexColor = Vector3.new(1,1,1) } },
    },
}

MESHES.Laser = {
    Meta = {
        Image = 'rbxassetid://3187422496',
        ItemID = 238546983, ItemName = 'Laser',
        ItemType = 'Gun', Rarity = 'Godly',
        Angles = { X = 0, Y = 0, Z = 0 },
    },
    Display = {
        { Class = 'Part', Name = 'GunDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(0,143,156),
            Material = Enum.Material.Plastic, Reflectance = 0,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.51, 1.18, 1.35), Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://130099641', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(0.5,0.5,0.5),
            TextureId = 'rbxassetid://161254231', VertexColor = Vector3.new(1,1,1) } },
    },
}

MESHES.Blaster = {
    Meta = {
        Angles = { X = 4.0143, Y = 0, Z = 0 },
        Image = 'http://www.roblox.com/Thumbs/Asset.ashx?format=png&width=250&height=250&assetId=386277381',
        ItemID = 386277381, ItemName = 'Blaster',
        ItemType = 'Gun', Rarity = 'Godly',
    },
    Display = {
        { Class = 'Part', Name = 'GunDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(0,143,156),
            Material = Enum.Material.Plastic, Reflectance = 0,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.8, 2, 3.1), Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://92656610', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(0.4,0.45,0.5),
            TextureId = 'https://www.roblox.com/asset/?id=386269992',
            VertexColor = Vector3.new(1,1,1) } },
    },
}

MESHES.ElderwoodGun = {
    Meta = {
        Angles = { X = 2.7925, Y = 1.5708, Z = 0.7854 },
        Event = 'Halloween',
        Image = 'http://www.roblox.com/Thumbs/Asset.ashx?format=png&width=250&height=250&assetId=4468571736',
        ItemID = 4211142894, ItemName = 'Elderwood Revolver',
        ItemType = 'Gun', Rarity = 'Godly', Year = '2019',
    },
    Display = {
        { Class = 'Part', Name = 'GunDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(17,17,17),
            Material = Enum.Material.Brick, Reflectance = 0,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(1.49, 1.132, 0.3587), Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://4210029922', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(0.1012,0.1012,0.1012),
            TextureId = 'rbxassetid://4210038158', VertexColor = Vector3.new(1,1,1) } },
    },
}
-- ===== ПУШКИ (5 шт) =====

MESHES.RaygunChroma = {
    Meta = {
        Chroma = true, Event = 'Halloween',
        Image = 'rbxthumb://type=Asset&w=150&h=150&id=83259634072260',
        ItemID = 139431943195380, ItemName = 'Raygun',
        ItemType = 'Gun', Rarity = 'Godly', Year = '2025',
        Angles = { X = 0, Y = 0, Z = 0 },
    },
    Display = {
        { Class = 'Part', Name = 'GunDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(163,162,165),
            Material = Enum.Material.Glass, Reflectance = 0,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.69, 1.643, 2.355), Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://115447220952926', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(0.0472,0.0472,0.0472),
            TextureId = 'rbxassetid://127881437685243', VertexColor = Vector3.new(1,1,1) } },
        { Class = 'Decal', Name = 'Chroma', Props = {
            Color3 = Color3.fromRGB(255,10,0), Face = Enum.NormalId.Left,
            Texture = 'rbxassetid://73231950532216', Transparency = 0 } },
        { Class = 'Beam', Name = 'CustomBeam', Props = {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255,0,4)),
                ColorSequenceKeypoint.new(0.1834, Color3.fromRGB(170,0,156)),
                ColorSequenceKeypoint.new(0.391, Color3.fromRGB(0,0,197)),
                ColorSequenceKeypoint.new(0.6194, Color3.fromRGB(0,255,247)),
                ColorSequenceKeypoint.new(0.8045, Color3.fromRGB(0,166,11)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255,238,0)),
            }),
            LightEmission = 0.5, Texture = '', TextureLength = 1,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.5, 0),
                NumberSequenceKeypoint.new(1, 0.5, 0) }),
            Width0 = 0.2, Width1 = 0.2 } },
    },
}

MESHES.SnowcannonChroma = {
    Meta = {
        Chroma = true, Event = 'Christmas',
        Image = 'rbxassetid://93075282395578',
        ItemID = 129186939023729, ItemName = 'Snowcannon',
        ItemType = 'Gun', Rarity = 'Godly', Year = '2025',
        Angles = { X = 0, Y = 0, Z = 0 },
    },
    Display = {
        { Class = 'Part', Name = 'GunDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(163,162,165),
            Material = Enum.Material.Plastic, Reflectance = 0,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.559, 1.355, 2.5), Transparency = 0 } },
        { Class = 'Decal', Name = 'Chroma', Props = {
            Color3 = Color3.fromRGB(255,0,0), Face = Enum.NormalId.Left,
            Texture = 'rbxassetid://84894022221722', Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://99836890880541', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(0.0496,0.0496,0.0496),
            TextureId = 'rbxassetid://122392330922281', VertexColor = Vector3.new(1,1,1) } },
        { Class = 'Beam', Name = 'CustomBeam', Props = {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255,0,4)),
                ColorSequenceKeypoint.new(0.1834, Color3.fromRGB(170,0,156)),
                ColorSequenceKeypoint.new(0.391, Color3.fromRGB(0,0,197)),
                ColorSequenceKeypoint.new(0.6194, Color3.fromRGB(0,255,247)),
                ColorSequenceKeypoint.new(0.8045, Color3.fromRGB(0,166,11)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255,238,0)),
            }),
            LightEmission = 0.5, Texture = '', TextureLength = 1,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.5, 0),
                NumberSequenceKeypoint.new(1, 0.5, 0) }),
            Width0 = 0.5, Width1 = 0.5 } },
    },
}

MESHES.VampireGunChroma = {
    Meta = {
        Chroma = true, Event = 'Halloween',
        Image = 'http://www.roblox.com/Thumbs/Asset.ashx?format=png&width=250&height=250&assetId=85107391551890',
        ItemID = 90274872705656, ItemName = "Vampire's Gun",
        ItemType = 'Gun', Rarity = 'Godly', Year = '2024',
        Angles = { X = 0, Y = 0, Z = 0 },
    },
    Display = {
        { Class = 'Part', Name = 'GunDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(163,162,165),
            Material = Enum.Material.Plastic, Reflectance = 0,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.422, 1.292, 2.412), Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://126591885289479', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(0.05,0.05,0.05),
            TextureId = 'rbxassetid://104946799389637', VertexColor = Vector3.new(1,1,1) } },
        { Class = 'Decal', Name = 'Chroma', Props = {
            Color3 = Color3.fromRGB(255,18,0), Face = Enum.NormalId.Left,
            Texture = 'rbxassetid://126923923696531', Transparency = 0 } },
    },
}

MESHES.TravelerGunChroma = {
    Meta = {
        Chroma = true, Event = 'Halloween',
        Image = 'rbxassetid://15097920149',
        ItemID = 15097897227, ItemName = "Traveler's Gun",
        ItemType = 'Gun', Rarity = 'Godly', Year = '2023',
        Angles = { X = 0, Y = 0, Z = 0 },
    },
    Display = {
        { Class = 'Part', Name = 'GunDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(163,162,165),
            Material = Enum.Material.Plastic, Reflectance = 0,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.572, 0.5287, 2.52), Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://15090814396', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(0.0484,0.0491,0.0492),
            TextureId = 'rbxassetid://15090814672', VertexColor = Vector3.new(1,1,1) } },
        { Class = 'Decal', Name = 'Chroma', Props = {
            Color3 = Color3.fromRGB(255,18,0), Face = Enum.NormalId.Top,
            Texture = 'rbxassetid://138224985315804', Transparency = 0 } },
    },
}

MESHES.Lightbringer = {
    Meta = {
        Angles = { X = 3.7525, Y = 0, Z = 0 },
        Image = 'http://www.roblox.com/asset/?id=4751387063',
        ItemID = 4749070432, ItemName = 'Lightbringer',
        ItemType = 'Gun', Rarity = 'Godly', Season = 1,
    },
    Display = {
        { Class = 'Part', Name = 'GunDisplay', Path = '(root)', Props = {
            CanCollide = false, Color = Color3.fromRGB(163,162,165),
            Material = Enum.Material.Plastic, Reflectance = 0,
            Shape = Enum.PartType.Block,
            Size = Vector3.new(0.398, 1.62, 1.964), Transparency = 0 } },
        { Class = 'SpecialMesh', Name = 'Mesh', Props = {
            MeshId = 'rbxassetid://4730813852', MeshType = Enum.MeshType.FileMesh,
            Offset = Vector3.new(0,0,0), Scale = Vector3.new(0.039,0.039,0.039),
            TextureId = 'http://www.roblox.com/asset/?id=4728487789',
            VertexColor = Vector3.new(1,1,1) } },
    },
}

-- ============================================================
-- helpers
-- ============================================================
local function trimAsset(v)
    if type(v) == 'string' then return (v:gsub('^%s+', ''):gsub('%s+$', '')) end
    return v
end

local function applyProps(inst, props, skip)
    for k, v in pairs(props) do
        if not (skip and skip[k]) then
            if k == 'MeshId' or k == 'TextureId' or k == 'TextureID' or k == 'Texture' then
                v = trimAsset(v)
            end
            pcall(function() inst[k] = v end)
        end
    end
end

local function createMeshPart(props)
    local meshId = trimAsset(props.MeshId or '')
    local size = props.Size or Vector3.new(1,1,1)
    local part
    pcall(function()
        part = InsertService:CreateMeshPartAsync(meshId, Enum.CollisionFidelity.Box, Enum.RenderFidelity.Precise)
    end)
    if part then
        pcall(function() part.Size = size end)
        return part
    end
    local p = Instance.new('Part')
    p.Size = size
    local sm = Instance.new('SpecialMesh')
    sm.MeshType = Enum.MeshType.FileMesh
    pcall(function() sm.MeshId = meshId end)
    pcall(function() sm.TextureId = trimAsset(props.TextureID or '') end)
    sm.Parent = p
    return p
end

local CHROMA = {
    Color3.fromRGB(255,0,0), Color3.fromRGB(255,255,0),
    Color3.fromRGB(0,255,0), Color3.fromRGB(0,255,255),
    Color3.fromRGB(0,0,255), Color3.fromRGB(255,0,255),
}
local function chromaColor(t)
    local n = #CHROMA
    local phase = t % n
    local i = math.floor(phase)
    return CHROMA[i+1]:Lerp(CHROMA[((i+1)%n)+1], phase - i)
end
local function isChroma(name, data)
    if data.Meta and data.Meta.Chroma == true then return true end
    return name:sub(-6) == 'Chroma'
end

local CHROMA_FLASH_RATE = 1.8
local function startChroma(overlay)
    local flashParts, smoothDecals, smoothOther = {}, {}, {}
    for _, d in ipairs(overlay:GetDescendants()) do
        if d:IsA('BasePart') and (d.Material == Enum.Material.Neon or d.Name:lower():find('light')) then
            flashParts[#flashParts+1] = d
        elseif d:IsA('Decal') and d.Name:lower():find('chroma') then
            smoothDecals[#smoothDecals+1] = d
        elseif d:IsA('Fire') then
            smoothOther[#smoothOther+1] = d
        end
    end
    if #smoothDecals == 0 then smoothOther[#smoothOther+1] = overlay end
    if #flashParts == 0 and #smoothDecals == 0 and #smoothOther == 0 then return nil end
    return RunService.Heartbeat:Connect(function()
        local now = os.clock()
        local col = chromaColor(now)
        for _, s in ipairs(smoothDecals) do s.Color3 = col end
        for _, s in ipairs(smoothOther) do
            if s:IsA('Fire') then s.Color = col
            elseif s:IsA('BasePart') then s.Color = col end
        end
        local step = math.floor(now * CHROMA_FLASH_RATE)
        for i, b in ipairs(flashParts) do
            b.Color = CHROMA[((step + i - 1) % #CHROMA) + 1]
        end
    end)
end

local function metaAngles(data)
    local m = data.Meta or {}
    local a = m.Angles or m.RadioAngles
    if not a then return CFrame.new() end
    return CFrame.Angles(a.X or 0, a.Y or 0, a.Z or 0)
end

local PARTICLE_CLASSES = {
    ParticleEmitter = true, Fire = true, Smoke = true,
    Sparkles = true, PointLight = true, SpotLight = true, SurfaceLight = true,
}

local function buildFlatOverlay(data)
    local root, meshes, decals, effects = nil, {}, {}, {}
    for _, e in ipairs(data.Display or {}) do
        if e.Path == '(root)' then root = e
        elseif e.Class == 'SpecialMesh' then meshes[#meshes+1] = e
        elseif e.Class == 'Decal' or e.Class == 'Texture' then decals[#decals+1] = e
        elseif PARTICLE_CLASSES[e.Class] then effects[#effects+1] = e end
    end
    if not root then return nil end

    local part
    if root.Class == 'MeshPart' then
        part = createMeshPart(root.Props)
        applyProps(part, root.Props, { MeshId = true, Size = true, CanCollide = true })
    else
        part = Instance.new('Part')
        part.Size = root.Props.Size or Vector3.new(1,1,1)
        applyProps(part, root.Props, { Size = true, CanCollide = true })
        for _, m in ipairs(meshes) do
            local sm = Instance.new('SpecialMesh')
            sm.MeshType = Enum.MeshType.FileMesh
            applyProps(sm, m.Props)
            sm.Parent = part
        end
    end
    part.Anchored, part.CanCollide, part.CanQuery, part.CanTouch, part.Massless = false, false, false, false, true

    for _, d in ipairs(decals) do
        local dc = Instance.new('Decal')
        applyProps(dc, d.Props)
        dc.Parent = part
    end
    for _, e in ipairs(effects) do
        local ok, inst = pcall(Instance.new, e.Class)
        if ok and inst then
            applyProps(inst, e.Props)
            inst.Parent = part
        end
    end
    return { root = part, parts = {} }
end

local function buildAnyOverlay(data)
    if data.Display then return buildFlatOverlay(data) end
    return nil
end

local function finalizeOverlay(built, targetCF, data)
    local root = built.root
    local baseCF = targetCF * metaAngles(data)
    pcall(function() root.CFrame = baseCF end)
    for _, p in ipairs(built.parts) do
        if p.relcf then
            pcall(function() p.inst.CFrame = baseCF * p.relcf end)
        end
        local w = Instance.new('WeldConstraint')
        w.Part0 = p.inst; w.Part1 = root; w.Parent = p.inst
    end
    return root
end

local function hideInto(list, inst)
    if inst:IsA('BasePart') or inst:IsA('Decal') then
        list[#list+1] = { inst = inst, prop = 'Transparency', val = inst.Transparency }
        pcall(function() inst.Transparency = 1 end)
    elseif inst:IsA('ParticleEmitter') or inst:IsA('Trail') or inst:IsA('Beam')
        or inst:IsA('Fire') or inst:IsA('Smoke') or inst:IsA('Sparkles') then
        list[#list+1] = { inst = inst, prop = 'Enabled', val = inst.Enabled }
        pcall(function() inst.Enabled = false end)
    end
end
local function restore(hidden)
    for _, h in ipairs(hidden) do
        pcall(function() h.inst[h.prop] = h.val end)
    end
end

-- ============================================================
-- apply
-- ============================================================
local state, lastApplied, token = {}, {}, {}
local setStatus
local function char() return LocalPlayer.Character end
local function displayValue(slot)
    local c = char(); if not c then return nil end
    local ref = c:FindFirstChild('DisplayRef' .. slot)
    return ref and ref.Value or nil
end
local function waitDisplay(slot, timeout)
    local deadline = os.clock() + (timeout or 1)
    while os.clock() < deadline do
        local v = displayValue(slot); if v then return v end
        task.wait(0.05)
    end
    return displayValue(slot)
end
local function cleanup(slot)
    local st = state[slot]; if not st then return end
    if st.chroma then pcall(function() st.chroma:Disconnect() end) end
    if st.overlay then pcall(function() st.overlay:Destroy() end) end
    restore(st.hidden)
    state[slot] = nil
end

local function apply(slot, name)
    if state[slot] and lastApplied[slot] == name and name ~= nil then return end
    token[slot] = (token[slot] or 0) + 1
    local myToken = token[slot]
    cleanup(slot)

    local data = name and MESHES[name]
    if not data then lastApplied[slot] = name; return end
    lastApplied[slot] = name

    local base = displayValue(slot) or waitDisplay(slot, 1.5)
    if token[slot] ~= myToken then return end
    if not base then
        if setStatus then setStatus('No ' .. slot .. ' shown.', Color3.fromRGB(240,200,120)) end
        return
    end

    local hidden = {}
    hideInto(hidden, base)
    for _, d in ipairs(base:GetDescendants()) do hideInto(hidden, d) end

    local built = buildAnyOverlay(data)
    if not built or not built.root or token[slot] ~= myToken or not base.Parent then
        restore(hidden)
        if built and built.root then built.root:Destroy() end
        return
    end

    finalizeOverlay(built, base.CFrame, data)
    local overlay = built.root
    overlay.Parent = base.Parent or base

    local w = Instance.new('WeldConstraint')
    w.Part0 = overlay; w.Part1 = base; w.Parent = overlay

    local chroma = isChroma(name, data) and startChroma(overlay) or nil
    state[slot] = { overlay = overlay, hidden = hidden, chroma = chroma }

    if setStatus then
        setStatus('Showing: ' .. name .. ' (' .. slot .. ')', Color3.fromRGB(150,230,170))
    end
end

-- ============================================================
-- UI
-- ============================================================
local weaponList = {}
for key, data in pairs(MESHES) do
    weaponList[#weaponList+1] = {
        key = key,
        name = (data.Meta and data.Meta.ItemName) or key,
        type = (data.Meta and data.Meta.ItemType) or 'Knife',
    }
end
table.sort(weaponList, function(a,b)
    if a.type ~= b.type then return a.type < b.type end
    return a.name:lower() < b.name:lower()
end)

local statusLabel
do
    local gui = Instance.new('ScreenGui')
    gui.Name = 'SdwgSkinchanger'
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.DisplayOrder = 999999
    pcall(function() gui.Parent = (gethui and gethui()) or game:GetService('CoreGui') end)
    if not gui.Parent then gui.Parent = LocalPlayer:WaitForChild('PlayerGui') end
    SELF.gui = gui

    local root = Instance.new('Frame')
    local rows = #weaponList
    root.Size = UDim2.fromOffset(280, 40 + 22 * rows + 26)
    root.Position = UDim2.new(0, 20, 0.5, -root.Size.Y.Offset / 2)
    root.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
    root.BorderSizePixel = 0
    root.Active = true
    root.Draggable = true
    root.Parent = gui
    Instance.new('UICorner', root).CornerRadius = UDim.new(0, 10)
    local stk = Instance.new('UIStroke', root)
    stk.Color = Color3.fromRGB(160, 90, 230)
    stk.Thickness = 1.5

    local title = Instance.new('TextLabel')
    title.Size = UDim2.new(1, -16, 0, 22)
    title.Position = UDim2.fromOffset(12, 6)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.TextSize = 14
    title.TextColor3 = Color3.fromRGB(235, 228, 255)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Text = 'Skinchanger MM2 · @Sdwg_xyz'
    title.Parent = root

    local scroll = Instance.new('ScrollingFrame')
    scroll.Size = UDim2.new(1, -12, 0, 22 * rows)
    scroll.Position = UDim2.fromOffset(6, 30)
    scroll.BackgroundTransparency = 1
    scroll.BorderSizePixel = 0
    scroll.ScrollBarThickness = 4
    scroll.ScrollBarImageColor3 = Color3.fromRGB(160, 90, 230)
    scroll.CanvasSize = UDim2.new(0, 0, 0, 22 * rows)
    scroll.Parent = root

    local layout = Instance.new('UIListLayout')
    layout.Padding = UDim.new(0, 2)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = scroll

    for i, wv in ipairs(weaponList) do
        local btn = Instance.new('TextButton')
        btn.Size = UDim2.new(1, -6, 0, 20)
        btn.BackgroundColor3 = wv.type == 'Knife'
            and Color3.fromRGB(48, 44, 70)
            or Color3.fromRGB(44, 56, 72)
        btn.BackgroundTransparency = 0.2
        btn.Font = Enum.Font.Gotham
        btn.TextSize = 12
        btn.TextColor3 = Color3.fromRGB(235,235,245)
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.Text = '  ' .. wv.name .. '  (' .. wv.type .. ')'
        btn.LayoutOrder = i
        btn.Parent = scroll
        Instance.new('UICorner', btn).CornerRadius = UDim.new(0, 5)

        local key = wv.key
        btn.MouseButton1Click:Connect(function()
            ProfileData.Weapons.Owned[key] = (ProfileData.Weapons.Owned[key] or 0) + 1
            pcall(function()
                InvDataChanged:Fire('Weapons', key, ProfileData.Weapons.Owned[key])
            end)
            if statusLabel then
                statusLabel.Text = 'Spawned ' .. key
                statusLabel.TextColor3 = Color3.fromRGB(150,230,170)
            end
        end)
    end

    statusLabel = Instance.new('TextLabel')
    statusLabel.Size = UDim2.new(1, -16, 0, 20)
    statusLabel.Position = UDim2.fromOffset(8, 30 + 22 * rows + 2)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Font = Enum.Font.Gotham
    statusLabel.TextSize = 11
    statusLabel.TextColor3 = Color3.fromRGB(190,190,205)
    statusLabel.TextXAlignment = Enum.TextXAlignment.Left
    statusLabel.Text = 'Click a weapon to spawn it.'
    statusLabel.Parent = root
end

function setStatus(t, color)
    if statusLabel then
        statusLabel.Text = t
        statusLabel.TextColor3 = color or Color3.fromRGB(190,190,205)
    end
end

-- ============================================================
-- loops
-- ============================================================
local lastEquipped = { Knife = nil, Gun = nil }
pcall(function()
    lastEquipped.Knife = ProfileData.Weapons.Equipped.Knife
    lastEquipped.Gun = ProfileData.Weapons.Equipped.Gun
end)

task.spawn(function()
    for _, slot in ipairs({ 'Knife', 'Gun' }) do
        local eq = ProfileData.Weapons.Equipped[slot]
        if eq then task.spawn(function() apply(slot, eq) end) end
    end
    while _G.__MM2Viz == SELF do
        for _, slot in ipairs({ 'Knife', 'Gun' }) do
            local eq
            pcall(function() eq = ProfileData.Weapons.Equipped[slot] end)
            if eq ~= lastEquipped[slot] then
                lastEquipped[slot] = eq
                task.spawn(function() apply(slot, eq) end)
            end
        end
        task.wait(CONFIG.PollRate)
    end
end)

table.insert(SELF.conns, EquipService.EquippedChanged.Event:Connect(function(itemType, name)
    if itemType == 'Knife' or itemType == 'Gun' then
        lastEquipped[itemType] = name
        task.spawn(function() apply(itemType, name) end)
    end
end))

table.insert(SELF.conns, LocalPlayer.CharacterAdded:Connect(function()
    for _, slot in ipairs({ 'Knife', 'Gun' }) do
        local st = state[slot]
        if st and st.overlay then pcall(function() st.overlay:Destroy() end) end
    end
    state = {}
    task.delay(1, function()
        for _, slot in ipairs({ 'Knife', 'Gun' }) do
            if lastApplied[slot] then apply(slot, lastApplied[slot]) end
        end
    end)
end))

SELF.destroy = function()
    for _, cn in ipairs(SELF.conns) do pcall(function() cn:Disconnect() end) end
    for slot in pairs(state) do pcall(cleanup, slot) end
    if SELF.gui then pcall(function() SELF.gui:Destroy() end) end
end

setStatus('Ready — click a weapon to spawn it.')