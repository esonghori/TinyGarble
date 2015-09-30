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
TINYGARBLE	= $(BINDIR)/tinygarble.out
SRC   		:= $(wildcard $(SRCDIR)/*.cpp) 
OBJECT 		:= $(SRC:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)

rm = rm --f

.PHONY: all prep clean

all: prep $(TINYGARBLE)

$(TINYGARBLE): $(OBJECT) 
	$(CC) $(OBJECT) -o $(TINYGARBLE) $(CFLAGS) $(LIBS)

$(OBJECT): $(OBJDIR)/%.o : $(SRCDIR)/%.cpp
	$(CC) -c $< -o $@ $(CFLAGS)

prep:
	@mkdir -p $(BINDIR) 
	@mkdir -p $(OBJDIR) 

clean:
	@$(rm) -r $(BINDIR)
