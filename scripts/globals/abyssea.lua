-----------------------------------
-- Abyssea functions, vars, tables
-- DO NOT mess with the order
-- or change things to "elseif"!
-----------------------------------

require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/utils")

tpz = tpz or {}
tpz.abyssea = tpz.abyssea or {}

tpz.abyssea.lightType =
{
    PEARL   = 1,
    AZURE   = 2,
    RUBY    = 3,
    AMBER   = 4,
    GOLDEN  = 5,
    SILVERY = 6,
    EBON    = 7,
}

-- weaponskills for red weakness
local red_weakness =
{
    --light
    37, 161, 149, 180,
    --dark
    22, 133, 98,
    --fire
    34,
    --earth
    178,
    --wind
    20, 148,
    --ice
    51,
    --thunder
    144
}

local yellow_weakness =
{
    --fire
    [0] = { 146, 147, 176, 204, 591, 321, 455 },
    --earth
    [1] = { 161, 162, 191, 210, 555, 330, 458 },
    --water
    [2] = { 171, 172, 201, 515, 336, 454 },
    --wind
    [3] = { 156, 157, 186, 208, 534, 327, 457 },
    --ice
    [4] = { 151, 152, 181, 206, 531, 324, 456 },
    --ltng
    [5] = { 166, 167, 196, 212, 644, 333, 459 },
    --light
    [6] = { 29, 30, 38, 39, 21, 112, 565, 461 },
    --dark
    [7] = { 247, 245, 231, 260, 557, 348, 460 }
}

local blue_weakness =
{
    --6-14
    {196, 197, 198, 199, 212, 213, 214, 215, 18, 23, 24, 25, 118, 119, 120},
    --14-22
    {40, 41, 42, 135, 136, 71, 72, 103, 104, 87, 88, 151, 152, 55, 56},
    --22-6
    {165, 166, 167, 168, 169, 5, 6, 7, 8, 9, 176, 181, 182, 183, 184}
}

-- returns Traverser Stone KI cap
function getMaxTravStones(player)
    local MaxTravStones = 3

    for ki = tpz.ki.VIRIDIAN_ABYSSITE_OF_AVARICE, tpz.ki.VERMILLION_ABYSSITE_OF_AVARICE do
        if player:hasKeyItem(ki) then
            MaxTravStones = MaxTravStones + 1
        end
    end

    return MaxTravStones
end

-- returns total Traverser Stone KI
-- (NOT the reserve value from currency menu)
function getTravStonesTotal(player)
    local stones = 0

    for ki = tpz.ki.TRAVERSER_STONE1, tpz.ki.TRAVERSER_STONE6 do
        if player:hasKeyItem(ki) then
            stones = stones + 1
        end
    end

    return stones
end

