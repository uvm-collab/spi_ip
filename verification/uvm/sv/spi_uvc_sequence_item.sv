`ifndef SPI_UVC_SEQUENCE_ITEM_SV
`define SPI_UVC_SEQUENCE_ITEM_SV

class spi_uvc_sequence_item extends uvm_sequence_item;

  `uvm_object_utils(spi_uvc_sequence_item)

  // Transaction variables

  rand logic rst_i;
  rand logic [7:0] din_i;
  rand logic [15:0] dvsr_i;
  rand logic start_i;
  rand logic cpol_i;
  rand logic cpha_i;
  rand logic miso_i;


  // Readout variables

  logic [7:0] dout_o;
  logic spi_done_tick_o;
  logic ready_o;
  logic sclk_o;
  logic mosi_o;


  extern function new(string name = "");

  extern function void do_copy(uvm_object rhs);
  extern function bit do_compare(uvm_object rhs, uvm_comparer comparer);
  extern function void do_print(uvm_printer printer);
  extern function string convert2string();

endclass : spi_uvc_sequence_item

function spi_uvc_sequence_item::new(string name = "");
  super.new(name);
endfunction : new

function void spi_uvc_sequence_item::do_copy(uvm_object rhs);
  // Cuando creo un objeto es un lugar de memoria y si quiero copiarlo necesito
  //agregar memoria

  //Al momento de mandar la transaction es un objeto necesito la copia de ese objeto
  spi_uvc_sequence_item rhs_;
  if (!$cast(rhs_, rhs)) `uvm_fatal(get_type_name(), "Cast of rhs object failed")
  super.do_copy(rhs);


endfunction : do_copy

function bit spi_uvc_sequence_item::do_compare(uvm_object rhs, uvm_comparer comparer);

  bit result;
  spi_uvc_sequence_item rhs_;
  if (!$cast(rhs_, rhs)) `uvm_fatal(get_type_name(), "Cast of rhs object failed")

  result = super.do_compare(rhs, comparer);

  return result;


endfunction : do_compare

function void spi_uvc_sequence_item::do_print(uvm_printer printer);
  if (printer.knobs.sprint == 0) `uvm_info(get_type_name(), convert2string(), UVM_MEDIUM)
  else printer.m_string = convert2string();
endfunction : do_print

function string spi_uvc_sequence_item::convert2string();
  string s;
  s = super.convert2string();
  $sformat(s, {s, "\n", "TRANSACTION INFORMATION (spi UVC):"});
  $sformat(s, {s, "\n", "SEQUENCE ITEM"});
  return s;
endfunction : convert2string



`endif  // SPI_UVC_SEQUENCE_ITEM_SV
