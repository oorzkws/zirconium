-- Enriched Titanium for Krastorio2
local util = require("__bzzirconium__.data-util");

if mods["Krastorio2"] then
data:extend({
  {
    type = "item",
    name = "enriched-zircon",
    icon_size = 128,
    icon = "__bzzirconium__/graphics/icons/enriched-zircon.png",
      pictures = {
        {filename="__bzzirconium__/graphics/icons/enriched-zircon.png", size=128, scale=0.25},
        {filename="__bzzirconium__/graphics/icons/enriched-zircon-2.png", size=128, scale=0.25},
        {filename="__bzzirconium__/graphics/icons/enriched-zircon-3.png", size=128, scale=0.25},
        {filename="__bzzirconium__/graphics/icons/enriched-zircon-4.png", size=128, scale=0.25},
      },
    subgroup = "raw-material",
    order = "e05-a[enriched-ores]-a1[enriched-zircon]",
    stack_size = util.get_stack_size(100),
  },
  {
    type = "recipe",
    name = "enriched-zircon",
    icon = "__bzzirconium__/graphics/icons/enriched-zircon.png",
    icon_size = 128,
    category = "chemistry",
    energy_required = 3,
    enabled = false,
    always_show_made_in = true,
    always_show_products = true,
    allow_productivity = true,
    ingredients =
    {
      {type = "fluid", name = "sulfuric-acid", amount = 10},
      {type = "fluid", name = "water", amount = 25, catalyst_amount = 25},
      {type = "item",  name = "zircon", amount = 9}
    },
    results =
    { 
      {type = "item",  name = "enriched-zircon", amount = 6},
      {type = "fluid", name = "dirty-water", amount = 25, catalyst_amount = 25}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.721, g = 0.525, b = 0.043, a = 0.000},
      secondary = {r = 0.200, g = 0.680, b = 0.300, a = 0.357},
      tertiary = {r = 0.690, g = 0.768, b = 0.870, a = 0.000}, 
      quaternary = {r = 0.0, g = 0.980, b = 0.603, a = 0.900}
    },
    subgroup = "raw-material",
    order = "e03[enriched-zircon]"
  },
  {
      type = "recipe",
      name = "enriched-zirconia-smelting",
      icons =
      {
        { icon = "__bzzirconium__/graphics/icons/zirconia.png", icon_size = 128, icon_mipmaps = 3, },
        { icon = "__bzzirconium__/graphics/icons/enriched-zircon.png", icon_size = 128, scale=0.125, shift= {-8, -8}},
      },
      category = "smelting",
      energy_required = 24,
      enabled = false,
      always_show_made_in = true,
      always_show_products = true,
      allow_productivity = true,
      ingredients = 
      {
        {"enriched-zircon", 5}
      },
      result = "zirconia",
      result_count = 10,
      order = "z[zirconia]-z[enriched-zirconia]"
  },	
	{
		type = "recipe",
		name = "dirty-water-filtration-zircon",
		category = "fluid-filtration",
		icons =
		{
			{
				icon = data.raw.fluid["dirty-water"].icon,
				icon_size = data.raw.fluid["dirty-water"].icon_size
			},
			{
				icon = data.raw.item["zircon"].icon,
				icon_size =	data.raw.item["zircon"].icon_size,
				scale = 0.20 * (data.raw.fluid["dirty-water"].icon_size/data.raw.item["zircon"].icon_size),
				shift = {0, 4}
			}
		},
		-- icon_size = data.raw.fluid["dirty-water"].icon_size,
		energy_required = 2,
		enabled = false,
		allow_as_intermediate = false,
		always_show_made_in = true,
		always_show_products = true,
		ingredients =
		{
			{type = "fluid", name = "dirty-water", amount = 100, catalyst_amount = 100},
		},
		results =
		{
			{type = "fluid", name = "water", amount = 100, catalyst_amount = 100},
			{type = "item",  name = "stone", probability = 0.20, amount = 1},
			{type = "item",  name = "zircon", probability = 0.20, amount = 1},
      mods.bztitanium and
      {type = "item",  name = "titanium-ore", probability = 0.20, amount = 1} or nil,
		},
		crafting_machine_tint =
		{
			primary = {r = 0.60, g = 0.20, b = 0, a = 0.6},
			secondary = {r = 1.0, g = 0.843, b = 0.0, a = 0.9}
		},
		subgroup = "raw-material",
		order = "w013[dirty-water-filtration-zircon]"
	}
}
)
util.add_effect("kr-enriched-ores", { type = "unlock-recipe", recipe = "enriched-zircon" })
util.add_effect("kr-enriched-ores", { type = "unlock-recipe", recipe = "enriched-zirconia-smelting" })
util.add_effect("kr-enriched-ores", { type = "unlock-recipe", recipe = "dirty-water-filtration-zircon" })
end
