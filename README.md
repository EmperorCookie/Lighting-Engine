# Lighting Engine

Lighting Engine is a surface based lighting engine that uses sprite lights and supports both static and dynamic shadows.

Since surfaces are a base feature of GameMaker:Studio, this engine should be supported on every target.

### Using the engine

1. Call `light_system_init()` before anything else
2. Add shadow casters and light
 * Note that static lights will not render any shadow casters that were added after the light was created
3. Render the system in the `draw_end` event of an object using `light_system_draw(ambiant_light_color)`
 * It is also possible to render the system using additive mode using `light_system_draw_add(ambiant_light_color)`
4. Draw your game as you normally would

### Contributing

The project is open to contributions. Please use GitFlow.

Note that this project is intended to be released on the YYG Marketplace, so the license will be their EULA.
