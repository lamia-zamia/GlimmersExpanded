dofile("data/scripts/lib/mod_settings.lua")

function mod_setting_bool_custom( mod_id, gui, in_main_menu, im_id, setting )
	local value = ModSettingGetNextValue( mod_setting_get_id(mod_id,setting) )
	local text = setting.ui_name .. " - " .. GameTextGet( value and "$option_on" or "$option_off" )

	if GuiButton( gui, im_id, mod_setting_group_x_offset, 0, text, 1, "data/fonts/font_pixel_runes.xml", true ) then
		ModSettingSetNextValue( mod_setting_get_id(mod_id,setting), not value, false )
	end

	mod_setting_tooltip( mod_id, gui, in_main_menu, setting )
end

function mod_setting_change_callback( mod_id, gui, in_main_menu, setting, old_value, new_value  )
	print( tostring(new_value) )
end

local mod_id = "GlimmersExpanded" -- This should match the name of your mod's folder.
mod_settings_version = 1 -- This is a magic global that can be used to migrate settings to new mod versions. call mod_settings_get_version() before mod_settings_update() to get the old value. 
mod_settings =
{
	{ -- TODO: Make this work
		id = "inject_spells",
		ui_name = "Inject Spells",
		ui_description = "If enabled, spells will be placed between vanilla spells in progress. (Currently doesn't do anything.)",
		value_default = true,
		scope = MOD_SETTING_SCOPE_RUNTIME,
        -- ui_fn = function( mod_id, gui, in_main_menu, im_id, setting )

        --     GuiLayoutBeginHorizontal(gui, 0, 0, false, 0, 0)
        --         GuiColorSetForNextWidget(gui, 1.0, 1.0, 1.0, 0.5)
        --         GuiText(gui, mod_setting_group_x_offset, 0, "Inject Spells: ")
        --         local value = ModSettingGetNextValue( mod_setting_get_id(mod_id,setting) )
        --         local lmb, rmb = GuiButton(gui, im_id, 0, 0, value and "[Yes]" or "[No]")
        --         if lmb then
        --             ModSettingSetNextValue( mod_setting_get_id(mod_id,setting), not value, false )
        --             mod_setting_handle_change_callback( mod_id, gui, in_main_menu, setting, value, not value )
        --         end
        --         if rmb then
        --             local new_value = setting.value_default or false
        --             ModSettingSetNextValue( mod_setting_get_id(mod_id,setting), new_value, false )
        --             mod_setting_handle_change_callback( mod_id, gui, in_main_menu, setting, value, new_value )
        --         end
        --         mod_setting_tooltip( mod_id, gui, in_main_menu, setting )
        --     GuiLayoutEnd(gui)

        -- end
	},
    {
        id = "default_unlock",
        ui_name = ""
    }
}