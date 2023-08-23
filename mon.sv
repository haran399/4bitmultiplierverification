class mon extends uvm_monitor 
  'uvm_component_utils(mon)
  uvm_analysis_port#(trans) send;
  trans tr;
  virtual mul_if mif;
  
  function new(string name="mon",uvm_component parent =null );
    super.new(name,parent);
  endfunction
  
  virutal function void build_phase(uvm_phase phase);
    super.build_phase(phase)
    tr=trans::type_id::create("tr");
    send=new("send",this);
    if(!uvm_config_db#(virtual mul_if)::get(this,"","mif",mif))
            `uvm_error("drv","Unable to access Interface");
  endfunction
  virtual task run_phase(uvm_phase phase)
    forever
      begin
        #20;
        tr.a=mif.a;
        tr.b=mif.b;
        tr.y=mif.y;
            `uvm_info("MON", $sformatf("a : %0d  b : %0d  y : %0d", tr.a, tr.b, tr.y), UVM_NONE);
    send.write(tr);
    end
   endtask 
 
endclass