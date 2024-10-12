# Variables
SRC_DIR = src
BIN_DIR = bin
LIB_DIR = include
JAVAC = javac
JAVA = java
CLASSPATH = $(LIB_DIR)/*
MAIN_CLASS = Main
SRC_FILES = $(wildcard $(SRC_DIR)/**/*.java)
CLASS_FILES = $(patsubst $(SRC_DIR)/%.java, $(BIN_DIR)/%.class, $(SRC_FILES))

# Targets
.PHONY: all run clean

# Default target
all: $(CLASS_FILES)

# Compile Java source files
$(BIN_DIR)/%.class: $(SRC_DIR)/%.java
	@mkdir -p $(BIN_DIR)
	$(JAVAC) -d $(BIN_DIR) -cp $(CLASSPATH) $<

# Run the main class
run: all
	$(JAVA) -cp $(BIN_DIR):$(CLASSPATH) $(MAIN_CLASS)

# Clean up class files
clean:
	rm -rf $(BIN_DIR)/*.class
