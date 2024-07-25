# Directories.
SRCDIR := src
OBJDIR := obj
TRGDIR := .
# Files.
SOURCES := $(wildcard $(SRCDIR)/*.cpp)
HEADERS := $(wildcard $(SRCDIR)/*.h)
TARGETS := $(SOURCES:$(SRCDIR)/%.cpp=$(TRGDIR)/%)
# Specifies the C++ compiler and flags.
CXX := g++
CXXFLAGS := -std=gnu++17 -Wall -Werror -g

# Default target.
all: $(TARGETS)

$(TRGDIR)/%: $(OBJDIR)/%.o
	@$(CXX) $(CXXFLAGS) -o $@ $^

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp $(HEADERS)
	@mkdir -p $(OBJDIR)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

# Prevents a file named "clean" from messing up this target.
.PHONY: clean
clean:
	@rm -rf $(OBJDIR) $(TARGETS)

run: $(app)
	./$(app) $(ARGS)

.PHONY: edit
edit:
	vim $(app).cpp && make $(app) && ./$(app) $(ARGS)
