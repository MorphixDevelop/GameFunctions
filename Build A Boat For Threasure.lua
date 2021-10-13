function Delete(Object)
    local DeleteTool = game:GetService("Players").LocalPlayer.Backpack.DeleteTool.RF or game:GetService("Players").LocalPlayer.Character.DeleteTool.RF
    
    DeleteTool:InvokeServer(Object)
end

function InZone(CPos, VSize, Place)
    local PPart = Instance.new("Part")
    PPart.Size = VSize
    PPart.CFrame = CPos
    local func = nil
    
    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("BuildingTool") then
        func = getsenv(game:GetService("Players").LocalPlayer.Backpack.BuildingTool.LocalScript).isPartInZone
    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("BuildingTool") then
        func = getsenv(game:GetService("Players").LocalPlayer.Character.BuildingTool.LocalScript).isPartInZone
    end
    local returns = func(PPart, Place)
    return returns
end

function GetBasePart() 
    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v.ClassName == "Part" and v:FindFirstChild("TeamColor") then
            if v.TeamColor.Value == game.Players.LocalPlayer.TeamColor then
                return v
            end
        end
    end
end

function GetLatestBlock()
    local LatestBlock = nil
    
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v.ClassName == "Model" and v:FindFirstChild("Tag") and v.Tag.Value == game.Players.LocalPlayer.Name then
            LatestBlock = v
        end
    end
    
    return LatestBlock
end

function Build(Name, Anchored, CPos)
    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("BuildingTool") then
        game:GetService("Players").LocalPlayer.Backpack.BuildingTool.RF:InvokeServer(Name, game:GetService("Players").LocalPlayer.Data[Name].Value,nil,CFrame.new(),Anchored,1,CPos)
    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("BuildingTool") then
        game:GetService("Players").LocalPlayer.Character.BuildingTool.RF:InvokeServer(Name, game:GetService("Players").LocalPlayer.Data[Name].Value,nil,CFrame.new(),Anchored,1,CPos)
    end
    
    return GetLatestBlock()
end
