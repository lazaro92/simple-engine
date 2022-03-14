#ifndef GAME_APPLICATION_HPP
#define GAME_APPLICATION_HPP

#include "Game/ResourceHolder.hpp"
#include "Game/ResourceIdentifiers.hpp"
#include "Game/Player.hpp"
#include "Game/StateStack.hpp"
#include "Game/MusicPlayer.hpp"
#include "Game/SoundPlayer.hpp"

#include <SFML/System/Time.hpp>
#include <SFML/Graphics/RenderWindow.hpp>
#include <SFML/Graphics/Text.hpp>

/**
* Class that contains the main loop, initializes the state stack, the different resource
* holders and the player and insert the first state to the stack.
*/
class Application
{
	public:
								Application();
		void					run();
		

	private:
		void					processInput();
		void					update(sf::Time dt);
		void					render();

        #if _DEBUG
		void					updateStatistics(sf::Time dt);
        #endif
		void					registerStates();


	private:
		static const sf::Time	TimePerFrame;

		sf::RenderWindow		mWindow;
		TextureHolder			mTextures;
	  	FontHolder				mFonts;
		Player					mPlayer;

        MusicPlayer             mMusic;
        SoundPlayer             mSounds;
		StateStack				mStateStack;

        #if _DEBUG
		sf::Text				mStatisticsText;
        #endif
		sf::Time				mStatisticsUpdateTime;
		std::size_t				mStatisticsNumFrames;
};

#endif // GAME_APPLICATION_HPP
