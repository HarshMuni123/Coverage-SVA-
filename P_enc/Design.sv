module pen(
  input logic [7:0] data,
  output logic [2:0] y
);
  
  always_comb begin
    y = 3'b000;
    casez(data)
      8'b00_00_00_01: y = 3'b000;
      8'b00_00_00_1?: y = 3'b001;
      8'b00_00_01_??: y = 3'b010;
      8'b00_00_1?_??: y = 3'b011;
      8'b00_01_??_??: y = 3'b100;
      8'b00_1?_??_??: y = 3'b101;
      8'b01_??_??_??: y = 3'b110;
      8'b1?_??_??_??: y = 3'b111;
    endcase
  end
  
endmodule
