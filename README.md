OSHCamp Verilator / RISC-V Tutorial
===================================

Requirements
------------

Laptop running Linux (or a Linux VM) with g++, Verilator, and GTKWave installed.

To install on Ubuntu:

```
apt install build-essential verilator gtkwave git
```

To install on Fedora:

```
dnf install make automake gcc-c++ verilator gtkwave git
sudo chmod ugo+x /usr/bin/verilator
```


Getting materials
-----------------

Clone this repo/branch:

```
git clone -b tutorial_start https://github.com/gmarkall/verilated-counter.git
```


Tutorials
---------

* verilated-counter.odt - work-through of the counter example from Saturday's
  talk. A gentler introduction Verilator.
* ri5cy-testbench.odt - Running the open-source RISC-V RI5CY core through a
  testbench. For exploring the implementation of RI5CY and its internal
  protocols.
* gdbserver.odt - Running PicoRV32 and RI5CY Verilator models using standard
  debugging tools.


Further resources / exercises
-----------------------------

* Ariane: https://github.com/pulp-platform/ariane - A 6-stage 64-bit RISC-V core
  that has an accompanying Verilator model. Suggestion: clone and attempt to run
  / experiment with the Verilator model.
* A Verilog 6502 model: described at http://www.aholme.co.uk/6502/Main.htm with
  Verilog code at http://www.aholme.co.uk/6502/SRC/Core/ . Suggestion: download
  and examine the code. Can you create a Verilator model and drive it with a
  testbench?
