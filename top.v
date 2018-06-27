module top
#(
  // Parameter list
 )
(
  // Port list
  input        clock,
  input        reset,
  output [7:0] count
);

  counter
   #(
    )
  counter_i
    (
      .clock_i ( clock ),
      .reset_i ( reset ),
      .count_o ( count )
    );

endmodule
