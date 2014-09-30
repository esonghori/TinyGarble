# ***********************************************
#                    JustGarble
# ***********************************************

SRCDIR   = src
OBJDIR   = obj
BINDIR   = bin
TESTDIR   = test
OBJECTFULL = obj/*.o

SOURCES  := $(wildcard $(SRCDIR)/*.c)
INCLUDES := $(wildcard $(SRCDIR)/*.h)
OBJECTS  := $(SOURCES:$(SRCDIR)/%.c=$(OBJDIR)/%.o)

IDIR =../include
CC=gcc 
CFLAGS= -O3 -lm -lrt -lpthread -maes -msse4 -lmsgpack -march=native -I$(IDIR) -I$(MSGPACK) -L$(MSGPACK)/.libs


AES = AESFullTest
LARGE = LargeCircuitTest
FILE = CircuitFileTest
rm = rm --f

all: MAKE_DIR CHECK_MSGPACK $(BINDIR)/$(AES).out $(BINDIR)/$(LARGE).out $(BINDIR)/$(FILE).out

.PHONY: CHECK_MSGPACK MAKE_DIR clean

MAKE_DIR:
	mkdir -p $(OBJDIR)
	mkdir -p $(BINDIR)

CHECK_MSGPACK:
ifeq ($(MSGPACK),)
	$(error MSGPACK is not set.)
endif

$(BINDIR)/$(AES).out: $(OBJECTS) $(TESTDIR)/$(AES).c
	$(CC) $(OBJECTFULL) $(TESTDIR)/$(AES).c -o $(BINDIR)/$(AES).out $(LIBS) $(CFLAGS) 

$(BINDIR)/$(LARGE).out: $(OBJECTS) $(TESTDIR)/$(LARGE).c
	$(CC) $(OBJECTFULL) $(TESTDIR)/$(LARGE).c -o $(BINDIR)/$(LARGE).out $(LIBS) $(CFLAGS) 

$(BINDIR)/$(FILE).out: $(OBJECTS) $(TESTDIR)/$(FILE).c
	$(CC) $(OBJECTFULL) $(TESTDIR)/$(FILE).c -o $(BINDIR)/$(FILE).out $(LIBS) $(CFLAGS) 


$(OBJECTS): $(OBJDIR)/%.o : $(SRCDIR)/%.c
	$(CC) -c $< -o $@ $(LIBS) $(CFLAGS) 

clean:
	@$(rm) $(OBJECTS)
	@$(rm) $(BINDIR)/$(AES)
	@$(rm) $(BINDIR)/$(LARGE)
	@$(rm) $(BINDIR)/$(FILE)

