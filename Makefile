ifeq ($(OS),Windows_NT)
    RM       = del /iq
    EXE      = bin/msdfgen.exe
else
    RM       = rm -f
    EXE      = bin/msdfgen

    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
    endif
    ifeq ($(UNAME_S),Darwin)
    endif
endif

.DEFAULT_GOAL := $(EXE)

clean:
	$(RM) $(EXE)

$(EXE): $(wildcard *.h ext/*.h)
	g++ -I include -D MSDFGEN_STANDALONE -O2 -o $(EXE) core/*.cpp lib/*.cpp ext/*.cpp main.cpp -lfreetype
