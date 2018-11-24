module control_unit( input clk,input[5:0] opcode, input reset, output reg[1:0] reg_dst,memto_reg,alu_op, output reg jump,branch,mem_read,mem_write,alu_src,reg_write,sign_or_zero);  
 
always @(posedge clk)  
begin 

if(reset == 1'b1) 
begin
reg_dst = 2'b00;  
memto_reg = 2'b00;  
alu_op = 2'b00;  
jump = 1'b0;  
branch = 1'b0;  
mem_read = 1'b0;  
mem_write = 1'b0;  
alu_src = 1'b0;  
reg_write = 1'b0;  
sign_or_zero = 1'b1;  
end  
      
else 
begin  
    case(opcode)   
    6'b000000:  begin  //control lines for add instruction  
                reg_dst = 2'b01;  
                memto_reg = 2'b00;  
                alu_op = 2'b00;  
                jump = 1'b0;  
                branch = 1'b0;  
                mem_read = 1'b0;  
                mem_write = 1'b0;  
                alu_src = 1'b0;  
                reg_write = 1'b1;  
                sign_or_zero = 1'b1;  
                end  
        
    6'b000010:  begin //control lines for j instruction  
                reg_dst = 2'b00;  
                memto_reg = 2'b00;  
                alu_op = 2'b00;  
                jump = 1'b1;  
                branch = 1'b0;  
                mem_read = 1'b0;  
                mem_write = 1'b0;  
                alu_src = 1'b0;  
                reg_write = 1'b0;  
                sign_or_zero = 1'b1;  
                end  
    6'b000011:  begin //control lines for jal instruction   
                reg_dst = 2'b10;  
                memto_reg = 2'b10;  
                alu_op = 2'b00;  
                jump = 1'b1;  
                branch = 1'b0;  
                mem_read = 1'b0;  
                mem_write = 1'b0;  
                alu_src = 1'b0;  
                reg_write = 1'b1;  
                sign_or_zero = 1'b1;  
                end  
    6'b100011:  begin //control lines for lw instruction 
                reg_dst = 2'b00;  
                memto_reg = 2'b01;  
                alu_op = 2'b11;  
                jump = 1'b0;  
                branch = 1'b0;  
                mem_read = 1'b1;  
                mem_write = 1'b0;  
                alu_src = 1'b1;  
                reg_write = 1'b1;  
                sign_or_zero = 1'b1;  
                end  
    6'b101011:  begin //control lines for sw instruction 
                reg_dst = 2'b00;  
                memto_reg = 2'b00;  
                alu_op = 2'b11;  
                jump = 1'b0;  
                branch = 1'b0;  
                mem_read = 1'b0;  
                mem_write = 1'b1;  
                alu_src = 1'b1;  
                reg_write = 1'b0;  
                sign_or_zero = 1'b1;  
                end  
    6'b000100:  begin //control lines for beq instruction  
                reg_dst = 2'b00;  
                memto_reg = 2'b00;  
                alu_op = 2'b01;  
                jump = 1'b0;  
                branch = 1'b1;  
                mem_read = 1'b0;  
                mem_write = 1'b0;  
                alu_src = 1'b0;  
                reg_write = 1'b0;  
                sign_or_zero = 1'b1;  
                end
endcase  
end  

end  


endmodule  