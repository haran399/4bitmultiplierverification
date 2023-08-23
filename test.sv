class test extends uvm_test;
`uvm_component_utils(test)
 
function new(input string inst = "test", uvm_component c);
super.new(inst,c);
endfunction
 
env e;
seq sq;
 
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
  e   = env::type_id::create("env",this);
  sq = seq::type_id::create("sq");
endfunction
 
virtual task run_phase(uvm_phase phase);
phase.raise_objection(this);
sq.start(e.a.seqr);
#20;
phase.drop_objection(this);
endtask
endclass