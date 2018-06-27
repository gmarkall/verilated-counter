module counter
#(
  // Parameter list
 )
(
  // Port list
  input clock_i,
  input reset_i,
  input enable_i,
  output reg [7:0] count_o
);

  reg [7:0] internal_count;

  always @(posedge clock_i)
    begin
      if (reset_i)
        begin
          count_o <= 0;
          internal_count <= 0;
        end
      else
        if (enable_i)
          begin
            if (internal_count == 7)
              begin
                count_o <= count_o + 1;
                internal_count <= 0;
              end
            else
              internal_count <= internal_count + 1;
          end
    end

endmodule