-- removes Traverser Stone KIs
function spendTravStones(player, spentstones)
    if (spentstones == 4) then
        if (player:hasKeyItem(tpz.ki.TRAVERSER_STONE6)) then
            spentstones = 3
            player:delKeyItem(tpz.ki.TRAVERSER_STONE6)
        elseif (player:hasKeyItem(tpz.ki.TRAVERSER_STONE5)) then
            spentstones = 3
            player:delKeyItem(tpz.ki.TRAVERSER_STONE5)
        elseif (player:hasKeyItem(tpz.ki.TRAVERSER_STONE4)) then
            spentstones = 3
            player:delKeyItem(tpz.ki.TRAVERSER_STONE4)
        elseif (player:hasKeyItem(tpz.ki.TRAVERSER_STONE3)) then
            spentstones = 3
            player:delKeyItem(tpz.ki.TRAVERSER_STONE3)
        elseif (player:hasKeyItem(tpz.ki.TRAVERSER_STONE2)) then
            spentstones = 3
            player:delKeyItem(tpz.ki.TRAVERSER_STONE2)
        elseif (player:hasKeyItem(tpz.ki.TRAVERSER_STONE1)) then
            spentstones = 3
            player:delKeyItem(tpz.ki.TRAVERSER_STONE1)
        end
    end
    if (spentstones == 3) then
        if (player:hasKeyItem(tpz.ki.TRAVERSER_STONE6)) then
            spentstones = 2
            player:delKeyItem(tpz.ki.TRAVERSER_STONE6)
        elseif (player:hasKeyItem(tpz.ki.TRAVERSER_STONE5)) then
            spentstones = 2
            player:delKeyItem(tpz.ki.TRAVERSER_STONE5)
        elseif (player:hasKeyItem(tpz.ki.TRAVERSER_STONE4)) then
            spentstones = 2
            player:delKeyItem(tpz.ki.TRAVERSER_STONE4)
        elseif (player:hasKeyItem(tpz.ki.TRAVERSER_STONE3)) then
            spentstones = 2
            player:delKeyItem(tpz.ki.TRAVERSER_STONE3)
        elseif (player:hasKeyItem(tpz.ki.TRAVERSER_STONE2)) then
            spentstones = 2
            player:delKeyItem(tpz.ki.TRAVERSER_STONE2)
        elseif (player:hasKeyItem(tpz.ki.TRAVERSER_STONE1)) then
            spentstones = 2
            player:delKeyItem(tpz.ki.TRAVERSER_STONE1)
        end
    end
    if (spentstones == 2) then
        if (player:hasKeyItem(tpz.ki.TRAVERSER_STONE6)) then
            spentstones = 1
            player:delKeyItem(tpz.ki.TRAVERSER_STONE6)
        elseif (player:hasKeyItem(tpz.ki.TRAVERSER_STONE5)) then
            spentstones = 1
            player:delKeyItem(tpz.ki.TRAVERSER_STONE5)
        elseif (player:hasKeyItem(tpz.ki.TRAVERSER_STONE4)) then
            spentstones = 1
            player:delKeyItem(tpz.ki.TRAVERSER_STONE4)
        elseif (player:hasKeyItem(tpz.ki.TRAVERSER_STONE3)) then
            spentstones = 1
            player:delKeyItem(tpz.ki.TRAVERSER_STONE3)
        elseif (player:hasKeyItem(tpz.ki.TRAVERSER_STONE2)) then
            spentstones = 1
            player:delKeyItem(tpz.ki.TRAVERSER_STONE2)
        elseif (player:hasKeyItem(tpz.ki.TRAVERSER_STONE1)) then
            spentstones = 1
            player:delKeyItem(tpz.ki.TRAVERSER_STONE1)
        end
    end
    if (spentstones == 1) then
        if (player:hasKeyItem(tpz.ki.TRAVERSER_STONE6)) then
            player:delKeyItem(tpz.ki.TRAVERSER_STONE6)
        elseif (player:hasKeyItem(tpz.ki.TRAVERSER_STONE5)) then
            player:delKeyItem(tpz.ki.TRAVERSER_STONE5)
        elseif (player:hasKeyItem(tpz.ki.TRAVERSER_STONE4)) then
            player:delKeyItem(tpz.ki.TRAVERSER_STONE4)
        elseif (player:hasKeyItem(tpz.ki.TRAVERSER_STONE3)) then
            player:delKeyItem(tpz.ki.TRAVERSER_STONE3)
        elseif (player:hasKeyItem(tpz.ki.TRAVERSER_STONE2)) then
            player:delKeyItem(tpz.ki.TRAVERSER_STONE2)
        elseif (player:hasKeyItem(tpz.ki.TRAVERSER_STONE1)) then
            player:delKeyItem(tpz.ki.TRAVERSER_STONE1)
        end
    end
end

-- returns total "Abyssite of <thing>"
function getAbyssiteTotal(player, abyssite)
    local SOJOURN = 0
    local FURTHERANCE = 0
    local MERIT = 0
    if abyssite == "SOJOURN" then
        for ki = tpz.ki.IVORY_ABYSSITE_OF_SOJOURN, tpz.ki.EMERALD_ABYSSITE_OF_SOJOURN do
            if player:hasKeyItem(ki) then
                SOJOURN = SOJOURN + 1
            end
        end
        return SOJOURN
    elseif abyssite == "FURTHERANCE" then
        for ki = tpz.ki.SCARLET_ABYSSITE_OF_FURTHERANCE, tpz.ki.IVORY_ABYSSITE_OF_FURTHERANCE do
            if player:hasKeyItem(ki) then
                FURTHERANCE = FURTHERANCE + 1
            end
        end
        return FURTHERANCE
    elseif abyssite == "MERIT" then
        for ki = tpz.ki.AZURE_ABYSSITE_OF_MERIT, tpz.ki.INDIGO_ABYSSITE_OF_MERIT do
            if player:hasKeyItem(ki) then
                MERIT = MERIT + 1
            end
        end
        return MERIT
    end
end

