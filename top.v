module top
#(
  // Parameter list
 )
(
  // Port list
  input        clock,
  input        reset,
  input        enable,
  output [7:0] count,
  input        write_internal_counter,
  input  [7:0] internal_counter_val
);

  counter
   #(
     .CYCLES_PER_COUNT ( 4 )
    )
  counter_i
    (
      .clock_i  ( clock                  ),
      .reset_i  ( reset                  ),
      .enable_i ( enable                 ),
      .count_o  ( count                  ),
      .write_i  ( write_internal_counter ),
      .c_val    ( internal_counter_val   )
    );

endmodule
