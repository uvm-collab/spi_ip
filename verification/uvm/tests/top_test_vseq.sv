`ifndef TOP_TEST_VSEQ_SV
`define TOP_TEST_VSEQ_SV

class top_test_vseq extends uvm_sequence;

  `uvm_object_utils(top_test_vseq)
  `uvm_declare_p_sequencer(top_vsqr)

  extern function new(string name = "");

  extern task spi_rand_seq();
  extern task body();

endclass : top_test_vseq


function top_test_vseq::new(string name = "");
  super.new(name);
endfunction : new


task top_test_vseq::spi_rand_seq();
  spi_uvc_sequence_base seq;
  seq = spi_uvc_sequence_base::type_id::create("seq");

  if (!(seq.randomize() with {
        // m_trans no se declara ni se crea en top_test_vseq, porque ya está declarado y 
        // creado dentro de tu clase spi_uvc_sequence_base

        //el objeto es m_name y accedemos al item


      }))
    `uvm_fatal("RAND_ERROR", "Randomization error!")
  seq.start(p_sequencer.m_spi_sequencer);
endtask : spi_rand_seq


task top_test_vseq::body();

  // Initial delay
  // #(50ns);

  // repeat (10) begin
  //   spi_rand_seq();
  // end

  // Drain time
  // #(50ns);

endtask : body

`endif  // TOP_TEST_VSEQ_SV
