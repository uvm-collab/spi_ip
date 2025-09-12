`ifndef SPI_UVC_CONFIG_SV
`define SPI_UVC_CONFIG_SV

class spi_uvc_config extends uvm_object;

  `uvm_object_utils(spi_uvc_config)

  uvm_active_passive_enum is_active = UVM_ACTIVE;

  extern function new(string name = "");

endclass : spi_uvc_config


function spi_uvc_config::new(string name = "");
  super.new(name);
endfunction : new


`endif  // SPI_UVC_CONFIG_SV
