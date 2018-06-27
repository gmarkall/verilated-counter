module counter
#(
  // Parameter list
 )
(
  // Port list
  input clock_i,
  input reset_i,
  output reg [7:0] count_o
);

  always @(posedge clock_i)
    begin
      if (reset_i)
        count_o <= 0;
      else
        count_o <= count_o + 1;
    end

endmodule
