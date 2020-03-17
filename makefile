SRC= src/main.cpp src/combat.cpp src/inventory.cpp src/room.cpp
OBJ= $(SRC:.cpp=.o)
HEADERS= headers/combat.h headers/inventory.h
CPP= g++
CPPFLAGS= -g -Wall -std=gnu++11

obj/combat.o: src/combat.cpp $(HEADERS)
	$(CPP) $(CPPFLAGS) -o $@ src/combat.cpp -I/headers $(HEADERS)

obj/inventory.o: src/inventory.cpp headers/inventory.h
	$(CPP) $(CPPFLAGS) -o $@ src/inventory.cpp -I/headers inventory.h

obj/room.o: src/room.cpp
	$(CPP) $(CPPFLAGS) -o $@ src/room.cpp

obj/main.o: src/main.cpp 
	$(CPP) $(CPPFLAGS) -o $@ src/main.cpp
	
game : $(OBJ) 
	$(CPP) $(CPPFLAGS) -o $@ $(OBJ)

clean : 
	rm -f obj/* game
