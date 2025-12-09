module scr1_and_instr_mon(
  input logic clk,
  input logic imem_resp,
  input logic [32-1:0] imem_rdata
);

always_ff @( posedge clk ) begin 
  if (imem_resp) begin
    if (imem_rdata[6:0] == 7'b0110011 && imem_rdata[14:12] == 3'b111 && imem_rdata[31:25] == '0) begin
      $display("[T=%t] AND. Opcode: %b; RD: %b, Funct3: %b, RS1: %b, RS2: %b, Funct:7 %b", 
                $realtime, imem_rdata[6:0], imem_rdata[11:7], imem_rdata[14:12], imem_rdata[19:15], imem_rdata[24:20], imem_rdata[31:25]);
    end
  end
end

endmodule