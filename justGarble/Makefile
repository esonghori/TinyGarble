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
CFLAGS=  -std=c++11 -lm -lrt -lpthread -maes -msse4 -lmsgpack -Wno-unused-result -march=native -I$(IDIR) -I$(MSGPACK) -L$(MSGPACK)/.libs
DBGCFLAGS = -g -O0 -DDEBUG
RELCFLAGS = -O3 -DNDEBUG

SOURCES  := $(wildcard $(SRCDIR)/*.c) 
RELOBJECT := $(SOURCES:$(SRCDIR)/%.c=$(RELOBJDIR)/%.o)
DEBOBJECT := $(SOURCES:$(SRCDIR)/%.c=$(DEBOBJDIR)/%.o)

AES = AESFullTest
LARGE = LargeCircuitTest
FILE = CircuitFileTest
GARBLEFILE = GarbleFile
ALICE = Alice
BOB = Bob
SCDTEST = SCDCircuitTest
rm = rm --f

.PHONY: all release debug readnetlist check_msgpack prep clean

all: release debug 

release: check_msgpack prep $(RELDIR)/$(AES).out $(RELDIR)/$(LARGE).out $(RELDIR)/$(FILE).out $(RELDIR)/$(GARBLEFILE).out $(RELDIR)/$(ALICE).out $(RELDIR)/$(BOB).out $(RELDIR)/$(SCDTEST).out readnetlistrel
debug:   check_msgpack prep $(DEBDIR)/$(AES).out $(DEBDIR)/$(LARGE).out $(DEBDIR)/$(FILE).out $(DEBDIR)/$(GARBLEFILE).out $(DEBDIR)/$(ALICE).out $(DEBDIR)/$(BOB).out $(RELDIR)/$(SCDTEST).out readnetlistdeb


#check MSGPACK library
check_msgpack:
ifeq ($(MSGPACK),)
	$(error MSGPACK is not set.)
endif

##release
$(RELDIR)/$(AES).out: $(RELOBJECT) $(TESTDIR)/$(AES).c
	$(CC) $(RELOBJECT) $(TESTDIR)/$(AES).c -o $(RELDIR)/$(AES).out $(LIBS) $(CFLAGS) $(RELCFLAGS)

$(RELDIR)/$(LARGE).out: $(RELOBJECT) $(TESTDIR)/$(LARGE).c
	$(CC) $(RELOBJECT) $(TESTDIR)/$(LARGE).c -o $(RELDIR)/$(LARGE).out $(LIBS) $(CFLAGS) $(RELCFLAGS)

$(RELDIR)/$(FILE).out: $(RELOBJECT) $(TESTDIR)/$(FILE).c
	$(CC) $(RELOBJECT) $(TESTDIR)/$(FILE).c -o $(RELDIR)/$(FILE).out $(LIBS) $(CFLAGS) $(RELCFLAGS)

$(RELDIR)/$(GARBLEFILE).out: $(RELOBJECT) $(TESTDIR)/$(GARBLEFILE).c
	$(CC) $(RELOBJECT) $(TESTDIR)/$(GARBLEFILE).c -o $(RELDIR)/$(GARBLEFILE).out $(LIBS) $(CFLAGS) $(RELCFLAGS)

$(RELDIR)/$(ALICE).out: $(RELOBJECT) $(TESTDIR)/$(ALICE).c
	$(CC) $(RELOBJECT) $(TESTDIR)/$(ALICE).c -o $(RELDIR)/$(ALICE).out $(LIBS) $(CFLAGS) $(RELCFLAGS)

$(RELDIR)/$(BOB).out: $(RELOBJECT) $(TESTDIR)/$(BOB).c
	$(CC) $(RELOBJECT) $(TESTDIR)/$(BOB).c -o $(RELDIR)/$(BOB).out $(LIBS) $(CFLAGS) $(RELCFLAGS)

$(RELDIR)/$(SCDTEST).out: $(RELOBJECT) $(TESTDIR)/$(SCDTEST).c
	$(CC) $(RELOBJECT) $(TESTDIR)/$(SCDTEST).c -o $(RELDIR)/$(SCDTEST).out $(LIBS) $(CFLAGS) $(RELCFLAGS)


$(RELOBJECT): $(RELOBJDIR)/%.o : $(SRCDIR)/%.c
	$(CC) -c $< -o $@ $(LIBS) $(CFLAGS) $(RELCFLAGS)

##debug
$(DEBDIR)/$(AES).out: $(DEBOBJECT) $(TESTDIR)/$(AES).c
	$(CC) $(DEBOBJECT) $(TESTDIR)/$(AES).c -o $(DEBDIR)/$(AES).out $(LIBS) $(CFLAGS) $(DBGCFLAGS)

$(DEBDIR)/$(LARGE).out: $(DEBOBJECT) $(TESTDIR)/$(LARGE).c
	$(CC) $(DEBOBJECT) $(TESTDIR)/$(LARGE).c -o $(DEBDIR)/$(LARGE).out $(LIBS) $(CFLAGS) $(DBGCFLAGS)

$(DEBDIR)/$(FILE).out: $(DEBOBJECT) $(TESTDIR)/$(FILE).c
	$(CC) $(DEBOBJECT) $(TESTDIR)/$(FILE).c -o $(DEBDIR)/$(FILE).out $(LIBS) $(CFLAGS) $(DBGCFLAGS)

$(DEBDIR)/$(GARBLEFILE).out: $(DEBOBJECT)  $(TESTDIR)/$(GARBLEFILE).c
	$(CC) $(DEBOBJECT) $(TESTDIR)/$(GARBLEFILE).c -o $(DEBDIR)/$(GARBLEFILE).out $(LIBS) $(CFLAGS) $(DBGCFLAGS)

$(DEBDIR)/$(ALICE).out: $(DEBOBJECT)  $(TESTDIR)/$(ALICE).c
	$(CC) $(DEBOBJECT) $(TESTDIR)/$(ALICE).c -o $(DEBDIR)/$(ALICE).out $(LIBS) $(CFLAGS) $(DBGCFLAGS)

$(DEBDIR)/$(BOB).out: $(DEBOBJECT)  $(TESTDIR)/$(BOB).c
	$(CC) $(DEBOBJECT) $(TESTDIR)/$(BOB).c -o $(DEBDIR)/$(BOB).out $(LIBS) $(CFLAGS) $(DBGCFLAGS)

$(DEBDIR)/$(SCDTEST).out: $(DEBOBJECT)  $(TESTDIR)/$(SCDTEST).c
	$(CC) $(DEBOBJECT) $(TESTDIR)/$(SCDTEST).c -o $(DEBDIR)/$(SCDTEST).out $(LIBS) $(CFLAGS) $(DBGCFLAGS)

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
	@$(rm) $(RELDIR)/$(AES).out
	@$(rm) $(RELDIR)/$(LARGE).out
	@$(rm) $(RELDIR)/$(FILE).out
	@$(rm) $(RELDIR)/$(GARBLEFILE).out
	@$(rm) $(RELDIR)/$(ALICE).out
	@$(rm) $(RELDIR)/$(BOB).out
	@$(rm) $(RELDIR)/$(SCDTEST).out
	@$(rm) $(DEBOBJECT)
	@$(rm) $(DEBDIR)/$(AES).out
	@$(rm) $(DEBDIR)/$(LARGE).out
	@$(rm) $(DEBDIR)/$(FILE).out
	@$(rm) $(DEBDIR)/$(GARBLEFILE).out
	@$(rm) $(DEBDIR)/$(ALICE).out
	@$(rm) $(DEBDIR)/$(BOB).out
	@$(rm) $(DEBDIR)/$(SCDTEST).out
	cd readNetlist && $(MAKE) clean
