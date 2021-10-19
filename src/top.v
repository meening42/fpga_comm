module top(
  inout BR3, BR4, BR5, BR6, 
  output BR7, BR8, BR9, BR10,
  output D1, D2, D3, D4,
  input TR3, TR4, TR5, TR6, TR7, TR8, TR9, TR10,
  input PMOD1, PMOD2
);
  wire [3:0] dInW;
  wire [3:0] dOutW;
  wire [7:0] aw;

  assign dInW = {BR3, BR4, BR5, BR6};
  assign dOutW = {BR7, BR8, BR9, BR10};
  assign D1 = BR7;
  assign D2 = BR8;
  assign D3 = BR9;
  assign D4 = BR10;
  assign aw = {TR3, TR4, TR5, TR6, TR7, TR8, TR9, TR10};

  commParalel com(.inData(dInW), .outData(dOutW), .addr(aw), .writeData(PMOD1), .readData(PMOD2));

endmodule