#include <iostream>

#include "verilated.h"
#include "verilated_vcd_c.h"
#include "Vtop.h"
#include "Vtop__Syms.h"

using namespace std;

Vtop *model;
VerilatedVcdC *traceFile;
vluint64_t simTime = 0;

/* Add code the clockModel function here */

void outputState()
{
  /* Add code to output state */
}

void cycleAndOutput(size_t cycles)
{
  for (size_t i = 0; i < cycles; i++)
  {
    outputState();
    clockModel();
  }
}

int main(void)
{
  Verilated::traceEverOn(true);

  model = new Vtop;
  /* Instantiate trace file here */

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

  cout << endl << "Prior to setting internal counter, state is:" << endl;
  outputState();

  cout << endl << "Setting internal counter to 2..." << endl;

  /* Call task to set internal counter here */

  cout << endl << "Clocking model for a few more cycles..." << endl;
  // We clock the model here because we already outputted the current
  // state once - this advances things so we don't output the same state twice
  clockModel();
  cycleAndOutput(4);

  /* Close the tracefile here */
  delete model;

  return 0;
}
