`ifndef SPI_UVC_IF_SV
`define SPI_UVC_IF_SV

interface spi_uvc_if (
    input logic clk_i
);



  logic rst_i;
  logic [7:0] din_i;
  logic [15:0] dvsr_i;
  logic start_i;
  logic cpol_i;
  logic cpha_i;
  logic miso_i;

  logic [7:0] dout_o;
  logic spi_done_tick_o;
  logic ready_o;
  logic sclk_o;
  logic mosi_o;



  //INICIALIZAR VALORES
  initial begin

    rst_i   = 0;
    din_i   = 0;
    dvsr_i  = 0;
    start_i = 0;
    cpol_i  = 0;
    cpha_i  = 0;
    miso_i  = 0;


  end


  clocking cb_drv @(posedge clk_i);
    default input #1ns output #1ns;
    output rst_i;
    output din_i;
    output dvsr_i;
    output start_i;
    output cpol_i;
    output cpha_i;
    output miso_i;


  endclocking : cb_drv

  clocking cb_mon @(posedge clk_i);
    default input #1ns output #1ns;

    input dout_o;
    input spi_done_tick_o;
    input ready_o;
    input sclk_o;
    input mosi_o;


  endclocking : cb_mon


endinterface : spi_uvc_if

`endif  // SPI_UVC_IF_SV
