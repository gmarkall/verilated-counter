module top
#(
  // Parameter list
 )
(
  // Port list
  input        clock,
  input        reset,
  input        enable,
  output [7:0] count
);

  counter
   #(
     .CYCLES_PER_COUNT ( 4 )
    )
  counter_i
    (
      .clock_i  ( clock  ),
      .reset_i  ( reset  ),
      .enable_i ( enable ),
      .count_o  ( count  )
    );

endmodule
