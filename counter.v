module counter
#(
  // Parameter list
  parameter CYCLES_PER_COUNT = 8
 )
(
  // Port list
  input clock_i,
  input reset_i,
  input enable_i,
  output reg [7:0] count_o,
  input write_i,
  input [7:0] c_val
);

  reg [7:0] internal_count;

  always @(posedge clock_i) begin
    if (reset_i) begin
      count_o <= 0;
      internal_count <= 0;
    end else if (enable_i) begin
      if (!write_i) begin
        if (internal_count == (CYCLES_PER_COUNT - 1)) begin
          count_o <= count_o + 1;
          internal_count <= 0;
        end else
          internal_count <= internal_count + 1;
      end else
        internal_count <= c_val;
    end
  end

  function [7:0] read_internal_counter;
    /* verilator public */
    read_internal_counter = internal_count;
  endfunction

endmodule
