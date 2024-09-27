---@meta 'noitapatcher'
---@module noitapatcher

error("This file just contains function signatures for documentation and code-completion. You're not supposed to actually run this file.")

---@class NoitaPatcher
local noitapatcher = {}

---Enable OnProjectileFired and OnProjectileFiredPost callbacks.
---@return nil
function noitapatcher.InstallShootProjectileFiredCallbacks() end

---Enables GetDamageDetails in newly created Lua states.
---@return nil
function noitapatcher.InstallDamageDetailsPatch() end

---@class DamageDetails
---@field damage_types integer
---@field ragdoll_fx integer
---@field impulse [integer, integer]
---@field world_pos [integer, integer]
---@field knockback_force number
---@field blood_multiplier number
---@field projectile_thats_responsible integer
---@field description string

---Get more info about damage inside a LuaComponent damage callback.
---You must have previously called np.InstallDamageDetailsPatch for this to work.
---@return DamageDetails
function GetDamageDetails() end

---Sets Noita's internal RNG state to the specified value.
---This RNG state is used for many things including setting a fired projectile's
---direction based on random spread.
---@param rng_value integer New RNG state value
function noitapatcher.SetProjectileSpreadRNG(rng_value) end

---Disable the red flash upon taking damage for all entities with a PlatformShooterPlayerComponent except for the one specified by entity_id.
---You can restore the original behaviour by passing in -1 for the entity_id.
---@param entity_id integer ID of the only entity for which to do the damage flash.
function noitapatcher.RegisterPlayerEntityId(entity_id) end

---Change the item that the entity is holding.
---@param entity_id integer id of the entity for which you want to change what they are holding.
---@param item_id integer id of the entity that should be held. For the best effect it should be an item in the inventory_quick child of the entity specified by entity_id.
---@param unknown boolean Not sure what this does. Let me know if you find out!
---@param make_noise boolean Whether or not switching to this item should make a noise.
function noitapatcher.SetActiveHeldEntity(entity_id, item_id, unknown, make_noise) end

---Changes the entity that the game considers to be the player.
---This determines what entity is followed by the camera and whose death ends the game.
---A bunch more stuff is probably tied to this.
---@param entity_id integer The entity to make the game think of as the player.
---@param player_nr integer? Player number to change. Defaults to 0
function noitapatcher.SetPlayerEntity(entity_id, player_nr) end

---Get the entity that the game considers to be the player.
---@param player_nr integer? Player number to get the entity of. Defaults to 0
function noitapatcher.GetPlayerEntity(player_nr) end

---Enables or disables game simulate pausing when opening escape or wand menu.
---@param enabled boolean Whether to enable or disable pausing.
function noitapatcher.EnableGameSimulatePausing(enabled) end

---Disable InventoryGuiComponent updates without disabling the component.
---Disabling updates for this component makes clicking on an empty wand slot work
---after using EnableGameSimulatePausing(false) and entering the wand pickup menu.
---@param enabled boolean Whether to enable or disable Inventory GUI updates.
function noitapatcher.EnableInventoryGuiUpdate(enabled) end

---Enable/disable ItemPickUpperComponent updates for the entity registerd using RegisterPlayerEntityId
---Disabling updates for this component prevents double wand cards from appearing
---after using EnableGameSimulatePausing(false) and entering the wand pickup menu.
---@param enabled boolean Whether to enable or disable ItemPickUpper updates.
function noitapatcher.EnablePlayerItemPickUpper(enabled) end

---Send a 'use item' message causing the item to get activated by the entity's ability component.
---@param responsible_entity_id integer Entity that should be seen as responsible for the item's use.
---@param item_entity_id integer Wand or other item entity.
---@param ignore_reload boolean
---@param charge boolean
---@param started_using_this_frame boolean
---@param pos_x number
---@param pos_y number
---@param target_x number
---@param target_y number
function noitapatcher.UseItem(responsible_entity_id, item_entity_id, ignore_reload, charge, started_using_this_frame, pos_x, pos_y, target_x, target_y) end

---Patch out logging for a certain string literal.
---@param logstr string The string to look for in the exe, it should end with a newline character in most cases.
---@return boolean patch_successful
function noitapatcher.SilenceLogs(logstr) end

---Like Noita's LoadPixelScene, but doesn't care if the scene has been loaded before.
---@param materials_filename string
---@param colors_filename string
---@param x number
---@param y number
---@param background_file string
---@param skip_biome_checks boolean Defaults to false
---@param skip_edge_textures boolean Defaults to false
---@param color_to_material_table table Defaults to {}
---@param background_z_index integer Defaults to 50
function noitapatcher.ForceLoadPixelScene(materials_filename, colors_filename, x, y, background_file, skip_biome_checks, skip_edge_textures, color_to_material_table, background_z_index) end

---Enable source location logging
---@param enable boolean enable or disable
function noitapatcher.EnableExtendedLogging(enable) end

---Enable the FilterLog callback
---@param enable boolean enable or disable
function noitapatcher.EnableLogFiltering(enable) end

