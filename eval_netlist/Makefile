# ***********************************************
#                    TinyGarble
# ***********************************************
# ***********************************************
#                    JustGarble
# ***********************************************


CC=g++
CFLAGS=  -std=c++11 -lm -lrt -lpthread -lboost_program_options -maes -msse4 -Wno-unused-result -march=native $(USER_FLAGS)
DBGCFLAGS = -g -O0 -DDEBUG
RELCFLAGS = -O3 -DNDEBUG

SRCDIR   	= .
OBJDIR   	= obj
RELDIR   	= bin
DEBDIR 		= debug
RELOBJDIR 	= $(RELDIR)/$(OBJDIR)
DEBOBJDIR 	= $(DEBDIR)/$(OBJDIR)
SRC   		:= $(wildcard $(SRCDIR)/*.cpp) 
RELOBJECT 	:= $(SRC:$(SRCDIR)/%.cpp=$(RELOBJDIR)/%.o)
DEBOBJECT 	:= $(SRC:$(SRCDIR)/%.cpp=$(DEBOBJDIR)/%.o)


rm = rm --f

.PHONY: all prep release debug clean

all: release debug 

release: prep $(RELDIR)/tinygarble.out
debug:   prep $(DEBDIR)/tinygarble.out


##release
$(RELDIR)/tinygarble.out: $(RELOBJECT) 
	$(CC) $(RELOBJECT) -o $(RELDIR)/tinygarble.out $(CFLAGS) $(RELCFLAGS)

$(RELOBJECT): $(RELOBJDIR)/%.o : $(SRCDIR)/%.cpp
	$(CC) -c $< -o $@ $(LIBS) $(CFLAGS) $(RELCFLAGS)

##debug
$(DEBDIR)/tinygarble.out: $(DEBOBJECT)
	$(CC) $(DEBOBJECT) -o $(DEBDIR)/tinygarble.out $(CFLAGS) $(DBGCFLAGS)

$(DEBOBJECT): $(DEBOBJDIR)/%.o : $(SRCDIR)/%.cpp
	$(CC) -c $< -o $@ $(LIBS) $(CFLAGS) $(DBGCFLAGS)


prep:
	@mkdir -p $(RELDIR) 
	@mkdir -p $(DEBDIR) 
	@mkdir -p $(RELDIR)/$(OBJDIR) 
	@mkdir -p $(DEBDIR)/$(OBJDIR) 

clean:
	@$(rm) $(RELOBJECT)
	@$(rm) $(RELDIR)/tinygarble.out
	@$(rm) $(DEBOBJECT)
	@$(rm) $(DEBDIR)/tinygarble.out
