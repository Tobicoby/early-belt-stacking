require("prototypes/recipe")

--From notnotmelon
local INFINITY_ROUNDED_DOWN = 250
local STACKINSERTERMODS = {"space-age", "stack-inserters"}

data.raw["utility-constants"].default.max_belt_stack_size             = INFINITY_ROUNDED_DOWN
data.raw["utility-constants"].default.inserter_hand_stack_max_sprites = INFINITY_ROUNDED_DOWN

local HAS_STACK_INSERTER_MOD = false
for _, mod in ipairs(STACKINSERTERMODS) do
    if mods[mod] ~= nil then
        HAS_STACK_INSERTER_MOD = true
        break
    end
end

if not HAS_STACK_INSERTER_MOD then
    error("Custom crash message: Required stack inserter mod not found. Please install one of the following mods: " .. table.concat(STACKINSERTERMODS, ", "))
end
--From notnotmelon

data:extend(
{
    {
        type = "technology",
        name = "stack-inserter",
        icon = "__space-age__/graphics/technology/stack-inserter.png",
        icon_size = 256,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "stack-inserter"
            },
            {
                type = "belt-stack-size-bonus",
                modifier = 1
            }
        },
        prerequisites = {
            "space-science-pack",
            "production-science-pack",
            "utility-science-pack",
            "chemical-science-pack",
            "bulk-inserter"
        },
        unit = {
                count = 2000,
                ingredients =
            {
                {"automation-science-pack",   1},
                {"logistic-science-pack",     1},
                {"chemical-science-pack",     1},
                {"production-science-pack",   1},
                {"utility-science-pack",      1},
                {"space-science-pack",        1}
            },
            time = 60
        }
    },

    {
        type = "technology",
        name = "transport-belt-capacity-1",
        localised_description = {"technology-description.belt-capacity"},
        icons = util.technology_icon_constant_stack_size("__space-age__/graphics/technology/transport-belt-capacity.png"),
        effects =
        {
            {
                type = "belt-stack-size-bonus",
                modifier = 1
            }
        },
        prerequisites = {"stack-inserter"},
        unit =
        {
            count = 2000,
            ingredients =
            {
                {"automation-science-pack",      1},
                {"logistic-science-pack",        1},
                {"chemical-science-pack",        1},
                {"production-science-pack",      1},
                {"utility-science-pack",         1},
                {"space-science-pack",           1}
            },
            time = 60
        },
        upgrade = true
    },
    {
        type = "technology",
        name = "transport-belt-capacity-2",
        localised_description = {"technology-description.belt-capacity"},
        icons = util.technology_icon_constant_stack_size("__space-age__/graphics/technology/transport-belt-capacity.png"),
        effects =
        {
            {
                type = "belt-stack-size-bonus",
                modifier = 1
            },
            {
                type = "inserter-stack-size-bonus",
                modifier = 1
            }
        },
        prerequisites = {"transport-belt-capacity-1"},
        unit =
        {
            count = 3000,
            ingredients =
            {
                {"automation-science-pack",      1},
                {"logistic-science-pack",        1},
                {"chemical-science-pack",        1},
                {"production-science-pack",      1},
                {"utility-science-pack",         1},
                {"space-science-pack",           1}
            },
            time = 60
        },
        upgrade = true
    },
    {
        type = "technology",
        name = "transport-belt-capacity-3",
        localised_description = {"technology-description.belt-capacity"},
        icons = util.technology_icon_constant_stack_size("__space-age__/graphics/technology/transport-belt-capacity.png"),
        effects =
        {
            {
                type = "belt-stack-size-bonus",
                modifier = 1
            },
            {
                type = "inserter-stack-size-bonus",
                modifier = 1
            }
        },
        prerequisites = {"transport-belt-capacity-2", "inserter-capacity-bonus-7"},
        unit =
        {
            count_formula = "4000*(L - 2)",
            ingredients =
            {
                {"automation-science-pack",      1},
                {"logistic-science-pack",        1},
                {"chemical-science-pack",        1},
                {"production-science-pack",      1},
                {"utility-science-pack",         1},
                {"space-science-pack",           1}
            },
            time = 60
        },
        max_level = "infinite",
        upgrade = true
    },
    {
        type = "technology",
        name = "inserter-capacity-bonus-8",
        icons = util.technology_icon_constant_stack_size("__base__/graphics/technology/inserter-capacity.png"),
        effects =
        {
            {
                type = "inserter-stack-size-bonus",
                modifier = 1 -- result of 3
            },
            {
                type = "bulk-inserter-capacity-bonus",
                modifier = 2 -- result of 12
            }
        },
        prerequisites = {"inserter-capacity-bonus-7", "space-science-pack"},
        unit =
        {
            count_formula = "4000*(L - 3)",
            ingredients =
            {
                {"automation-science-pack",      1},
                {"logistic-science-pack",        1},
                {"chemical-science-pack",        1},
                {"production-science-pack",      1},
                {"utility-science-pack",         1},
                {"space-science-pack",           1}
            },
            time = 60
        },
        max_level = "infinite",
        upgrade = true
    },
})
