ifeq ($(OS),Windows_NT)
    RM       = del /iq
else
    RM       = rm -f

    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
    endif
    ifeq ($(UNAME_S),Darwin)
    endif
endif

clean:
	$(RM) *.exe

all: $(wildcard *.h ext/*.h)
	g++ -I include -D MSDFGEN_STANDALONE -O2 -o msdfgen core/*.cpp lib/*.cpp ext/*.cpp main.cpp -lfreetype
