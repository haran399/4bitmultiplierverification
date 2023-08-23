`include "uvm_macros.svh"
import uvm_pkg::*;

class seq extends uvm_sequence#(trans);
  'uvm_object_utils(trans)
  
  trans tr;
  
  function new(string name="seq");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(10)
      begin
        tr=trans::type_id::create("tr");
        start_item(tr);
        assert(tr.randomize());
        'uvm_info("SEQ",$sformatf("a:%0d,b:%0d,y:%0d",tr.a,tr.b,tr.y),UVM_NONE);
        finish_item(tr);
      end
  endtask
endclass
