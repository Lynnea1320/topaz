require("scripts/globals/moblights")
require("scripts/globals/abyssea")
require("scripts/globals/mixins")
require("scripts/globals/status")

g_mixins = g_mixins or {}

---------------------------------------------------------
-- Drops Lights
---------------------------------------------------------
g_mixins.drop_lights = function(mob)
    mob:addListener("MAGIC_TAKE", "ABYSSEA_MAGIC_DEATH_CHECK", function(target, caster, spell)
        if target:getHP() <= 0 then
            DropLights(caster, target:getName(), "magical", target)
            target:removeListener("ABYSSEA_DEATH_NO_ACTION")
            target:removeListener("ABYSSEA_MAGIC_DEATH_CHECK")
            target:removeListener("ABYSSEA_WS_DEATH_CHECK")
            target:removeListener("ABYSSEA_ABILITY_DEATH_CHECK")
            target:removeListener("ABYSSEA_PHYSICAL_DEATH_CHECK")
        end 
    end)

    mob:addListener("WEAPONSKILL_TAKE", "ABYSSEA_WS_DEATH_CHECK", function(target, user, wsid)
        local magicalWS =
        {
            19,20,30,33,34,36,37,47,50,51,58,74,76,97,98,107,113,114,130,
            131,132,133,139,146,147,148,149,160,161,172,177,178,179,180,
            186,187,188,189,192,208,217,218,220,
        }

        local wsType = "ws_physical"

        if target:getHP() <= 0 then
            for i = 1, #magicalWS do
                if wsid == magicalWS[i] then
                    wsType = "ws_magical"
                    break
                end
            end
            DropLights(user, target:getName(), wsType, target)
            target:removeListener("ABYSSEA_DEATH_NO_ACTION")
            target:removeListener("ABYSSEA_MAGIC_DEATH_CHECK")
            target:removeListener("ABYSSEA_WS_DEATH_CHECK")
            target:removeListener("ABYSSEA_ABILITY_DEATH_CHECK")
            target:removeListener("ABYSSEA_PHYSICAL_DEATH_CHECK")
        end 
    end)

    mob:addListener("ABILITY_TAKE", "ABYSSEA_ABILITY_DEATH_CHECK", function(mob, user, ability, action)
        if mob:getHP() <= 0 then
            DropLights(user, mob:getName(), "physical", mob)
            mob:removeListener("ABYSSEA_DEATH_NO_ACTION")
            mob:removeListener("ABYSSEA_MAGIC_DEATH_CHECK")
            mob:removeListener("ABYSSEA_WS_DEATH_CHECK")
            mob:removeListener("ABYSSEA_ABILITY_DEATH_CHECK")
            mob:removeListener("ABYSSEA_PHYSICAL_DEATH_CHECK")
        end
    end)

    mob:addListener("ATTACKED", "ABYSSEA_PHYSICAL_DEATH_CHECK", function(target, attacker)
        if target:getHP() <= 0 then
            DropLights(attacker, target:getName(), "physical", target)
            target:removeListener("ABYSSEA_DEATH_NO_ACTION")
            target:removeListener("ABYSSEA_MAGIC_DEATH_CHECK")
            target:removeListener("ABYSSEA_WS_DEATH_CHECK")
            target:removeListener("ABYSSEA_ABILITY_DEATH_CHECK")
            target:removeListener("ABYSSEA_PHYSICAL_DEATH_CHECK")
        end
    end)

    mob:addListener("DEATH", "ABYSSEA_DEATH_NO_ACTION", function(mob, player, isKiller)
        DropLights(player, mob:getName(), "physical", mob)
        mob:removeListener("ABYSSEA_MAGIC_DEATH_CHECK")
        mob:removeListener("ABYSSEA_WS_DEATH_CHECK")
        mob:removeListener("ABYSSEA_ABILITY_DEATH_CHECK")
        mob:removeListener("ABYSSEA_PHYSICAL_DEATH_CHECK")
    end)
end

return g_mixins.drop_lights