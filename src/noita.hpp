#ifndef NP_NOITA_HPP
#define NP_NOITA_HPP

struct vec2 {
    float x;
    float y;
};

struct Entity {
    int EntityId;
};

// Note: It's really a mix between __fastcall (uses registers) and
// __cdecl (stack cleanup is done by caller).
using fire_wand_function_t = void(__fastcall*)(
    Entity* shooter, Entity* verlet_parent,
    const vec2& position,
    Entity* projectile,
    int unknown1, int unknown2, char unknown3,
    bool send_message,
    float target_x, float target_y);

#endif // Header guard
