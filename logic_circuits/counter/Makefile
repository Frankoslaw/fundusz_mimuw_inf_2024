TOP = test_counter
SRC = counter.v
TEST_SRC= test_counter.v
BIN = $(TOP).vvp

$(BIN): $(SRC) $(TEST_SRC)
	iverilog -o $(BIN) -s $(TOP) $(SRC) $(TEST_SRC)

.PHONY: all clean test

all: $(BIN)

test: $(BIN)
	vvp $(BIN)

clean:
	rm -f *.vvp *.vcd