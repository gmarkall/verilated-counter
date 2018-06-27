#include <iostream>

#include "verilated.h"
#include "verilated_vcd_c.h"
#include "Vtop.h"

using namespace std;

Vtop *model;
VerilatedVcdC *traceFile;
vluint64_t simTime = 0;

void clockModel()
{
  model->clock = 0;
  model->eval();
  simTime += 5;
  traceFile->dump (simTime);
  model->clock = 1;
  model->eval();
  simTime += 5;
  traceFile->dump (simTime);
}

void cycleAndOutput(size_t cycles)
{
  for (size_t i = 0; i < cycles; i++)
  {
    cout << "Counter value is " << ((uint32_t)model->count) << endl;
    clockModel();
  }
}

int main(void)
{
  Verilated::traceEverOn(true);

  model = new Vtop;
  traceFile = new VerilatedVcdC;
  model->trace(traceFile, 99);
  traceFile->open("model.vcd");

  cout << "Initialising counter..." << endl;

  // Initialise the counter to 0
  model->reset = 1;
  model->enable = 0;
  clockModel();
  model->reset = 0;

  cout << "Initial counter value is " << ((uint32_t)model->count) << endl;


  cout << endl << "Clocking model without enabling counter..." << endl;

  cycleAndOutput(10);

  cout << endl << "Clocking model with counter enabled..." << endl;
  model->enable = 1;

  cycleAndOutput(100);

  traceFile->close();

  delete traceFile;
  delete model;

  return 0;
}
