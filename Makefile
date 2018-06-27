
VERILATOR = $(shell pkg-config --variable=prefix verilator)/bin/verilator
VDIR = $(realpath obj_dir)
CPPFLAGS = -I$(VDIR) $(shell pkg-config --cflags verilator)
CXXFLAGS = -Wall -Werror -std=c++11 -faligned-new
CXX = g++

VSRC = top.v counter.v
VLIB = $(VDIR)/Vtop__ALL.a
VOBJS = $(VDIR)/verilated.o $(VDIR)/verilated_vcd_c.o

all:
	$(VERILATOR) $(VSRC) --top-module top --cc --trace -Wno-BLKANDNBLK
	$(MAKE) -C $(VDIR) -f Vtop.mk Vtop__ALL.a verilated.o verilated_vcd_c.o
	g++ $(CPPFLAGS) $(CXXFLAGS) -c testbench.cpp
	g++ -o testbench testbench.o $(VLIB) $(VOBJS)
