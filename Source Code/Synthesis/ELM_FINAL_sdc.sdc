# ####################################################################

#  Created by Genus(TM) Synthesis Solution 19.11-s087_1 on Tue Nov 30 19:28:32 IST 2021

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design TOP_MODULE_ELM

create_clock -name "clock" -period 10.0 -waveform {0.0 5.0} [get_ports clock]
set_clock_transition 0.1 [get_clocks clock]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports reset]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports master_reset]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {true_image[3]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {true_image[2]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {true_image[1]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {true_image[0]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[31]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[30]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[29]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[28]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[27]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[26]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[25]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[24]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[23]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[22]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[21]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[20]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[19]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[18]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[17]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[16]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[15]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[14]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[13]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[12]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[11]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[10]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[9]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[8]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[7]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[6]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[5]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[4]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[3]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[2]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[1]}]
set_input_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {input_32bit_image_data[0]}]
set_output_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {recognised_image[3]}]
set_output_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {recognised_image[2]}]
set_output_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {recognised_image[1]}]
set_output_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {recognised_image[0]}]
set_output_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports final_output_done]
set_output_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {count1[9]}]
set_output_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {count1[8]}]
set_output_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {count1[7]}]
set_output_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {count1[6]}]
set_output_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {count1[5]}]
set_output_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {count1[4]}]
set_output_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {count1[3]}]
set_output_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {count1[2]}]
set_output_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {count1[1]}]
set_output_delay -clock [get_clocks clock] -add_delay -max 1.0 [get_ports {count1[0]}]

set_clock_uncertainty -setup 0.01 [get_ports clock]
set_clock_uncertainty -hold 0.01 [get_ports clock]
