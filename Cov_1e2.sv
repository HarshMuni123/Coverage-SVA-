

module tb;
  logic [3:0] a,b;
  int i;
  
  covergroup ci (ref logic [3:0] varb,input string id);
    
    option.per_instance = 1;
    option.name = id;
    coverpoint varb {
      bins varb_v[] = varb with (item %2 == 0);
      }
    
  endgroup
  
  ci cia = new(a,"var a");
  ci cib = new(b,"var b");
  
  initial begin
    for(i = 0; i<20;i=i+1) begin
      a = $urandom;
      b = $urandom;
      #1;
      cia.sample();
      cib.sample();
      #1;
    end
    $finish;
  end
  
endmodule


/*
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
# | Host             | 35e2e0cfee35             |
# | Tool             | Riviera-PRO 2023.04      |
# | Report file      | /home/runner/cov.txt     |
# | Report date      | 2025-12-22 11:28         |
# | Report arguments | -verbose                 |
# | Input file       | /home/runner/fcover.acdb |
# | Input file date  | 2025-12-22 11:28         |
# | Number of tests  | 1                        |
# ===============================================
# 
# 
# TEST DETAILS
# ==============================================
# | Property |              Value              |
# ==============================================
# | Test     | fcover.acdb:fcover              |
# | Status   | Ok                              |
# | Args     | asim +access+r                  |
# | Simtime  | 40 ns                           |
# | Cputime  | 0.001 s                         |
# | Seed     | 1                               |
# | Date     | 2025-12-22 11:28                |
# | User     | runner                          |
# | Host     | 35e2e0cfee35                    |
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
#     ===========================================================
#     |       Covergroup       |  Hits   |  Goal /  |  Status   |
#     |                        |         | At Least |           |
#     ===========================================================
#     | TYPE /tb/ci            | 87.500% | 100.000% | Uncovered |
#     ===========================================================
#     | INSTANCE var a         | 87.500% | 100.000% | Uncovered |
#     |------------------------|---------|----------|-----------|
#     | COVERPOINT var a::varb | 87.500% | 100.000% | Uncovered |
#     |------------------------|---------|----------|-----------|
#     | bin varb_v[0]          |       1 |        1 | Covered   |
#     | bin varb_v[2]          |       2 |        1 | Covered   |
#     | bin varb_v[4]          |       1 |        1 | Covered   |
#     | bin varb_v[6]          |       2 |        1 | Covered   |
#     | bin varb_v[8]          |       0 |        1 | Zero      |
#     | bin varb_v[10]         |       2 |        1 | Covered   |
#     | bin varb_v[12]         |       1 |        1 | Covered   |
#     | bin varb_v[14]         |       1 |        1 | Covered   |
#     ===========================================================
#     | INSTANCE var b         | 87.500% | 100.000% | Uncovered |
#     |------------------------|---------|----------|-----------|
#     | COVERPOINT var b::varb | 87.500% | 100.000% | Uncovered |
#     |------------------------|---------|----------|-----------|
#     | bin varb_v[0]          |       0 |        1 | Zero      |
#     | bin varb_v[2]          |       2 |        1 | Covered   |
#     | bin varb_v[4]          |       1 |        1 | Covered   |
#     | bin varb_v[6]          |       1 |        1 | Covered   |
#     | bin varb_v[8]          |       1 |        1 | Covered   |
#     | bin varb_v[10]         |       3 |        1 | Covered   |
#     | bin varb_v[12]         |       2 |        1 | Covered   |
#     | bin varb_v[14]         |       2 |        1 | Covered   |
#     ===========================================================
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
#     ===========================================================
#     |       Covergroup       |  Hits   |  Goal /  |  Status   |
#     |                        |         | At Least |           |
#     ===========================================================
#     | TYPE /tb/ci            | 87.500% | 100.000% | Uncovered |
#     ===========================================================
#     | INSTANCE var a         | 87.500% | 100.000% | Uncovered |
#     |------------------------|---------|----------|-----------|
#     | COVERPOINT var a::varb | 87.500% | 100.000% | Uncovered |
#     |------------------------|---------|----------|-----------|
#     | bin varb_v[0]          |       1 |        1 | Covered   |
#     | bin varb_v[2]          |       2 |        1 | Covered   |
#     | bin varb_v[4]          |       1 |        1 | Covered   |
#     | bin varb_v[6]          |       2 |        1 | Covered   |
#     | bin varb_v[8]          |       0 |        1 | Zero      |
#     | bin varb_v[10]         |       2 |        1 | Covered   |
#     | bin varb_v[12]         |       1 |        1 | Covered   |
#     | bin varb_v[14]         |       1 |        1 | Covered   |
#     ===========================================================
#     | INSTANCE var b         | 87.500% | 100.000% | Uncovered |
#     |------------------------|---------|----------|-----------|
#     | COVERPOINT var b::varb | 87.500% | 100.000% | Uncovered |
#     |------------------------|---------|----------|-----------|
#     | bin varb_v[0]          |       0 |        1 | Zero      |
#     | bin varb_v[2]          |       2 |        1 | Covered   |
#     | bin varb_v[4]          |       1 |        1 | Covered   |
#     | bin varb_v[6]          |       1 |        1 | Covered   |
#     | bin varb_v[8]          |       1 |        1 | Covered   |
#     | bin varb_v[10]         |       3 |        1 | Covered   |
#     | bin varb_v[12]         |       2 |        1 | Covered   |
#     | bin varb_v[14]         |       2 |        1 | Covered   |
#     ===========================================================
# 
exit
# VSIM: Simulation has finished.


*/
