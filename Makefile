# ***********************************************
#                    TinyGarble
# ***********************************************
# ***********************************************
#                    JustGarble
# ***********************************************


CC=g++
CFLAGS=  -std=c++11 -lm -lrt -lpthread -maes -msse4 -Wno-unused-result -march=native -I$(IDIR)
DBGCFLAGS = -g -O0 -DDEBUG
RELCFLAGS = -O3 -DNDEBUG

SRCDIR   	= src
OBJDIR   	= obj
RELDIR   	= bin
DEBDIR 		= debug
RELOBJDIR 	= $(RELDIR)/$(OBJDIR)
DEBOBJDIR 	= $(DEBDIR)/$(OBJDIR)
EXEDIR   	= exe
IDIR 		= include
SRC   		:= $(wildcard $(SRCDIR)/*.cpp) 
RELOBJECT 	:= $(SRC:$(SRCDIR)/%.cpp=$(RELOBJDIR)/%.o)
DEBOBJECT 	:= $(SRC:$(SRCDIR)/%.cpp=$(DEBOBJDIR)/%.o)

ALICE = Alice
BOB = Bob

rm = rm --f

.PHONY: all prep release debug clean

all: release debug 

release: prep $(RELDIR)/$(ALICE).out $(RELDIR)/$(BOB).out 
debug:   prep $(DEBDIR)/$(ALICE).out $(DEBDIR)/$(BOB).out


##release
$(RELDIR)/$(ALICE).out: $(RELOBJECT) $(EXEDIR)/$(ALICE).cpp
	$(CC) $(RELOBJECT) $(EXEDIR)/$(ALICE).cpp -o $(RELDIR)/$(ALICE).out $(CFLAGS) $(RELCFLAGS)

$(RELDIR)/$(BOB).out: $(RELOBJECT) $(EXEDIR)/$(BOB).cpp
	$(CC) $(RELOBJECT) $(EXEDIR)/$(BOB).cpp -o $(RELDIR)/$(BOB).out  $(CFLAGS) $(RELCFLAGS)

$(RELOBJECT): $(RELOBJDIR)/%.o : $(SRCDIR)/%.cpp
	$(CC) -c $< -o $@ $(LIBS) $(CFLAGS) $(RELCFLAGS)

##debug
$(DEBDIR)/$(ALICE).out: $(DEBOBJECT)  $(EXEDIR)/$(ALICE).cpp
	$(CC) $(DEBOBJECT) $(EXEDIR)/$(ALICE).cpp -o $(DEBDIR)/$(ALICE).out $(CFLAGS) $(DBGCFLAGS)

$(DEBDIR)/$(BOB).out: $(DEBOBJECT)  $(EXEDIR)/$(BOB).cpp
	$(CC) $(DEBOBJECT) $(EXEDIR)/$(BOB).cpp -o $(DEBDIR)/$(BOB).out $(CFLAGS) $(DBGCFLAGS)

$(DEBOBJECT): $(DEBOBJDIR)/%.o : $(SRCDIR)/%.cpp
	$(CC) -c $< -o $@ $(LIBS) $(CFLAGS) $(DBGCFLAGS)


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
