# ***********************************************
#                    JustGarble
# ***********************************************

SRCDIR   = src
OBJDIR   = obj
RELDIR   = bin
DEBDIR = debug
RELOBJDIR = $(RELDIR)/$(OBJDIR)
DEBOBJDIR = $(DEBDIR)/$(OBJDIR)
TESTDIR   = test
IDIR =include

CC=g++
CFLAGS=  -std=c++11 -lm -lrt -lpthread -maes -msse4 -lmsgpack -Wno-unused-result -march=native -I$(IDIR) -I$(MSGPACK) -L$(MSGPACK)/..
DBGCFLAGS = -g -O0 -DDEBUG
RELCFLAGS = -O3 -DNDEBUG

SOURCES  := $(wildcard $(SRCDIR)/*.c) 
RELOBJECT := $(SOURCES:$(SRCDIR)/%.c=$(RELOBJDIR)/%.o)
DEBOBJECT := $(SOURCES:$(SRCDIR)/%.c=$(DEBOBJDIR)/%.o)

ALICE = Alice
BOB = Bob
rm = rm --f

.PHONY: all release debug readnetlist check_msgpack prep clean

all: release debug 

release: check_msgpack prep $(RELDIR)/$(ALICE).out $(RELDIR)/$(BOB).out readnetlistrel
debug:   check_msgpack prep $(DEBDIR)/$(ALICE).out $(DEBDIR)/$(BOB).out readnetlistdeb


#check MSGPACK library
check_msgpack:
ifeq ($(MSGPACK),)
	$(error MSGPACK is not set.)
endif

##release
$(RELDIR)/$(ALICE).out: $(RELOBJECT) $(TESTDIR)/$(ALICE).c
	$(CC) $(RELOBJECT) $(TESTDIR)/$(ALICE).c -o $(RELDIR)/$(ALICE).out $(LIBS) $(CFLAGS) $(RELCFLAGS)

$(RELDIR)/$(BOB).out: $(RELOBJECT) $(TESTDIR)/$(BOB).c
	$(CC) $(RELOBJECT) $(TESTDIR)/$(BOB).c -o $(RELDIR)/$(BOB).out $(LIBS) $(CFLAGS) $(RELCFLAGS)


$(RELOBJECT): $(RELOBJDIR)/%.o : $(SRCDIR)/%.c
	$(CC) -c $< -o $@ $(LIBS) $(CFLAGS) $(RELCFLAGS)

##debug
$(DEBDIR)/$(ALICE).out: $(DEBOBJECT)  $(TESTDIR)/$(ALICE).c
	$(CC) $(DEBOBJECT) $(TESTDIR)/$(ALICE).c -o $(DEBDIR)/$(ALICE).out $(LIBS) $(CFLAGS) $(DBGCFLAGS)

$(DEBDIR)/$(BOB).out: $(DEBOBJECT)  $(TESTDIR)/$(BOB).c
	$(CC) $(DEBOBJECT) $(TESTDIR)/$(BOB).c -o $(DEBDIR)/$(BOB).out $(LIBS) $(CFLAGS) $(DBGCFLAGS)


$(DEBOBJECT): $(DEBOBJDIR)/%.o : $(SRCDIR)/%.c
	$(CC) -c $< -o $@ $(LIBS) $(CFLAGS) $(DBGCFLAGS)

readnetlistrel:
	cd readNetlist && $(MAKE) release

readnetlistdeb:
	cd readNetlist && $(MAKE) debug	

prep:
	@mkdir -p $(RELDIR) 
	@mkdir -p $(DEBDIR) 
	@mkdir -p $(RELDIR)/$(OBJDIR) 
	@mkdir -p $(DEBDIR)/$(OBJDIR) 

clean:
	@$(rm) $(RELOBJECT)
	@$(rm) $(RELDIR)/$(ALICE).out
	@$(rm) $(RELDIR)/$(BOB).out
	@$(rm) $(DEBOBJECT)
	@$(rm) $(DEBDIR)/$(ALICE).out
	@$(rm) $(DEBDIR)/$(BOB).out
	cd readNetlist && $(MAKE) clean
