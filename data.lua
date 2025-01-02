require("prototypes/recipe")

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
    }
})
