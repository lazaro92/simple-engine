#########################################
# Author: Albert Lazaro de Lara         #
#########################################


### variables ##############

CXX      := g++
OBJECTS  := Application.o CommandQueue.o Player.o SoundPlayer.o StateStack.o Command.o MusicPlayer.o State.o
LIBRARY  := -lsfml-graphics -lsfml-window -lsfml-system -lsfml-audio
CXXFLAGS := -I Include/

ifeq ($(BUILD),develop)
    CXXFLAGS += -Wall -O2 -g
else ifeq ($(BUILD),release)
    CXXFLAGS += -O2 -s -DNDEBUG
else
    CXXFLAGS += -Wall -O0 -g -D _DEBUG
endif

############################

ifneq ($(MAKECMDGOALS),clean)
    ifeq ($(BUILD),develop)
        $(info ****************** DEVELOP BUILD ********************)
    else ifeq ($(BUILD),release)
        $(info ****************** RELEASE BUILD ********************)
    else
        $(info ******************* DEBUG BUILD *********************)
    endif
endif

############################ 

output: $(OBJECTS)
	ar rc lsimple-engine.a Application.o

Application.o: Source/Application.cpp Include/Game/Application.hpp
	$(CXX) $(CXXFLAGS) -c Source/Application.cpp

CommandQueue.o: Source/Application.cpp Include/Game/CommandQueue.hpp
	$(CXX) $(CXXFLAGS) -c Source/CommandQueue.cpp

Player.o: Source/Player.cpp Include/Game/Player.hpp
	$(CXX) $(CXXFLAGS) -c Source/Player.cpp

SoundPlayer.o: Source/SoundPlayer.cpp Include/Game/SoundPlayer.hpp
	$(CXX) $(CXXFLAGS) -c Source/SoundPlayer.cpp

StateStack.o: Source/StateStack.cpp Include/Game/StateStack.hpp
	$(CXX) $(CXXFLAGS) -c Source/StateStack.cpp

Command.o: Source/Command.cpp Include/Game/Command.hpp
	$(CXX) $(CXXFLAGS) -c Source/Command.cpp

MusicPlayer.o: Source/MusicPlayer.cpp Include/Game/MusicPlayer.hpp
	$(CXX) $(CXXFLAGS) -c Source/MusicPlayer.cpp

State.o: Source/State.cpp Include/Game/State.hpp
	$(CXX) $(CXXFLAGS) -c Source/State.cpp


###################

# To prevent make from getting confused by an actual file called clean, me may use .PHONY:
# .hppe "-" in -rm causes make to continue in spite of errors from rm
.PHONY: clean
clean:
	-rm $(OBJECTS) lsimple-engine.a

