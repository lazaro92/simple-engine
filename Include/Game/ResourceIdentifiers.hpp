#ifndef GAME_RESOURCEIDENTIFIERS_HPP
#define GAME_RESOURCEIDENTIFIERS_HPP


// Forward declaration of SFML classes
namespace sf
{
	class Texture;
	class Font;
    class SoundBuffer;
}

namespace Textures
{
	enum ID
	{
		GameSprites,
		TitleScreen,
        ButtonNormal,
        ButtonSelected,
        ButtonPressed
	};
}

namespace Fonts
{
	enum ID
	{
		Main,
	};
}

namespace Music
{
    enum ID
    {
    };
}

namespace SoundEffect
{
    enum ID
    {
    };
}

// Forward declaration and a few type definitions
template <typename Resource, typename Identifier>
class ResourceHolder;

typedef ResourceHolder<sf::Texture, Textures::ID>	TextureHolder;
typedef ResourceHolder<sf::Font, Fonts::ID>			FontHolder;
typedef ResourceHolder<sf::SoundBuffer, SoundEffect::ID>	SoundBufferHolder;

#endif // GAME_RESOURCEIDENTIFIERS_HPP
