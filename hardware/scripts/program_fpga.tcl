
set bitstream_file [lindex $argv 0]

if {![file exists $bitstream_file]} {
    puts "Invalid bitstream file!"
    exit
}

# Change this number based on your assigned port number (Lab 1)
set port_number 3121

open_hw
connect_hw_server -url localhost:${port_number}
open_hw_target

set_property PROGRAM.FILE ${bitstream_file} [get_hw_devices xc7a*]

current_hw_device [get_hw_devices xc7a*]
refresh_hw_device -update_hw_probes false [lindex [get_hw_devices xc7a*] 0]
program_hw_devices [get_hw_devices xc7a*]
refresh_hw_device [lindex [get_hw_devices xc7a*] 0]

#close_hw
