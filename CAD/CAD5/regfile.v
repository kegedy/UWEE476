// EE476/477 baseline register file model
// - 16-bits X 13 registers (the general purpose registers)

module regfile (
   output reg [15:0] rd_data_0, // Read output
   output reg [15:0] rd_data_1, // Read output
   input [3:0]       rd_addr_0, // Read address
   input [3:0]       rd_addr_1, // Read address
   input [3:0]       wr_addr,   // Write address
   input [15:0]      wr_data,   // Write data
   input             wr_en,     // Write enable (high true)
   input             clk        // Clock
);

   // Register storage
   reg [15:0] REG [0:12];

   // Read behavior
   // - High Z if the address is greater than 12
   always@ (*) begin
      rd_data_0 = (rd_addr_0 < 13)? REG[rd_addr_0] : 16'hzzzz;
      rd_data_1 = (rd_addr_1 < 13)? REG[rd_addr_1] : 16'hzzzz;
   end

   // Write behavior
   always @ (posedge clk) begin
      if ((wr_en == 1) && (wr_addr < 13)) begin
         REG[wr_addr] <= wr_data;
      end
   end

endmodule
