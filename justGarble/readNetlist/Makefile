# ***********************************************
#                    JustGarble
# ***********************************************

OBJDIR   = obj
RELDIR   = bin
DEBDIR   = debug
RELOBJDIR = $(RELDIR)/$(OBJDIR)
DEBOBJDIR = $(DEBDIR)/$(OBJDIR)

IDIR      = include

CC=g++ 
CFLAGS= -std=c++11 -lm -lrt -lpthread -maes -msse4 -lmsgpack -Wno-unused-result -march=native -I$(IDIR) -I$(MSGPACK) -L$(MSGPACK)/.libs 
DBGCFLAGS = -g -O0 -DDEBUG
RELCFLAGS = -O3 -DNDEBUG


RELDEP    = ../bin/obj/gates.o ../bin/obj/circuits.o ../bin/obj/util.o ../bin/obj/garble.o ../bin/obj/scd.o ../bin/obj/dkcipher.o 
DEBDEP    = ../debug/obj/gates.o ../debug/obj/circuits.o ../debug/obj/util.o ../debug/obj/garble.o ../debug/obj/scd.o ../debug/obj/dkcipher.o 

SOURCES := $(wildcard *.cpp)
RELOBJECT := $(SOURCES:$/%.cpp=$(RELOBJDIR)/%.o)
DEBOBJECT := $(SOURCES:$/%.cpp=$(DEBOBJDIR)/%.o) 


READNETLIST = ReadNetlist
rm = rm --f

.PHONY: all release debug check_msgpack prep clean

all: release debug

release: check_msgpack prep  $(RELDIR)/$(READNETLIST).out 
debug:   check_msgpack prep $(DEBDIR)/$(READNETLIST).out 

#check MSGPACK library
check_msgpack:
ifeq ($(MSGPACK),)
	$(error MSGPACK is not set.)
endif

##release
$(RELDIR)/$(READNETLIST).out: $(RELOBJECT)
	$(CC) $(RELOBJECT) $(RELDEP) -o $(RELDIR)/$(READNETLIST).out $(LIBS) $(CFLAGS) $(RELCFLAGS)

$(RELOBJECT): $(RELOBJDIR)/%.o : %.cpp
	$(CC) -c $< -o $@ $(LIBS) $(CFLAGS) $(RELCFLAGS)

##debug
$(DEBDIR)/$(READNETLIST).out: $(DEBOBJECT)
	$(CC) $(DEBOBJECT) $(DEBDEP) -o $(DEBDIR)/$(READNETLIST).out $(LIBS) $(CFLAGS) $(DBGCFLAGS)

$(DEBOBJECT): $(DEBOBJDIR)/%.o : %.cpp
	$(CC) -c $< -o $@ $(LIBS) $(CFLAGS) $(DBGCFLAGS)

prep:
	@mkdir -p $(RELDIR) $(DEBDIR) 
	@mkdir -p $(RELDIR)/$(OBJDIR) 
	@mkdir -p $(DEBDIR)/$(OBJDIR) 

clean:
	@$(rm) $(RELOBJECT)
	@$(rm) $(RELDIR)/$(READNETLIST).out
	@$(rm) $(DEBOBJECT)
	@$(rm) $(DEBDIR)/$(READNETLIST).out
