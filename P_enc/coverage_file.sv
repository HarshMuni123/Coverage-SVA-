
module tb;
  
  logic [7:0] data;
  logic [2:0] y;
  
  
  covergroup p_enc;
    option.per_instance = 1;
    
    coverpoint data {
      illegal_bins ILL = {8'b00_00_00_00};
      
      bins zero = {8'b000_000_01};
      wildcard bins one = {8'b00_00_00_1?};
      wildcard bins two = {8'b00_00_01_??};
      wildcard bins three = {8'b00_00_1?_??};
      wildcard bins four = {8'b00_01_??_??};
      wildcard bins five = {8'b00_1?_??_??};
      wildcard bins six = {8'b01_??_??_??};
      wildcard bins seven = {8'b1?_??_??_??};
    }
    
  endgroup
  
  p_enc ci = new();
  localparam int val = 1 << 8;
  
  initial begin
    for(int i = 0; i < val ; i = i + 1) begin
      data = $urandom_range(0,val);
      #1;
      ci.sample();
      #1;
    end
  end
  
endmodule

/*

 +++++++++++++++++++++++++++++++++++++++++++++
# ++++++++++     DESIGN HIERARCHY    ++++++++++
# +++++++++++++++++++++++++++++++++++++++++++++
# 
# 
# CUMULATIVE SUMMARY
# =============================================
# |    Coverage Type    | Weight | Hits/Total |
# =============================================
# | Covergroup Coverage |      1 |    87.500% |
# |---------------------|--------|------------|
# | Types               |        |      0 / 1 |
# =============================================
# CUMULATIVE INSTANCE-BASED COVERAGE: 87.500%
# COVERED INSTANCES: 0 / 1
# FILES: 1
# 
# 
# INSTANCE - /tb : work.tb
# 
# 
#     SUMMARY
#     =============================================
#     |    Coverage Type    | Weight | Hits/Total |
#     =============================================
#     | Covergroup Coverage |      1 |    87.500% |
#     |---------------------|--------|------------|
#     | Types               |        |      0 / 1 |
#     =============================================
#     WEIGHTED AVERAGE LOCAL: 87.500%
# 
# 
#     COVERGROUP COVERAGE
#     ================================================================
#     |         Covergroup          |  Hits   |  Goal /  |  Status   |
#     |                             |         | At Least |           |
#     ================================================================
#     | TYPE /tb/p_enc              | 87.500% | 100.000% | Uncovered |
#     ================================================================
#     | INSTANCE <UNNAMED1>         | 87.500% | 100.000% | Uncovered |
#     |-----------------------------|---------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::data | 87.500% | 100.000% | Uncovered |
#     |-----------------------------|---------|----------|-----------|
#     | bin zero                    |       0 |        1 | Zero      |
#     | bin one                     |       4 |        1 | Covered   |
#     | bin two                     |       5 |        1 | Covered   |
#     | bin three                   |       8 |        1 | Covered   |
#     | bin four                    |      15 |        1 | Covered   |
#     | bin five                    |      21 |        1 | Covered   |
#     | bin six                     |      69 |        1 | Covered   |
#     | bin seven                   |     132 |        1 | Covered   |
#     | illegal bin ILL             |       2 |    -     | Occurred  |
#     ================================================================
# 
# 
# +++++++++++++++++++++++++++++++++++++++++++++
# ++++++++++       DESIGN UNITS      ++++++++++
# +++++++++++++++++++++++++++++++++++++++++++++
# 
# 
# CUMULATIVE SUMMARY
# =============================================
# |    Coverage Type    | Weight | Hits/Total |
# =============================================
# | Covergroup Coverage |      1 |    87.500% |
# |---------------------|--------|------------|
# | Types               |        |      0 / 1 |
# =============================================
# CUMULATIVE DESIGN-BASED COVERAGE: 87.500%
# COVERED DESIGN UNITS: 0 / 1
# FILES: 1
# 
# 
# MODULE - work.tb
# 
# 
#     SUMMARY
#     =============================================
#     |    Coverage Type    | Weight | Hits/Total |
#     =============================================
#     | Covergroup Coverage |      1 |    87.500% |
#     |---------------------|--------|------------|
#     | Types               |        |      0 / 1 |
#     =============================================
#     WEIGHTED AVERAGE: 87.500%
# 
# 
#     COVERGROUP COVERAGE
#     ================================================================
#     |         Covergroup          |  Hits   |  Goal /  |  Status   |
#     |                             |         | At Least |           |
#     ================================================================
#     | TYPE /tb/p_enc              | 87.500% | 100.000% | Uncovered |
#     ================================================================
#     | INSTANCE <UNNAMED1>         | 87.500% | 100.000% | Uncovered |
#     |-----------------------------|---------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::data | 87.500% | 100.000% | Uncovered |
#     |-----------------------------|---------|----------|-----------|
#     | bin zero                    |       0 |        1 | Zero      |
#     | bin one                     |       4 |        1 | Covered   |
#     | bin two                     |       5 |        1 | Covered   |
#     | bin three                   |       8 |        1 | Covered   |
#     | bin four                    |      15 |        1 | Covered   |
#     | bin five                    |      21 |        1 | Covered   |
#     | bin six                     |      69 |        1 | Covered   |
#     | bin seven                   |     132 |        1 | Covered   |
#     | illegal bin ILL             |       2 |    -     | Occurred  |
#     ================================================================
# 
exit
# VSIM: Simulation has finished.

*/
