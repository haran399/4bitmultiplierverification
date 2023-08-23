`include "uvm_macros.svh"
import uvm_pkg::*;

// Code your testbench here
// or browse Examples
module tb;
  
  mul_if mif;
  mul dut(.a(mif.a),.b(mif.b),.y(mif.y));
  
  initial
    begin
      uvm_config_db(#virtual mul_if)::set(null,"*","mif",mif);
      runt_test("test");
    end
endmodule
