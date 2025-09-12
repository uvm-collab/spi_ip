`ifndef SPI_UVC_SEQUENCE_BASE_SV
`define SPI_UVC_SEQUENCE_BASE_SV

class spi_uvc_sequence_base extends uvm_sequence #(spi_uvc_sequence_item);
  `uvm_object_utils(spi_uvc_sequence_base)

  rand spi_uvc_sequence_item m_trans;


  extern function new(string name = "");

  extern virtual task body();

endclass : spi_uvc_sequence_base

function spi_uvc_sequence_base::new(string name = "");
  super.new(name);
  m_trans = spi_uvc_sequence_item::type_id::create("m_trans");
endfunction : new



task spi_uvc_sequence_base::body();
  start_item(m_trans);
  finish_item(m_trans);
endtask : body

`endif  // SPI_UVC_SEQUENCE_BASE_SV
