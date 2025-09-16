`ifndef TOP_ENV_SV
`define TOP_ENV_SV

class top_env extends uvm_env;
  `uvm_component_utils(top_env)


  spi_ip_uvc_agent m_spi_ip_agent;
  spi_ip_uvc_config m_spi_ip_config;
  top_scoreboard m_scoreboard;
  top_coverage m_coverage;
  top_vsqr        vsqr;


extern function new(string name, uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
endclass: top_env


function top_env::new(string name, uvm_component parent);
super.new(name,parent);
endfunction:new

function void top_env::build_phase(uvm_phase phase);
//instanciamos el archivo de configuracion
m_spi_ip_config = spi_ip_uvc_config::type_id::create("m_spi_ip_config");
m_spi_ip_config.is_active = UVM_ACTIVE;
uvm_config_db#(spi_ip_uvc_config)::set(this,"m_spi_ip_agent*","config",m_spi_ip_config);
//instaciar el Agente
m_spi_ip_agent= spi_ip_uvc_agent::type_id::create("m_spi_ip_agent",this);
m_coverage = top_coverage::type_id::create("m_spi_ip_coverage",this);
m_scoreboard= top_scoreboard::type_id::create("m_spi_ip_scoreboard",this);
vsqr = top_vsqr::type_id::create("vsqr",this);
endfunction: build_phase

function void top_env::connect_phase(uvm_phase phase);
vsqr.m_spi_ip_sequencer = m_spi_ip_agent.m_sequencer;

m_spi_ip_agent.analysis_port.connect(m_scoreboard.spi_ip_imp_export);
m_spi_ip_agent.analysis_port.connect(m_coverage.spi_ip_imp_export);

endfunction: connect_phase


`endif  // TOP_TEST_ENV_SV
