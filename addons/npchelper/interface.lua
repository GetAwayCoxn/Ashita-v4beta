local imgui = require('imgui')
local chat = require('chat')
local now = os.time()
local lastPacketOut = now
local packetDelay = 10
local newStart = true
local targetTime = now - 10
local towns = T{'Tavnazian Safehold','Al Zahbi','Aht Urhgan Whitegate','Nashmau','Southern San d\'Oria [S]',
    'Bastok Markets [S]','Windurst Waters [S]','San d\'Oria-Jeuno Airship','Bastok-Jeuno Airship','Windurst-Jeuno Airship',
    'Kazham-Jeuno Airship','Southern San d\'Oria','Northern San d\'Oria','Port San d\'Oria','Chateau d\'Oraguille',
    'Bastok Mines','Bastok Markets','Port Bastok','Metalworks','Windurst Waters','Windurst Walls','Port Windurst',
    'Windurst Woods','Heavens Tower','Ru\'Lude Gardens','Upper Jeuno','Lower Jeuno','Port Jeuno','Rabao','Selbina','Mhaura',
    'Kazham','Norg','Mog Garden','Celennia Memorial Library','Western Adoulin','Eastern Adoulin',}
local interface = {
    debug = false,
    active = true,
    is_open = {true,},
    lastAttempt = os.time(),
    myTargetsIndex = 0,
}
local keyPressDelay = 1.0
local myIndex = 0
local myEntity = nil
local myTargetsIndex = 0
local myTargetEntity = nil


function interface.Load()
    AshitaCore:GetChatManager():QueueCommand(1, '/load thirdparty')
end

function interface.Unload()
    AshitaCore:GetChatManager():QueueCommand(1, '/unload thirdparty')
end

function interface.Render()
    local MM = AshitaCore:GetMemoryManager()
    local player = MM:GetPlayer()
    local party = MM:GetParty()
    local area = AshitaCore:GetResourceManager():GetString("zones.names", party:GetMemberZone(0))
    now = os.time()

    if not interface.active then newStart = true end


    if not area or not towns:contains(area) or player:GetIsZoning() ~= 0 then
        interface.lastAttempt = now
        interface.active = false
        newStart = true
        return
	end


    myIndex = party:GetMemberTargetIndex(0)
	myEntity = GetEntity(myIndex)
    myTargetsIndex = MM:GetTarget():GetTargetIndex(0)
    myTargetEntity = GetEntity(myTargetsIndex)


    if now - targetTime > 15 and myEntity.Status == 0 and interface.active and newStart then
        if area == 'Northern San d\'Oria' then
            MM:GetTarget():SetTarget(79, false)
            interface.DoHalbards:once(2)
        elseif area == 'Southern San d\'Oria' then
            MM:GetTarget():SetTarget(342, false)
            interface.DoFirstShield:once(2)
        end
        targetTime = now
        newStart = false
	end

end

function interface.comma_value(n) --credit--http://richard.warburton.it
    local left, num, right = string.match(n, '^([^%d]*%d)(%d*)(.-)$')
    return left .. (num:reverse():gsub('(%d%d%d)', '%1,'):reverse()) .. right
end

function interface.Message(str)
    print(chat.header('NPChelper'):append(chat.message(str)))
end

function interface.CheckInventorySlots()
    local inv = AshitaCore:GetMemoryManager():GetInventory()
	local maxInv = inv:GetContainerCountMax(0)
	local invCount = 0

	for i = 1, maxInv do
		local item = inv:GetContainerItem(0, i)
		if item and item.Id ~= 0 then
			invCount = invCount + 1
		end
	end

    if maxInv - invCount <= 0 then interface.Message("Inventory Full") end
    return maxInv - invCount
end

