class agent extends uvm_agent
  'uvm_component_utils(agent)
  
  function new(string name="agent",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  drv dr;
  mon m;
  uvm_sequencer#(trans) seqr;
  
  virtual function void build_phase(uvm_phase phase)
    super.build_phase(phase);
    dr = drv::type_id::create("dr",this);
 m = mon::type_id::create("m",this);
 seqr = uvm_sequencer#(transaction)::type_id::create("seqr", this);
endfunction
  
  virtual function void connect_phase(uvm_phase phase)
    super.connect_phase(phase);
    dr.seq_item_port.connect(seqr.seq_item_export);
  endfunction
endclass
