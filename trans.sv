`include "uvm_macros.svh"
import uvm_pkg::*;

class trans extends uvm_sequence_item;
  'uvm_object_utils(trans)
  
  rand bit [3:0] a;
  rand bit [3:0] b;
          bit [7:0] y;
  function new(string name="trans");
    super.new(name);
  endfunction
  
endclass