---Disable system updates
---@param system_name string Name of the system to disable, for instance BlackHoleSystem
---@param change_to boolean enable (true) or disable (false)
---@return boolean change_succeeded
function noitapatcher.ComponentUpdatesSetEnabled(system_name, change_to) end

---Serialize an entity
---@param entity_id integer
---@nodiscard
---@return string serialized_data
function noitapatcher.SerializeEntity(entity_id) end

---Deserialize an entity. If x and y are provided then the entity's position is changed to that instead of using the position info in the serialized data.
---@param entity_id integer Entity to deserialize into, most of the time you want this to be an "empty" entity.
---@param serialized_data string The serialized data
---@param x number? Position to force the entity to if provided
---@param y number? Position to force the entity to if provided
---@return integer? entity_id The entity_id passed into the function if deserialization was successful.
function noitapatcher.DeserializeEntity(entity_id, serialized_data, x, y) end

---Set box2d parameters of a PhysicsBody(2)Component
---@param component_id integer The PhysicsBody(2)Component
---@param x number box2d x coordinate
---@param y number box2d y coordinate
---@param r number box2d rotation
---@param vx number box2d x velocity
---@param vy number box2d y velocity
---@param av number box2d angular velocity
function noitapatcher.PhysBodySetTransform(component_id, x, y, r, vx, vy, av) end

---Get the box2d parameters of a PhysicsBody(2)Component
---@param component_id integer The PhysicsBody(2)Component
---@nodiscard
---@return number box2d x coordinate
---@return number box2d y coordinate
---@return number box2d rotation
---@return number box2d x velocity
---@return number box2d y velocity
---@return number box2d angular velocity
function noitapatcher.PhysBodyGetTransform(component_id) end

---Mark the current game mode as a daily. Disables spell unlocks and if called during mod init makes all spells available for the run.
---@param deterministic boolean
function noitapatcher.SetGameModeDeterministic(deterministic)end

---Set the current pause state bitfield.
---0, 1, 4 and >=32 are safe values to use.
---0 means unpaused, 4 is the escape menu pause, the other safe values don't have any GUI.
---@param value integer new pause state value
---@return integer previous pause state value
function noitapatcher.SetPauseState(value)end

---Set the current pause state bitfield value.
---@return integer current pause state value
function noitapatcher.GetPauseState()end

---Enable or disable inventory cursor interactions.
---@param enable boolean
function noitapatcher.SetInventoryCursorEnabled(enable)end

---Create or replace a cross call function
---@param name string
---@param f fun(...: (boolean|number|string|nil|lightuserdata)): boolean|number|string|nil|lightuserdata,boolean|number|string|nil|lightuserdata,boolean|number|string|nil|lightuserdata,boolean|number|string|nil|lightuserdata,boolean|number|string|nil|lightuserdata,boolean|number|string|nil|lightuserdata,boolean|number|string|nil|lightuserdata,boolean|number|string|nil|lightuserdata,boolean|number|string|nil|lightuserdata,boolean|number|string|nil|lightuserdata
function noitapatcher.CrossCallAdd(name, f)end

---Call a cross call function.
---Available as noitapatcher.CrossCall from init.lua and just CrossCall everywhere else.
---@param name string
---@param ... boolean|number|string|nil|lightuserdata
---@return boolean|number|string|nil|lightuserdata
---@return boolean|number|string|nil|lightuserdata
---@return boolean|number|string|nil|lightuserdata
---@return boolean|number|string|nil|lightuserdata
---@return boolean|number|string|nil|lightuserdata
---@return boolean|number|string|nil|lightuserdata
---@return boolean|number|string|nil|lightuserdata
---@return boolean|number|string|nil|lightuserdata
---@return boolean|number|string|nil|lightuserdata
---@return boolean|number|string|nil|lightuserdata
function CrossCall(name, ...)end

noitapatcher.CrossCall = CrossCall

---Get Noita version string in this format: "Noita - Build Aug 12 2024 - 21:48:01"
---@nodiscard
---@return string
function noitapatcher.GetVersionString() end

---Change a magic number
---@param name string
---@param value boolean|integer|number
function noitapatcher.MagicNumbersSetValue(name, value) end

---@class MagicNumListEntry
---@field name string
---@field address integer
---@field type "bool" | "int" | "uint" | "float" | "double" | "string" | "unknown"

---@nodiscard
---@return MagicNumListEntry[]
function noitapatcher.MagicNumbersGetList() end

---@return integer
function noitapatcher.GetGameModeNr() end

---@return integer
function noitapatcher.GetGameModeCount() end

---@param idx integer?
---@return string
function noitapatcher.GetGameModeCount(idx) end

---Discard and then reload all material files.
---You should call ComponentSetValue(world_state, "changed_materials", "") after calling this.
function noitapatcher.ReloadMaterials() end

---@param component_id integer
---@nodiscard
---@return integer
function noitapatcher.GetComponentAddress(component_id) end

---@param entity_id integer
---@nodiscard
---@return integer
function noitapatcher.GetEntityAddress(entity_id) end

return noitapatcher
