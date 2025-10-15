module LAB7_3 #(parameter shift_size = 8)(
    input  [7:0] in,
    output reg [3:0] hunds, tens, ones
);
    integer i;
    reg [7:0] bin;
    
    always @(*) begin
        bin   = in;
        hunds = 0;
        tens  = 0;
        ones  = 0;
        for (i = 0; i < shift_size; i = i + 1) begin
            if (hunds >= 5)
                hunds = hunds + 3;
            if (tens >= 5)
                tens = tens + 3;
            if (ones >= 5)
                ones = ones + 3;
            {hunds, tens, ones, bin} = {hunds, tens, ones, bin} << 1;
        end
    end
endmodule

// --------------------------------------------------------------------
// module LAB7_3 #(parameter shift_size=8)(
//     input [7:0] in,
//     output reg [3:0] hunds, tens, ones
// );
//     integer i;
//     reg [19:0] temp;
//     always @(*) begin
//         temp = 0;
//         temp[7:0] = in;
//         for (i = 0; i < shift_size; i = i + 1) begin
//             if (temp[11:8] >= 5)
//                 temp[11:8] = temp[11:8] + 3;
//             if (temp[15:12] >= 5)
//                 temp[15:12] = temp[15:12] + 3;
//             if (temp[19:16] >= 5)
//                 temp[19:16] = temp[19:16] + 3;
//             temp = temp << 1;
//         end
//         ones  = temp[11:8];
//         tens  = temp[15:12];
//         hunds = temp[19:16];
//     end

// endmodule //LAB7_3