-- returns total value of Demulune KeyItems
function getDemiluneAbyssite(player)
    local Demilune = 0
    -- Todo: change this into proper bitmask
    if (player:hasKeyItem(tpz.ki.CLEAR_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 1
    end
    if (player:hasKeyItem(tpz.ki.COLORFUL_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 2
    end
    if (player:hasKeyItem(tpz.ki.SCARLET_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 4
    end
    if (player:hasKeyItem(tpz.ki.AZURE_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 8
    end
    if (player:hasKeyItem(tpz.ki.VIRIDIAN_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 16
    end
    if (player:hasKeyItem(tpz.ki.JADE_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 32
    end
    if (player:hasKeyItem(tpz.ki.SAPPHIRE_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 64
    end
    if (player:hasKeyItem(tpz.ki.CRIMSON_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 128
    end
    if (player:hasKeyItem(tpz.ki.EMERALD_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 256
    end
    if (player:hasKeyItem(tpz.ki.VERMILLION_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 512
    end
    if (player:hasKeyItem(tpz.ki.INDIGO_DEMILUNE_ABYSSITE)) then
        Demilune = Demilune + 1024
    end
    return Demilune
end

function getNewYellowWeakness(mob)
    local day = VanadielDayElement()
    local weakness = math.random(day-1, day+1)
    if weakness < 0 then weakness = 7 elseif weakness > 7 then weakness = 0 end
    return yellow_weakness[weakness][math.random(#yellow_weakness[weakness])]
end

function getNewRedWeakness(mob)
    return red_weakness[math.random(#red_weakness)]
end

function getNewBlueWeakness(mob)
    local time = VanadielHour()
    local table = 3
    if time >= 6 and time < 14 then
        table = 1
    elseif time >= 14 and time < 22 then
        table = 2
    end
    return blue_weakness[table][math.random(#blue_weakness[table])]
end

-- [ZoneID] = {Required Trades Event, Has Key Items Event, Missing Key Item Event}
local POP_EVENTS =
{
    [15]  = {1010, 1020, 1021}, -- Abyssea-Konschtat
    [45]  = {1010, 1020, 1021}, -- Abyssea-Tahrongi
    [132] = {1010, 1020, 1021}, -- Abyssea-La Theine
    [215] = {1010, 1022, 1023}, -- Abyssea-Attohwa
    [216] = {1010, 1022, 1021}, -- Abyssea-Misareaux
    [217] = {1010, 1015, 1120}, -- Abyssea-Vunkerl
    [218] = {1010, 1020, 1021}, -- Abyssea-Altepa
    [253] = {1010, 1020, 1025}, -- Abyssea-Uleguerand
    [254] = {1010, 1020, 1021}, -- Abyssea-Grauberg
    [255] = {1010, 1020, 1021}, -- Abyssea-Empyreal Paradox
}

function abysseaOnTrade(player,npc,trade)
    -- validate QM pop data
    local zoneId = player:getZoneID()
    local pop = zones[zoneId].npc.QM_POPS[npc:getID()]
    if (pop == nil) then
        return false
    end

    -- validate trade-to-pop
    local reqTrade = pop[2]
    if (#reqTrade == 0 or trade:getItemCount() ~= #reqTrade) then
        return false
    end

    -- validate traded items
    for k, v in pairs(reqTrade) do
        if (not trade:hasItemQty(v,1)) then
            return false
        end
    end

    -- validate nm status
    local nm = pop[4]
    if (GetMobByID(nm):isSpawned()) then
        return false
    end

    -- complete trade and pop nm
    player:tradeComplete()
    local dx = player:getXPos() + math.random(-1,1)
    local dy = player:getYPos()
    local dz = player:getZPos() + math.random(-1,1)
    GetMobByID(nm):setSpawn(dx,dy,dz)
    SpawnMob(nm):updateClaim(player)
    return true
end

function abysseaOnTrigger(player,npc)
    -- validate QM pop data
    local zoneId = player:getZoneID()
    local events = POP_EVENTS[zoneId]
    local pop = zones[zoneId].npc.QM_POPS[npc:getID()]
    if (pop == nil) then
        return false
    end

    -- validate nm status
    local nm = pop[4]
    if (GetMobByID(nm):isSpawned()) then
        return false
    end

    -- validate trade-to-pop
    local t = pop[2]
    if (#t > 0) then
        for i = 1, 8, 1 do
            if (t[i] == nil) then
                t[i] = 0
            end
        end
        player:startEvent(events[1],t[1],t[2],t[3],t[4],t[5],t[6],t[7],t[8]) -- report required trades
        return true
    end

    -- validate ki-to-pop
    local kis = pop[3]
    if (#kis == 0) then
        return false
    end

    -- validate kis
    local validKis = true
    for k, v in pairs(kis) do
        if (not player:hasKeyItem(v)) then
            validKis = false
            break
        end
    end

    -- infill kis
    for i = 1, 8, 1 do
        if (kis[i] == nil) then
            kis[i] = 0
        end
    end

    -- start event
    if (validKis) then
        player:setLocalVar("abysseaQM", npc:getID())
        player:startEvent(events[2],kis[1],kis[2],kis[3],kis[4],kis[5],kis[6],kis[7],kis[8]) -- player has all key items
        return true
    else
        player:startEvent(events[3],kis[1],kis[2],kis[3],kis[4],kis[5],kis[6],kis[7],kis[8]) -- player is missing key items
        return false
    end
end

function abysseaOnEventUpdate(player,csid,option)
    return false
end

function abysseaOnEventFinish(player,csid,option)
    local zoneId = player:getZoneID()
    local events = POP_EVENTS[zoneId]
    local pop = zones[zoneId].npc.QM_POPS[player:getLocalVar("abysseaQM")]
    player:setLocalVar("abysseaQM", 0)
    if (pop == nil) then
        return false
    end

    if (csid == events[2] and option == 1) then
        -- delete kis
        local kis = pop[3]
        for k, v in pairs(kis) do
            if (player:hasKeyItem(v)) then
                player:delKeyItem(v)
            end
        end

        -- pop nm
        local nm = pop[4]
        local dx = player:getXPos() + math.random(-1,1)
        local dy = player:getYPos()
        local dz = player:getZPos() + math.random(-1,1)
        GetMobByID(nm):setSpawn(dx,dy,dz)
        SpawnMob(nm):updateClaim(player)
        return true
    end
end

local abyssea_zones =
{
    15, -- ABYSSEA_KONSCHTAT
    45, -- ABYSSEA_TAHRONGI
    132,-- ABYSSEA_LA_THEINE
    215,-- ABYSSEA_ATTOHWA
    216,-- ABYSSEA_MISAREAUX
    217,-- ABYSSEA_VUNKERL
    218,-- ABYSSEA_ALTEPA
    253,-- ABYSSEA_ULEGUERAND
    254 -- ABYSSEA_GRAUBERG
    --255 -- ABYSSEA_EMPYREAL_PARADOX
}

function isInAbysseaZone(player)
    for index, zone in ipairs(abyssea_zones) do
        if zone == player:getZoneID() then
            return true
        end
    end
    return false
end

function ResetPlayerLights(player)
    player:setCharVar("pearlLight", 0 + ABYSSEA_BONUSLIGHT_AMOUNT)
    player:setCharVar("azureLight", 0 + ABYSSEA_BONUSLIGHT_AMOUNT)
    player:setCharVar("rubyLight",  0 + ABYSSEA_BONUSLIGHT_AMOUNT)
    player:setCharVar("amberLight", 0 + ABYSSEA_BONUSLIGHT_AMOUNT)
    player:setCharVar("goldLight",  0 + ABYSSEA_BONUSLIGHT_AMOUNT)
    player:setCharVar("silverLight",0 + ABYSSEA_BONUSLIGHT_AMOUNT)
    player:setCharVar("ebonLight",  0 + ABYSSEA_BONUSLIGHT_AMOUNT)
end

function AddPlayerLights(player, light, amount)
    local zoneId = player:getZoneID()
    local ID = zones[zoneId]

    local tiermsg     = 0
    local lightamount = amount or 0
    local pearl       = player:getCharVar("pearlLight")
    local azure       = player:getCharVar("azureLight")
    local ruby        = player:getCharVar("rubyLight")
    local amber       = player:getCharVar("amberLight")
    local gold        = player:getCharVar("goldLight")
    local silver      = player:getCharVar("silverLight")
    local ebon        = player:getCharVar("ebonLight")

    --printf("light amount = %s", tostring(lightamount))

    if lightamount <= 8 then
        tiermsg = 0
    elseif lightamount > 8 and lightamount <= 16 then
        tiermsg = 1
    elseif lightamount > 16 and lightamount <= 32 then
        tiermsg = 2
    elseif lightamount > 32 and lightamount <= 64 then
        tiermsg = 3
    elseif lightamount > 64 then
        tiermsg = 4
    end

    if light == 1 or light == 5 or light == 6 or light == 7 then
        if tiermsg > 2 then
            tiermsg = 2
        end
    end
    -------------------------------------------------------------------------------------
    -- lights: 1: pearl, 2: azure, 3: ruby, 4: amber, 5: gold, 6: silver, 7: ebon
    -------------------------------------------------------------------------------------
    if light == 1 then
        if pearl + lightamount > 230 then
            player:setCharVar("pearlLight",230)
        else
            player:setCharVar("pearlLight",pearl + lightamount)
        end

        player:messageSpecial(ID.text.BODY_EMITS_PEARL_LIGHT,tiermsg)
    elseif light == 2 then
        if azure + lightamount > 255 then
            player:setCharVar("azureLight",255)
        else
            player:setCharVar("azureLight",azure + lightamount)
        end

        player:messageSpecial(ID.text.BODY_EMITS_AZURE_LIGHT,tiermsg)
    elseif light == 3 then
        if ruby + lightamount > 255 then
            player:setCharVar("rubyLight",255)
        else
            player:setCharVar("rubyLight",ruby + lightamount)
        end

        player:messageSpecial(ID.text.BODY_EMITS_RUBY_LIGHT,tiermsg)
    elseif light == 4 then
        if amber + lightamount > 255 then
            player:setCharVar("amberLight",255)
        else
            player:setCharVar("amberLight",amber + lightamount)
        end

        player:messageSpecial(ID.text.BODY_EMITS_AMBER_LIGHT,tiermsg)
    elseif light == 5 then
        if gold + lightamount > 200 then
            player:setCharVar("goldLight",200)
        else
            player:setCharVar("goldLight",gold + lightamount)
        end

        player:messageSpecial(ID.text.BODY_EMITS_GOLDEN_LIGHT,tiermsg)
    elseif light == 6 then
        if silver + lightamount > 200 then
            player:setCharVar("silverLight",200)
        else
            player:setCharVar("silverLight",silver + lightamount)
        end

        player:messageSpecial(ID.text.BODY_EMITS_SILVERY_LIGHT,tiermsg)
    elseif light == 7 then
        if ebon + lightamount > 200 then
            player:setCharVar("ebonLight",200)
        else
            player:setCharVar("ebonLight",ebon + lightamount)
        end

        player:messageSpecial(ID.text.BODY_EMITS_EBON_LIGHT,tiermsg)
    end
end

function GetAbysseaStats(player)
    local zoneId = player:getZoneID()
    local ID = zones[zoneId]

    if isInAbysseaZone(player) then
        local pearl  = player:getCharVar("pearlLight")
        local azure  = player:getCharVar("azureLight")
        local ruby   = player:getCharVar("rubyLight")
        local amber  = player:getCharVar("amberLight")
        local gold   = player:getCharVar("goldLight")
        local silver = player:getCharVar("silverLight")
        local ebon   = player:getCharVar("ebonLight")

        player:messageSpecial(ID.text.LIGHTS_MESSAGE_1, pearl, ebon, gold, silver)
        player:messageSpecial(ID.text.LIGHTS_MESSAGE_2, azure, ruby, amber)
    end
end

function DropLights(player, lightColor, lightAmount, preferredLight)
    local dropLight = 0
    local usePreferred = math.random() * 100

    if lightColor == 0 then
        if usePreferred > 70 then
            dropLight = preferredLight
        else
            dropLight = math.random(5, 6)
        end
    else
        dropLight = lightColor
    end

    local party = {}
    party = player:getAlliance()
    for _,member in ipairs(party) do
        if player:getZoneID() == player:getZoneID() then
            AddPlayerLights(player, dropLight, lightAmount)
        end
    end
end

function canEnterAbyssea(player)
    if player:getCharVar("lastEnteredAbyssea") <= os.time() and player:getQuestStatus(ABYSSEA, tpz.quest.id.abyssea.THE_TRUTH_BECKONS) >= QUEST_ACCEPTED and player:getMainLvl() >= 65 then
        player:PrintToPlayer("If you have a Dedication effect from an experience ring, it will wear off upon entering Abyssea.", tpz.msg.channel.SYSTEM_3)
        return true
    end

    local lastEnterTable = {0,0,0}
    lastEnterTable = utils.convertTimeDescending(os.time() - player:getCharVar("lastEnteredAbyssea"))

    if player:getCharVar("lastEnteredAbyssea") ~= 0 then
        player:PrintToPlayer("You must wait " ..lastEnterTable[1].. " hours, " ..lastEnterTable[2].. " minutes, and " ..lastEnterTable[3].. " seconds before you can enter Abyssea again.", tpz.msg.channel.SYSTEM_3)
    end

    return false
end