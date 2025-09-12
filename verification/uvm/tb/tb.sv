module tb;

  `include "uvm_macros.svh"
  import uvm_pkg::*;

  import top_test_pkg::*;

  // Clock signal
  localparam time CLK_PERIOD = 10ns;
  logic clk_i = 0;
  always #(CLK_PERIOD / 2) clk_i = ~clk_i;

  // Reset signal
  logic rst_i = 1;
  initial begin
    repeat (2) @(posedge clk_i);
    rst_i = 1;
    @(posedge clk_i);
    rst_i = 0;
  end


  //Interface

  spi_uvc_if spi_vif (clk_i);

  spi dut (
      .clk_i(spi_vif.clk_i),
      .rst_i(spi_vif.rst_i),
      .din_i(spi_vif.din_i),
      .dvsr_i(spi_vif.dvsr_i),
      .start_i(spi_vif.start_i),
      .cpol_i(spi_vif.cpol_i),
      .cpha_i(spi_vif.cpha_i),
      .dout_o(spi_vif.dout_o),
      .spi_done_tick_o(spi_vif.spi_done_tick_o),
      .ready_o(spi_vif.ready_o),
      .sclk_o(spi_vif.sclk_o),
      .miso_i(spi_vif.miso_i),
      .mosi_o(spi_vif.mosi_o)

  );


  initial begin
    $timeformat(-9, 0, " ns", 10);
    uvm_config_db#(virtual spi_uvc_if)::set(null, "uvm_test_top.m_env.m_spi_agent", "vif", spi_vif);
    run_test();
  end


endmodule : tb
