
module tb;
  
  int data[] = {0,0,1,1,1,0,0,0,1,1,1};
  logic clk = 0;
  
  always #5 clk = ~clk;
  
  int state;
  
    initial begin
      for(int i = 0 ; i < 11 ; i = i + 1) begin
        @(posedge clk);
        state = data[i];
        
      end
      
      $finish;
      
    end
  
  covergroup c @(posedge clk);
    option.per_instance = 1;
    
    coverpoint state
    {
      bins trans_0_1_non_conseq_5 = (0 => 1[->5]);
      bins trans_0_1_goto_5 = (1[=5]);
      bins trans_0_1_repe_5 = (0 => 1[*3]);
    }
  endgroup
    
  c cia ;
  
  initial begin
    cia = new();
    #200 $finish;
  end
  
endmodule



/*

 
#     COVERGROUP COVERAGE
#     ================================================================
#     |          Covergroup          |   Hits   |  Goal /  | Status  |
#     |                              |          | At Least |         |
#     ================================================================
#     | TYPE /tb/c                   | 100.000% | 100.000% | Covered |
#     ================================================================
#     | INSTANCE <UNNAMED1>          | 100.000% | 100.000% | Covered |
#     |------------------------------|----------|----------|---------|
#     | COVERPOINT <UNNAMED1>::state | 100.000% | 100.000% | Covered |
#     |------------------------------|----------|----------|---------|
#     | bin trans_0_1_non_conseq_5   |        1 |        1 | Covered |
#     | bin trans_0_1_goto_5         |        1 |        1 | Covered |
#     | bin trans_0_1_repe_5         |        1 |        1 | Covered |
#     ================================================================
# 

*/
