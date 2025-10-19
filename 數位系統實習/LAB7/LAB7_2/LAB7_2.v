module LAB7_2 #(parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11) (
    input clk,in,rst,
    output reg Z1,Z2,
    output reg [1:0] out_state
);
    reg [1:0] state,next_state,x;
    reg w_Z2;
    always @(state,in) begin
		w_Z2 = 0;
        case(state)
            s0: 
				begin
				next_state = in ? s1 : s0;
				x=(next_state==s0) ? s0:s0;
				//x=(next_state==s0) ? s0:s0;
				end
            s1: 
				begin
				next_state = in ? s2 : s0;
				//Z2=in? 0:0;
				x=(next_state==s0) ? s1:s0;
				end
            s2: 
				begin
				next_state = in ? s3 : s0;
				//Z2=in? 0:0;
				x=(next_state==s0) ? s2:s0;
				end
            s3: 
				begin
				next_state = in? s3 : s0;
				w_Z2= in? 0:1;
				x=(next_state==s0) ? s3:s0;
				end
            default: next_state = s0;
        endcase
        Z1=(state==s3)? 1:0;
        //w_Z2=(x==s3&&state==s0)? 1:0;
    end
    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            state <= s0;
            Z2 <= 0;
        end
        else begin
            state <= next_state;
            Z2 <= w_Z2;
        end
            out_state <= next_state;
        
    end
endmodule //LAB7_2