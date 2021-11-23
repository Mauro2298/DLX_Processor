gui_start
sh mkdir WORK
define_design_lib WORK -path ./WORK
analyze -library WORK -format vhdl {/home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/decode/registerfile.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/decode/mux21_generic.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/decode/fd_gen.vhd}
analyze -library WORK -format vhdl {/home/ms21.8/Desktop/DLX/DLX/SYN/tb.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/dlx.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/data_path.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/Types.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/CU.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/memory_stage.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/hazard_detection_unit.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/fetch.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/decode.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/WB.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/wb/mux21_generic.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/memory/mux21_generic.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/memory/memory.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/memory/fd_gen.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/fetch/mux21_generic.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/fetch/fd_gen.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/fetch/NPC.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/fetch/IR.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/mux21_generic.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/fd_gen.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/ALU/Types.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/ALU/ALU.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/ALU/ALU_core/tb_multiplier.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/ALU/ALU_core/p4_adder.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/ALU/ALU_core/mux21_generic.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/ALU/ALU_core/multiplier.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/ALU/ALU_core/logic.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/ALU/ALU_core/Shifter.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/ALU/ALU_core/Comparator.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/ALU/ALU_core/P4_core/sum_generator.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/ALU/ALU_core/P4_core/rca_gen.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/ALU/ALU_core/P4_core/mux21_generic.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/ALU/ALU_core/P4_core/fa.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/ALU/ALU_core/P4_core/carryselectblock.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/ALU/ALU_core/P4_core/carrygen.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/ALU/ALU_core/P4_core/PG.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/ALU/ALU_core/P4_core/G.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/ALU/ALU_core/Multiplier_core/p4_adder.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/ALU/ALU_core/Multiplier_core/mux5to1.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/ALU/ALU_core/Multiplier_core/encoder.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/ALU/ALU_core/LOGIC_core/NAND4_gen.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/ALU/ALU_core/LOGIC_core/NAND3_gen.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/ALU/ALU_core/LOGIC_core/IV_gen.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/ALU/ALU_core/Comparator_core/OR_Zero_Det.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/ALU/ALU_core/Comparator_core/OR2_gen.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/ALU/ALU_core/Comparator_core/IV_gen.vhd /home/ms21.8/Desktop/DLX/DLX/SYN/DP_core/execute/ALU/ALU_core/Comparator_core/AND2_gen.vhd}
analyze -library WORK -format vhdl {/home/ms21.8/Desktop/DLX/DLX/SYN/dlx.vhd}
elaborate DLX -architecture BEH -library DEFAULT -parameters "ADDR_SIZE = 32, DATA_SIZE = 32"
compile -exact_map -map_effort high
write -hierarchy -format ddc
write -hierarchy -format verilog -output /home/ms21.8/Desktop/DLX/DLX/SYN/dlx_netlist.v
write -hierarchy -format vhdl -output /home/ms21.8/Desktop/DLX/DLX/SYN/dlx_vhd.vhdl
uplevel #0 check_timing
create_clock -name "CLK" -period 100 {CLK}
report_timing > timing.txt
report_clock > clock.txt
report_timing -nworst 10 > timing_10.txt
report_power -hier > power_hier.txt
report_power -net > power_net.txt
report_area > area.txt
compile -exact_map -map_effort high -area_effort high -power_effort high
report_timing > timing_post_opt.txt
report_clock > clock_post_opt.txt
report_timing -nworst 10 > timing_10_post_opt.txt
report_power -hier > power_hier_post_opt.txt
report_power -net > power_net_post_opt.txt
report_area > area_post_opt.txt
write_sdc dlx
