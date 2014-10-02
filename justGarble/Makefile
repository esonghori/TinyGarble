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

CC=gcc 
CFLAGS= -lm -lrt -lpthread -maes -msse4 -lmsgpack -Wno-unused-result -march=native -I$(IDIR) -I$(MSGPACK) -L$(MSGPACK)/.libs
DBGCFLAGS = -g -O0 -DDEBUG
RELCFLAGS = -O3 -DNDEBUG

SOURCES  := $(wildcard $(SRCDIR)/*.c)
RELOBJECT := $(SOURCES:$(SRCDIR)/%.c=$(RELOBJDIR)/%.o)
DEBOBJECT := $(SOURCES:$(SRCDIR)/%.c=$(DEBOBJDIR)/%.o)


AES = AESFullTest
LARGE = LargeCircuitTest
FILE = CircuitFileTest
rm = rm --f

.PHONY: all release debug check_msgpack prep clean

all: release debug

release: check_msgpack prep $(RELDIR)/$(AES).out $(RELDIR)/$(LARGE).out $(RELDIR)/$(FILE).out
debug:   check_msgpack prep $(DEBDIR)/$(AES).out $(DEBDIR)/$(LARGE).out $(DEBDIR)/$(FILE).out 


#check MSGPACK library
check_msgpack:
ifeq ($(MSGPACK),)
	$(error MSGPACK is not set.)
endif

$(RELDIR)/$(AES).out: $(RELOBJECT) $(TESTDIR)/$(AES).c
	$(CC) $(RELOBJECT) $(TESTDIR)/$(AES).c -o $(RELDIR)/$(AES).out $(LIBS) $(CFLAGS) $(RELCFLAGS)

$(RELDIR)/$(LARGE).out: $(RELOBJECT) $(TESTDIR)/$(LARGE).c
	$(CC) $(RELOBJECT) $(TESTDIR)/$(LARGE).c -o $(RELDIR)/$(LARGE).out $(LIBS) $(CFLAGS) $(RELCFLAGS)

$(RELDIR)/$(FILE).out: $(RELOBJECT) $(TESTDIR)/$(FILE).c
	$(CC) $(RELOBJECT) $(TESTDIR)/$(FILE).c -o $(RELDIR)/$(FILE).out $(LIBS) $(CFLAGS) $(RELCFLAGS)


$(DEBDIR)/$(AES).out: $(DEBOBJECT) $(TESTDIR)/$(AES).c
	$(CC) $(DEBOBJECT) $(TESTDIR)/$(AES).c -o $(DEBDIR)/$(AES).out $(LIBS) $(CFLAGS) $(DBGCFLAGS)

$(DEBDIR)/$(LARGE).out: $(DEBOBJECT) $(TESTDIR)/$(LARGE).c
	$(CC) $(DEBOBJECT) $(TESTDIR)/$(LARGE).c -o $(DEBDIR)/$(LARGE).out $(LIBS) $(CFLAGS) $(DBGCFLAGS)

$(DEBDIR)/$(FILE).out: $(DEBOBJECT) $(TESTDIR)/$(FILE).c
	$(CC) $(DEBOBJECT) $(TESTDIR)/$(FILE).c -o $(DEBDIR)/$(FILE).out $(LIBS) $(CFLAGS) $(DBGCFLAGS)



$(RELOBJECT): $(RELOBJDIR)/%.o : $(SRCDIR)/%.c
	$(CC) -c $< -o $@ $(LIBS) $(CFLAGS) $(RELCFLAGS)

$(DEBOBJECT): $(DEBOBJDIR)/%.o : $(SRCDIR)/%.c
	$(CC) -c $< -o $@ $(LIBS) $(CFLAGS) $(DBGCFLAGS)



prep:
	@mkdir -p $(RELDIR) $(DEBDIR) 
	@mkdir -p $(RELDIR)/$(OBJDIR) 
	@mkdir -p $(DEBDIR)/$(OBJDIR) 

clean:
	@$(rm) $(RELOBJECT)
	@$(rm) $(RELDIR)/$(AES).out
	@$(rm) $(RELDIR)/$(LARGE).out
	@$(rm) $(RELDIR)/$(FILE).out
	@$(rm) $(DEBOBJECT)
	@$(rm) $(DEBDIR)/$(AES).out
	@$(rm) $(DEBDIR)/$(LARGE).out
	@$(rm) $(DEBDIR)/$(FILE).out