function interface.DoHalbards()
    if interface.CheckInventorySlots() <= 0 then return end
    if myTargetEntity and myTargetEntity.Name == "Achantere, T.K." and myTargetEntity.Distance < 35 then
        interface.KeyPress('return', keyPressDelay)
        interface.KeyPress('return', keyPressDelay*3)
        interface.KeyPress('down', keyPressDelay*3.5)
        interface.KeyPress('return', keyPressDelay*4)
        interface.KeyPress('return', keyPressDelay*5)
        interface.KeyPress('right', keyPressDelay*6)
        interface.KeyPress('return', keyPressDelay*7)
        interface.KeyPress('return', keyPressDelay*8)
        interface.KeyPress('return', keyPressDelay*9)
        interface.KeyPress('up', keyPressDelay*10)
        interface.KeyPress('return', keyPressDelay*11)
    end
end

function interface.DoFirstShield()
    if interface.CheckInventorySlots() <= 0 then return end
    if myTargetEntity and myTargetEntity.Name == "Rolandienne" and myTargetEntity.Distance < 35 then
        interface.KeyPress('return', keyPressDelay)
        interface.KeyPress('right', keyPressDelay*3)
        interface.KeyPress('right', keyPressDelay*3.5)
        interface.KeyPress('right', keyPressDelay*4)
        interface.KeyPress('up', keyPressDelay*5)
        interface.KeyPress('return', keyPressDelay*6)
        interface.KeyPress('right', keyPressDelay*7)
        interface.KeyPress('right', keyPressDelay*8)
        interface.KeyPress('right', keyPressDelay*9)
        interface.KeyPress('right', keyPressDelay*10)
        interface.KeyPress('right', keyPressDelay*11)
        interface.KeyPress('return', keyPressDelay*12)
        interface.KeyPress('right', keyPressDelay*7)
        interface.KeyPress('right', keyPressDelay*8)
        interface.KeyPress('right', keyPressDelay*9)
        interface.KeyPress('right', keyPressDelay*10)
        interface.KeyPress('right', keyPressDelay*11)
        interface.KeyPress('down', keyPressDelay*12)
        interface.KeyPress('return', keyPressDelay*12)
        interface.KeyPress('right', keyPressDelay*8)
        interface.KeyPress('right', keyPressDelay*9)
        interface.KeyPress('right', keyPressDelay*10)
        interface.KeyPress('right', keyPressDelay*11)
        interface.KeyPress('up', keyPressDelay*12)
        interface.KeyPress('return', keyPressDelay*12)
        interface.KeyPress('return', keyPressDelay*12)
        interface.KeyPress('up', keyPressDelay*12)
        interface.KeyPress('return', keyPressDelay*12)
    end
end

function interface.DoShields()
    if interface.CheckInventorySlots() <= 0 then return end

    interface.KeyPress('return', keyPressDelay*.5)
    interface.KeyPress('return', keyPressDelay)
    interface.KeyPress('up', keyPressDelay*1.5)
    interface.KeyPress('return', keyPressDelay*2)
end

function interface.DoCulverin()
    if interface.CheckInventorySlots() <= 0 then return end

    interface.KeyPress('right', keyPressDelay)
    interface.KeyPress('right', keyPressDelay*2)
    interface.KeyPress('right', keyPressDelay*3)
    interface.KeyPress('up', keyPressDelay*4)
    interface.KeyPress('return', keyPressDelay*5)
    interface.KeyPress('return', keyPressDelay*6)
    interface.KeyPress('up', keyPressDelay*7)
    interface.KeyPress('return', keyPressDelay*8)
end

function interface.KeyPress(key, time)
    if not interface.active then return end
    if interface.debug then print('Key: ' .. key .. ' Delay: ' .. time) end
    local function KeyDown()
        AshitaCore:GetChatManager():QueueCommand(1, '/sendkey ' .. key .. ' down')
        local function KeyUp()
            AshitaCore:GetChatManager():QueueCommand(1, '/sendkey ' .. key .. ' up')
        end
        KeyUp:once(.1)
    end
    KeyDown:once(time)
    interface.lastAttempt = os.time()
end


return interface