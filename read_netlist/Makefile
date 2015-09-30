# ***********************************************
#                    TinyGarble
# ***********************************************
# ***********************************************
#                    JustGarble
# ***********************************************


CC = g++
CFLAGS = -std=c++11 -maes -msse4 -Wno-unused-result -march=native $(USER_FLAGS)
LIBS = -lm -lrt -lpthread -lboost_program_options

ifeq ($(DEBUG),true)
	CFLAGS += -g -O0 -DDEBUG
else
	CFLAGS += -O3 -DNDEBUG
endif

SRCDIR   	= .
BINDIR   	= bin
OBJDIR 		= $(BINDIR)/obj
READNETLIST	= $(BINDIR)/read_netlist.out
SRC   		:= $(wildcard $(SRCDIR)/*.cpp) 
OBJECT 		:= $(SRC:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)

rm = rm --f

.PHONY: all prep clean

all: prep $(READNETLIST)

$(READNETLIST): $(OBJECT) 
	$(CC) $(OBJECT) -o $(READNETLIST) $(CFLAGS) $(LIBS)

$(OBJECT): $(OBJDIR)/%.o : $(SRCDIR)/%.cpp
	$(CC) -c $< -o $@ $(CFLAGS)

prep:
	@mkdir -p $(BINDIR) 
	@mkdir -p $(OBJDIR) 

clean:
	@$(rm) -r $(BINDIR)
