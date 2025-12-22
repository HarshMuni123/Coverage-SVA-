
module tb;
  
  logic [3:0] a;
  int i = 0;
  
  covergroup ci;
    option.per_instance = 1;
    
    coverpoint a
    {
      bins zero = {0};
      bins even_a = a with ((item > 0) && (item %2 == 0));
      illegal_bins odd_a = a with (item % 2 != 0);
      bins POW_OF_2 = a with ((item > 0) && (item & (item - 1)) == 0); 
    }
    
  endgroup
  
  ci c = new();
    
    initial begin
      for(i = 0; i < 50; i = i + 1) begin
        a = $urandom_range(0,15);
        #1;
        c.sample();
        #2;
      end
    end
    
endmodule

/* 

xec cat cov.txt;
# +++++++++++++++++++++++++++++++++++++++++++++
# ++++++++++       REPORT INFO       ++++++++++
# +++++++++++++++++++++++++++++++++++++++++++++
# 
# 
# SUMMARY
# ===============================================
# |     Property     |          Value           |
# ===============================================
# | User             | runner                   |
# | Host             | 472a73a61898             |
# | Tool             | Riviera-PRO 2023.04      |
# | Report file      | /home/runner/cov.txt     |
# | Report date      | 2025-12-22 00:30         |
# | Report arguments | -verbose                 |
# | Input file       | /home/runner/fcover.acdb |
# | Input file date  | 2025-12-22 00:30         |
# | Number of tests  | 1                        |
# ===============================================
# 
# 
# TEST DETAILS
# ==============================================
# | Property |              Value              |
# ==============================================
# | Test     | fcover.acdb:fcover              |
# | Status   | Error                           |
# | Args     | asim +access+r                  |
# | Simtime  | 150 ns                          |
# | Cputime  | 0.006 s                         |
# | Seed     | 1                               |
# | Date     | 2025-12-22 00:30                |
# | User     | runner                          |
# | Host     | 472a73a61898                    |
# | Host os  | Linux64                         |
# | Tool     | Riviera-PRO 2023.04 (simulator) |
# ==============================================
# 
# 
# +++++++++++++++++++++++++++++++++++++++++++++
# ++++++++++     DESIGN HIERARCHY    ++++++++++
# +++++++++++++++++++++++++++++++++++++++++++++
# 
# 
# CUMULATIVE SUMMARY
# =============================================
# |    Coverage Type    | Weight | Hits/Total |
# =============================================
# | Covergroup Coverage |      1 |   100.000% |
# |---------------------|--------|------------|
# | Types               |        |      1 / 1 |
# =============================================
# CUMULATIVE INSTANCE-BASED COVERAGE: 100.000%
# COVERED INSTANCES: 1 / 1
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
#     | Covergroup Coverage |      1 |   100.000% |
#     |---------------------|--------|------------|
#     | Types               |        |      1 / 1 |
#     =============================================
#     WEIGHTED AVERAGE LOCAL: 100.000%
# 
# 
#     COVERGROUP COVERAGE
#     =============================================================
#     |        Covergroup        |   Hits   |  Goal /  |  Status  |
#     |                          |          | At Least |          |
#     =============================================================
#     | TYPE /tb/ci              | 100.000% | 100.000% | Covered  |
#     =============================================================
#     | INSTANCE <UNNAMED1>      | 100.000% | 100.000% | Covered  |
#     |--------------------------|----------|----------|----------|
#     | COVERPOINT <UNNAMED1>::a | 100.000% | 100.000% | Covered  |
#     |--------------------------|----------|----------|----------|
#     | bin zero                 |        4 |        1 | Covered  |
#     | bin even_a               |       25 |        1 | Covered  |
#     | bin POW_OF_2             |       10 |        1 | Covered  |
#     | illegal bin odd_a        |       21 |    -     | Occurred |
#     =============================================================
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
# | Covergroup Coverage |      1 |   100.000% |
# |---------------------|--------|------------|
# | Types               |        |      1 / 1 |
# =============================================
# CUMULATIVE DESIGN-BASED COVERAGE: 100.000%
# COVERED DESIGN UNITS: 1 / 1
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
#     | Covergroup Coverage |      1 |   100.000% |
#     |---------------------|--------|------------|
#     | Types               |        |      1 / 1 |
#     =============================================
#     WEIGHTED AVERAGE: 100.000%
# 
# 
#     COVERGROUP COVERAGE
#     =============================================================
#     |        Covergroup        |   Hits   |  Goal /  |  Status  |
#     |                          |          | At Least |          |
#     =============================================================
#     | TYPE /tb/ci              | 100.000% | 100.000% | Covered  |
#     =============================================================
#     | INSTANCE <UNNAMED1>      | 100.000% | 100.000% | Covered  |
#     |--------------------------|----------|----------|----------|
#     | COVERPOINT <UNNAMED1>::a | 100.000% | 100.000% | Covered  |
#     |--------------------------|----------|----------|----------|
#     | bin zero                 |        4 |        1 | Covered  |
#     | bin even_a               |       25 |        1 | Covered  |
#     | bin POW_OF_2             |       10 |        1 | Covered  |
#     | illegal bin odd_a        |       21 |    -     | Occurred |
#     =============================================================
# 
exit
# VSIM: Simulation has finished.


*/
