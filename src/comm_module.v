module commParalel(
  input  [3:0]inData,
  output [3:0]outData,
  input  [8:0]addr,
  input  writeData, readData
);
  reg [3:0] buffer [0:255];
  wire readCondition;
  integer address;

  assign address = addr;

  assign readCondition  = readData & !writeData;

  always @(posedge readCondition) begin
    buffer[address] = inData;
  end
 
  always @(posedge writeData) begin
    outData = buffer[address];
  end

endmodule  // comm_paralel
