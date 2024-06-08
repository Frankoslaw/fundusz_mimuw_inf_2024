module cla_adder (
    input [31:0] a,
    input [31:0] b,
    input c_in,
    output c_out,
    output [31:0] sum
);
    wire [31:0] ci;

    // assign ci[0] = c_in;
    // assign ci[1] = (a[0] & b[0]) | ((a[0]^b[0]) & ci[0]);
    // assign ci[2] = (a[1] & b[1]) | ((a[1]^b[1]) & ((a[0] & b[0]) | ((a[0]^b[0]) & ci[0])));
    // assign ci[3] = (a[2] & b[2]) | ((a[2]^b[2]) & ((a[1] & b[1]) | ((a[1]^b[1]) & ((a[0] & b[0]) | ((a[0]^b[0]) & ci[0])))));
    // assign c_out = (a[3] & b[3]) | ((a[3]^b[3]) & ((a[2] & b[2]) | ((a[2]^b[2]) & ((a[1] & b[1]) | ((a[1]^b[1]) & ((a[0] & b[0]) | ((a[0]^b[0]) & ci[0])))))));

    assign ci[0] = c_in;
    assign ci[1] = (a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in));
    assign ci[2] = (a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))));
    assign ci[3] = (a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))));
    assign ci[4] = (a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))));
    assign ci[5] = (a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))))));
    assign ci[6] = (a[5] & b[5]) | ((a[5] ^ b[5]) & ((a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))))))));
    assign ci[7] = (a[6] & b[6]) | ((a[6] ^ b[6]) & ((a[5] & b[5]) | ((a[5] ^ b[5]) & ((a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))))))))));
    assign ci[8] = (a[7] & b[7]) | ((a[7] ^ b[7]) & ((a[6] & b[6]) | ((a[6] ^ b[6]) & ((a[5] & b[5]) | ((a[5] ^ b[5]) & ((a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))))))))))));
    assign ci[9] = (a[8] & b[8]) | ((a[8] ^ b[8]) & ((a[7] & b[7]) | ((a[7] ^ b[7]) & ((a[6] & b[6]) | ((a[6] ^ b[6]) & ((a[5] & b[5]) | ((a[5] ^ b[5]) & ((a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))))))))))))));
    assign ci[10] = (a[9] & b[9]) | ((a[9] ^ b[9]) & ((a[8] & b[8]) | ((a[8] ^ b[8]) & ((a[7] & b[7]) | ((a[7] ^ b[7]) & ((a[6] & b[6]) | ((a[6] ^ b[6]) & ((a[5] & b[5]) | ((a[5] ^ b[5]) & ((a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))))))))))))))));
    assign ci[11] = (a[10] & b[10]) | ((a[10] ^ b[10]) & ((a[9] & b[9]) | ((a[9] ^ b[9]) & ((a[8] & b[8]) | ((a[8] ^ b[8]) & ((a[7] & b[7]) | ((a[7] ^ b[7]) & ((a[6] & b[6]) | ((a[6] ^ b[6]) & ((a[5] & b[5]) | ((a[5] ^ b[5]) & ((a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))))))))))))))))));
    assign ci[12] = (a[11] & b[11]) | ((a[11] ^ b[11]) & ((a[10] & b[10]) | ((a[10] ^ b[10]) & ((a[9] & b[9]) | ((a[9] ^ b[9]) & ((a[8] & b[8]) | ((a[8] ^ b[8]) & ((a[7] & b[7]) | ((a[7] ^ b[7]) & ((a[6] & b[6]) | ((a[6] ^ b[6]) & ((a[5] & b[5]) | ((a[5] ^ b[5]) & ((a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))))))))))))))))))));
    assign ci[13] = (a[12] & b[12]) | ((a[12] ^ b[12]) & ((a[11] & b[11]) | ((a[11] ^ b[11]) & ((a[10] & b[10]) | ((a[10] ^ b[10]) & ((a[9] & b[9]) | ((a[9] ^ b[9]) & ((a[8] & b[8]) | ((a[8] ^ b[8]) & ((a[7] & b[7]) | ((a[7] ^ b[7]) & ((a[6] & b[6]) | ((a[6] ^ b[6]) & ((a[5] & b[5]) | ((a[5] ^ b[5]) & ((a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))))))))))))))))))))));
    assign ci[14] = (a[13] & b[13]) | ((a[13] ^ b[13]) & ((a[12] & b[12]) | ((a[12] ^ b[12]) & ((a[11] & b[11]) | ((a[11] ^ b[11]) & ((a[10] & b[10]) | ((a[10] ^ b[10]) & ((a[9] & b[9]) | ((a[9] ^ b[9]) & ((a[8] & b[8]) | ((a[8] ^ b[8]) & ((a[7] & b[7]) | ((a[7] ^ b[7]) & ((a[6] & b[6]) | ((a[6] ^ b[6]) & ((a[5] & b[5]) | ((a[5] ^ b[5]) & ((a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))))))))))))))))))))))));
    assign ci[15] = (a[14] & b[14]) | ((a[14] ^ b[14]) & ((a[13] & b[13]) | ((a[13] ^ b[13]) & ((a[12] & b[12]) | ((a[12] ^ b[12]) & ((a[11] & b[11]) | ((a[11] ^ b[11]) & ((a[10] & b[10]) | ((a[10] ^ b[10]) & ((a[9] & b[9]) | ((a[9] ^ b[9]) & ((a[8] & b[8]) | ((a[8] ^ b[8]) & ((a[7] & b[7]) | ((a[7] ^ b[7]) & ((a[6] & b[6]) | ((a[6] ^ b[6]) & ((a[5] & b[5]) | ((a[5] ^ b[5]) & ((a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))))))))))))))))))))))))));
    assign ci[16] = (a[15] & b[15]) | ((a[15] ^ b[15]) & ((a[14] & b[14]) | ((a[14] ^ b[14]) & ((a[13] & b[13]) | ((a[13] ^ b[13]) & ((a[12] & b[12]) | ((a[12] ^ b[12]) & ((a[11] & b[11]) | ((a[11] ^ b[11]) & ((a[10] & b[10]) | ((a[10] ^ b[10]) & ((a[9] & b[9]) | ((a[9] ^ b[9]) & ((a[8] & b[8]) | ((a[8] ^ b[8]) & ((a[7] & b[7]) | ((a[7] ^ b[7]) & ((a[6] & b[6]) | ((a[6] ^ b[6]) & ((a[5] & b[5]) | ((a[5] ^ b[5]) & ((a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))))))))))))))))))))))))))));
    assign ci[17] = (a[16] & b[16]) | ((a[16] ^ b[16]) & ((a[15] & b[15]) | ((a[15] ^ b[15]) & ((a[14] & b[14]) | ((a[14] ^ b[14]) & ((a[13] & b[13]) | ((a[13] ^ b[13]) & ((a[12] & b[12]) | ((a[12] ^ b[12]) & ((a[11] & b[11]) | ((a[11] ^ b[11]) & ((a[10] & b[10]) | ((a[10] ^ b[10]) & ((a[9] & b[9]) | ((a[9] ^ b[9]) & ((a[8] & b[8]) | ((a[8] ^ b[8]) & ((a[7] & b[7]) | ((a[7] ^ b[7]) & ((a[6] & b[6]) | ((a[6] ^ b[6]) & ((a[5] & b[5]) | ((a[5] ^ b[5]) & ((a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))))))))))))))))))))))))))))));
    assign ci[18] = (a[17] & b[17]) | ((a[17] ^ b[17]) & ((a[16] & b[16]) | ((a[16] ^ b[16]) & ((a[15] & b[15]) | ((a[15] ^ b[15]) & ((a[14] & b[14]) | ((a[14] ^ b[14]) & ((a[13] & b[13]) | ((a[13] ^ b[13]) & ((a[12] & b[12]) | ((a[12] ^ b[12]) & ((a[11] & b[11]) | ((a[11] ^ b[11]) & ((a[10] & b[10]) | ((a[10] ^ b[10]) & ((a[9] & b[9]) | ((a[9] ^ b[9]) & ((a[8] & b[8]) | ((a[8] ^ b[8]) & ((a[7] & b[7]) | ((a[7] ^ b[7]) & ((a[6] & b[6]) | ((a[6] ^ b[6]) & ((a[5] & b[5]) | ((a[5] ^ b[5]) & ((a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))))))))))))))))))))))))))))))));
    assign ci[19] = (a[18] & b[18]) | ((a[18] ^ b[18]) & ((a[17] & b[17]) | ((a[17] ^ b[17]) & ((a[16] & b[16]) | ((a[16] ^ b[16]) & ((a[15] & b[15]) | ((a[15] ^ b[15]) & ((a[14] & b[14]) | ((a[14] ^ b[14]) & ((a[13] & b[13]) | ((a[13] ^ b[13]) & ((a[12] & b[12]) | ((a[12] ^ b[12]) & ((a[11] & b[11]) | ((a[11] ^ b[11]) & ((a[10] & b[10]) | ((a[10] ^ b[10]) & ((a[9] & b[9]) | ((a[9] ^ b[9]) & ((a[8] & b[8]) | ((a[8] ^ b[8]) & ((a[7] & b[7]) | ((a[7] ^ b[7]) & ((a[6] & b[6]) | ((a[6] ^ b[6]) & ((a[5] & b[5]) | ((a[5] ^ b[5]) & ((a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))))))))))))))))))))))))))))))))));
    assign ci[20] = (a[19] & b[19]) | ((a[19] ^ b[19]) & ((a[18] & b[18]) | ((a[18] ^ b[18]) & ((a[17] & b[17]) | ((a[17] ^ b[17]) & ((a[16] & b[16]) | ((a[16] ^ b[16]) & ((a[15] & b[15]) | ((a[15] ^ b[15]) & ((a[14] & b[14]) | ((a[14] ^ b[14]) & ((a[13] & b[13]) | ((a[13] ^ b[13]) & ((a[12] & b[12]) | ((a[12] ^ b[12]) & ((a[11] & b[11]) | ((a[11] ^ b[11]) & ((a[10] & b[10]) | ((a[10] ^ b[10]) & ((a[9] & b[9]) | ((a[9] ^ b[9]) & ((a[8] & b[8]) | ((a[8] ^ b[8]) & ((a[7] & b[7]) | ((a[7] ^ b[7]) & ((a[6] & b[6]) | ((a[6] ^ b[6]) & ((a[5] & b[5]) | ((a[5] ^ b[5]) & ((a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))))))))))))))))))))))))))))))))))));
    assign ci[21] = (a[20] & b[20]) | ((a[20] ^ b[20]) & ((a[19] & b[19]) | ((a[19] ^ b[19]) & ((a[18] & b[18]) | ((a[18] ^ b[18]) & ((a[17] & b[17]) | ((a[17] ^ b[17]) & ((a[16] & b[16]) | ((a[16] ^ b[16]) & ((a[15] & b[15]) | ((a[15] ^ b[15]) & ((a[14] & b[14]) | ((a[14] ^ b[14]) & ((a[13] & b[13]) | ((a[13] ^ b[13]) & ((a[12] & b[12]) | ((a[12] ^ b[12]) & ((a[11] & b[11]) | ((a[11] ^ b[11]) & ((a[10] & b[10]) | ((a[10] ^ b[10]) & ((a[9] & b[9]) | ((a[9] ^ b[9]) & ((a[8] & b[8]) | ((a[8] ^ b[8]) & ((a[7] & b[7]) | ((a[7] ^ b[7]) & ((a[6] & b[6]) | ((a[6] ^ b[6]) & ((a[5] & b[5]) | ((a[5] ^ b[5]) & ((a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))))))))))))))))))))))))))))))))))))));
    assign ci[22] = (a[21] & b[21]) | ((a[21] ^ b[21]) & ((a[20] & b[20]) | ((a[20] ^ b[20]) & ((a[19] & b[19]) | ((a[19] ^ b[19]) & ((a[18] & b[18]) | ((a[18] ^ b[18]) & ((a[17] & b[17]) | ((a[17] ^ b[17]) & ((a[16] & b[16]) | ((a[16] ^ b[16]) & ((a[15] & b[15]) | ((a[15] ^ b[15]) & ((a[14] & b[14]) | ((a[14] ^ b[14]) & ((a[13] & b[13]) | ((a[13] ^ b[13]) & ((a[12] & b[12]) | ((a[12] ^ b[12]) & ((a[11] & b[11]) | ((a[11] ^ b[11]) & ((a[10] & b[10]) | ((a[10] ^ b[10]) & ((a[9] & b[9]) | ((a[9] ^ b[9]) & ((a[8] & b[8]) | ((a[8] ^ b[8]) & ((a[7] & b[7]) | ((a[7] ^ b[7]) & ((a[6] & b[6]) | ((a[6] ^ b[6]) & ((a[5] & b[5]) | ((a[5] ^ b[5]) & ((a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))))))))))))))))))))))))))))))))))))))));
    assign ci[23] = (a[22] & b[22]) | ((a[22] ^ b[22]) & ((a[21] & b[21]) | ((a[21] ^ b[21]) & ((a[20] & b[20]) | ((a[20] ^ b[20]) & ((a[19] & b[19]) | ((a[19] ^ b[19]) & ((a[18] & b[18]) | ((a[18] ^ b[18]) & ((a[17] & b[17]) | ((a[17] ^ b[17]) & ((a[16] & b[16]) | ((a[16] ^ b[16]) & ((a[15] & b[15]) | ((a[15] ^ b[15]) & ((a[14] & b[14]) | ((a[14] ^ b[14]) & ((a[13] & b[13]) | ((a[13] ^ b[13]) & ((a[12] & b[12]) | ((a[12] ^ b[12]) & ((a[11] & b[11]) | ((a[11] ^ b[11]) & ((a[10] & b[10]) | ((a[10] ^ b[10]) & ((a[9] & b[9]) | ((a[9] ^ b[9]) & ((a[8] & b[8]) | ((a[8] ^ b[8]) & ((a[7] & b[7]) | ((a[7] ^ b[7]) & ((a[6] & b[6]) | ((a[6] ^ b[6]) & ((a[5] & b[5]) | ((a[5] ^ b[5]) & ((a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))))))))))))))))))))))))))))))))))))))))));
    assign ci[24] = (a[23] & b[23]) | ((a[23] ^ b[23]) & ((a[22] & b[22]) | ((a[22] ^ b[22]) & ((a[21] & b[21]) | ((a[21] ^ b[21]) & ((a[20] & b[20]) | ((a[20] ^ b[20]) & ((a[19] & b[19]) | ((a[19] ^ b[19]) & ((a[18] & b[18]) | ((a[18] ^ b[18]) & ((a[17] & b[17]) | ((a[17] ^ b[17]) & ((a[16] & b[16]) | ((a[16] ^ b[16]) & ((a[15] & b[15]) | ((a[15] ^ b[15]) & ((a[14] & b[14]) | ((a[14] ^ b[14]) & ((a[13] & b[13]) | ((a[13] ^ b[13]) & ((a[12] & b[12]) | ((a[12] ^ b[12]) & ((a[11] & b[11]) | ((a[11] ^ b[11]) & ((a[10] & b[10]) | ((a[10] ^ b[10]) & ((a[9] & b[9]) | ((a[9] ^ b[9]) & ((a[8] & b[8]) | ((a[8] ^ b[8]) & ((a[7] & b[7]) | ((a[7] ^ b[7]) & ((a[6] & b[6]) | ((a[6] ^ b[6]) & ((a[5] & b[5]) | ((a[5] ^ b[5]) & ((a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))))))))))))))))))))))))))))))))))))))))))));
    assign ci[25] = (a[24] & b[24]) | ((a[24] ^ b[24]) & ((a[23] & b[23]) | ((a[23] ^ b[23]) & ((a[22] & b[22]) | ((a[22] ^ b[22]) & ((a[21] & b[21]) | ((a[21] ^ b[21]) & ((a[20] & b[20]) | ((a[20] ^ b[20]) & ((a[19] & b[19]) | ((a[19] ^ b[19]) & ((a[18] & b[18]) | ((a[18] ^ b[18]) & ((a[17] & b[17]) | ((a[17] ^ b[17]) & ((a[16] & b[16]) | ((a[16] ^ b[16]) & ((a[15] & b[15]) | ((a[15] ^ b[15]) & ((a[14] & b[14]) | ((a[14] ^ b[14]) & ((a[13] & b[13]) | ((a[13] ^ b[13]) & ((a[12] & b[12]) | ((a[12] ^ b[12]) & ((a[11] & b[11]) | ((a[11] ^ b[11]) & ((a[10] & b[10]) | ((a[10] ^ b[10]) & ((a[9] & b[9]) | ((a[9] ^ b[9]) & ((a[8] & b[8]) | ((a[8] ^ b[8]) & ((a[7] & b[7]) | ((a[7] ^ b[7]) & ((a[6] & b[6]) | ((a[6] ^ b[6]) & ((a[5] & b[5]) | ((a[5] ^ b[5]) & ((a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))))))))))))))))))))))))))))))))))))))))))))));
    assign ci[26] = (a[25] & b[25]) | ((a[25] ^ b[25]) & ((a[24] & b[24]) | ((a[24] ^ b[24]) & ((a[23] & b[23]) | ((a[23] ^ b[23]) & ((a[22] & b[22]) | ((a[22] ^ b[22]) & ((a[21] & b[21]) | ((a[21] ^ b[21]) & ((a[20] & b[20]) | ((a[20] ^ b[20]) & ((a[19] & b[19]) | ((a[19] ^ b[19]) & ((a[18] & b[18]) | ((a[18] ^ b[18]) & ((a[17] & b[17]) | ((a[17] ^ b[17]) & ((a[16] & b[16]) | ((a[16] ^ b[16]) & ((a[15] & b[15]) | ((a[15] ^ b[15]) & ((a[14] & b[14]) | ((a[14] ^ b[14]) & ((a[13] & b[13]) | ((a[13] ^ b[13]) & ((a[12] & b[12]) | ((a[12] ^ b[12]) & ((a[11] & b[11]) | ((a[11] ^ b[11]) & ((a[10] & b[10]) | ((a[10] ^ b[10]) & ((a[9] & b[9]) | ((a[9] ^ b[9]) & ((a[8] & b[8]) | ((a[8] ^ b[8]) & ((a[7] & b[7]) | ((a[7] ^ b[7]) & ((a[6] & b[6]) | ((a[6] ^ b[6]) & ((a[5] & b[5]) | ((a[5] ^ b[5]) & ((a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))))))))))))))))))))))))))))))))))))))))))))))));
    assign ci[27] = (a[26] & b[26]) | ((a[26] ^ b[26]) & ((a[25] & b[25]) | ((a[25] ^ b[25]) & ((a[24] & b[24]) | ((a[24] ^ b[24]) & ((a[23] & b[23]) | ((a[23] ^ b[23]) & ((a[22] & b[22]) | ((a[22] ^ b[22]) & ((a[21] & b[21]) | ((a[21] ^ b[21]) & ((a[20] & b[20]) | ((a[20] ^ b[20]) & ((a[19] & b[19]) | ((a[19] ^ b[19]) & ((a[18] & b[18]) | ((a[18] ^ b[18]) & ((a[17] & b[17]) | ((a[17] ^ b[17]) & ((a[16] & b[16]) | ((a[16] ^ b[16]) & ((a[15] & b[15]) | ((a[15] ^ b[15]) & ((a[14] & b[14]) | ((a[14] ^ b[14]) & ((a[13] & b[13]) | ((a[13] ^ b[13]) & ((a[12] & b[12]) | ((a[12] ^ b[12]) & ((a[11] & b[11]) | ((a[11] ^ b[11]) & ((a[10] & b[10]) | ((a[10] ^ b[10]) & ((a[9] & b[9]) | ((a[9] ^ b[9]) & ((a[8] & b[8]) | ((a[8] ^ b[8]) & ((a[7] & b[7]) | ((a[7] ^ b[7]) & ((a[6] & b[6]) | ((a[6] ^ b[6]) & ((a[5] & b[5]) | ((a[5] ^ b[5]) & ((a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))))))))))))))))))))))))))))))))))))))))))))))))));
    assign ci[28] = (a[27] & b[27]) | ((a[27] ^ b[27]) & ((a[26] & b[26]) | ((a[26] ^ b[26]) & ((a[25] & b[25]) | ((a[25] ^ b[25]) & ((a[24] & b[24]) | ((a[24] ^ b[24]) & ((a[23] & b[23]) | ((a[23] ^ b[23]) & ((a[22] & b[22]) | ((a[22] ^ b[22]) & ((a[21] & b[21]) | ((a[21] ^ b[21]) & ((a[20] & b[20]) | ((a[20] ^ b[20]) & ((a[19] & b[19]) | ((a[19] ^ b[19]) & ((a[18] & b[18]) | ((a[18] ^ b[18]) & ((a[17] & b[17]) | ((a[17] ^ b[17]) & ((a[16] & b[16]) | ((a[16] ^ b[16]) & ((a[15] & b[15]) | ((a[15] ^ b[15]) & ((a[14] & b[14]) | ((a[14] ^ b[14]) & ((a[13] & b[13]) | ((a[13] ^ b[13]) & ((a[12] & b[12]) | ((a[12] ^ b[12]) & ((a[11] & b[11]) | ((a[11] ^ b[11]) & ((a[10] & b[10]) | ((a[10] ^ b[10]) & ((a[9] & b[9]) | ((a[9] ^ b[9]) & ((a[8] & b[8]) | ((a[8] ^ b[8]) & ((a[7] & b[7]) | ((a[7] ^ b[7]) & ((a[6] & b[6]) | ((a[6] ^ b[6]) & ((a[5] & b[5]) | ((a[5] ^ b[5]) & ((a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))))))))))))))))))))))))))))))))))))))))))))))))))));
    assign ci[29] = (a[28] & b[28]) | ((a[28] ^ b[28]) & ((a[27] & b[27]) | ((a[27] ^ b[27]) & ((a[26] & b[26]) | ((a[26] ^ b[26]) & ((a[25] & b[25]) | ((a[25] ^ b[25]) & ((a[24] & b[24]) | ((a[24] ^ b[24]) & ((a[23] & b[23]) | ((a[23] ^ b[23]) & ((a[22] & b[22]) | ((a[22] ^ b[22]) & ((a[21] & b[21]) | ((a[21] ^ b[21]) & ((a[20] & b[20]) | ((a[20] ^ b[20]) & ((a[19] & b[19]) | ((a[19] ^ b[19]) & ((a[18] & b[18]) | ((a[18] ^ b[18]) & ((a[17] & b[17]) | ((a[17] ^ b[17]) & ((a[16] & b[16]) | ((a[16] ^ b[16]) & ((a[15] & b[15]) | ((a[15] ^ b[15]) & ((a[14] & b[14]) | ((a[14] ^ b[14]) & ((a[13] & b[13]) | ((a[13] ^ b[13]) & ((a[12] & b[12]) | ((a[12] ^ b[12]) & ((a[11] & b[11]) | ((a[11] ^ b[11]) & ((a[10] & b[10]) | ((a[10] ^ b[10]) & ((a[9] & b[9]) | ((a[9] ^ b[9]) & ((a[8] & b[8]) | ((a[8] ^ b[8]) & ((a[7] & b[7]) | ((a[7] ^ b[7]) & ((a[6] & b[6]) | ((a[6] ^ b[6]) & ((a[5] & b[5]) | ((a[5] ^ b[5]) & ((a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
    assign ci[30] = (a[29] & b[29]) | ((a[29] ^ b[29]) & ((a[28] & b[28]) | ((a[28] ^ b[28]) & ((a[27] & b[27]) | ((a[27] ^ b[27]) & ((a[26] & b[26]) | ((a[26] ^ b[26]) & ((a[25] & b[25]) | ((a[25] ^ b[25]) & ((a[24] & b[24]) | ((a[24] ^ b[24]) & ((a[23] & b[23]) | ((a[23] ^ b[23]) & ((a[22] & b[22]) | ((a[22] ^ b[22]) & ((a[21] & b[21]) | ((a[21] ^ b[21]) & ((a[20] & b[20]) | ((a[20] ^ b[20]) & ((a[19] & b[19]) | ((a[19] ^ b[19]) & ((a[18] & b[18]) | ((a[18] ^ b[18]) & ((a[17] & b[17]) | ((a[17] ^ b[17]) & ((a[16] & b[16]) | ((a[16] ^ b[16]) & ((a[15] & b[15]) | ((a[15] ^ b[15]) & ((a[14] & b[14]) | ((a[14] ^ b[14]) & ((a[13] & b[13]) | ((a[13] ^ b[13]) & ((a[12] & b[12]) | ((a[12] ^ b[12]) & ((a[11] & b[11]) | ((a[11] ^ b[11]) & ((a[10] & b[10]) | ((a[10] ^ b[10]) & ((a[9] & b[9]) | ((a[9] ^ b[9]) & ((a[8] & b[8]) | ((a[8] ^ b[8]) & ((a[7] & b[7]) | ((a[7] ^ b[7]) & ((a[6] & b[6]) | ((a[6] ^ b[6]) & ((a[5] & b[5]) | ((a[5] ^ b[5]) & ((a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
    assign ci[31] = (a[30] & b[30]) | ((a[30] ^ b[30]) & ((a[29] & b[29]) | ((a[29] ^ b[29]) & ((a[28] & b[28]) | ((a[28] ^ b[28]) & ((a[27] & b[27]) | ((a[27] ^ b[27]) & ((a[26] & b[26]) | ((a[26] ^ b[26]) & ((a[25] & b[25]) | ((a[25] ^ b[25]) & ((a[24] & b[24]) | ((a[24] ^ b[24]) & ((a[23] & b[23]) | ((a[23] ^ b[23]) & ((a[22] & b[22]) | ((a[22] ^ b[22]) & ((a[21] & b[21]) | ((a[21] ^ b[21]) & ((a[20] & b[20]) | ((a[20] ^ b[20]) & ((a[19] & b[19]) | ((a[19] ^ b[19]) & ((a[18] & b[18]) | ((a[18] ^ b[18]) & ((a[17] & b[17]) | ((a[17] ^ b[17]) & ((a[16] & b[16]) | ((a[16] ^ b[16]) & ((a[15] & b[15]) | ((a[15] ^ b[15]) & ((a[14] & b[14]) | ((a[14] ^ b[14]) & ((a[13] & b[13]) | ((a[13] ^ b[13]) & ((a[12] & b[12]) | ((a[12] ^ b[12]) & ((a[11] & b[11]) | ((a[11] ^ b[11]) & ((a[10] & b[10]) | ((a[10] ^ b[10]) & ((a[9] & b[9]) | ((a[9] ^ b[9]) & ((a[8] & b[8]) | ((a[8] ^ b[8]) & ((a[7] & b[7]) | ((a[7] ^ b[7]) & ((a[6] & b[6]) | ((a[6] ^ b[6]) & ((a[5] & b[5]) | ((a[5] ^ b[5]) & ((a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
    assign c_out = (a[31] & b[31]) | ((a[31] ^ b[31]) & ((a[30] & b[30]) | ((a[30] ^ b[30]) & ((a[29] & b[29]) | ((a[29] ^ b[29]) & ((a[28] & b[28]) | ((a[28] ^ b[28]) & ((a[27] & b[27]) | ((a[27] ^ b[27]) & ((a[26] & b[26]) | ((a[26] ^ b[26]) & ((a[25] & b[25]) | ((a[25] ^ b[25]) & ((a[24] & b[24]) | ((a[24] ^ b[24]) & ((a[23] & b[23]) | ((a[23] ^ b[23]) & ((a[22] & b[22]) | ((a[22] ^ b[22]) & ((a[21] & b[21]) | ((a[21] ^ b[21]) & ((a[20] & b[20]) | ((a[20] ^ b[20]) & ((a[19] & b[19]) | ((a[19] ^ b[19]) & ((a[18] & b[18]) | ((a[18] ^ b[18]) & ((a[17] & b[17]) | ((a[17] ^ b[17]) & ((a[16] & b[16]) | ((a[16] ^ b[16]) & ((a[15] & b[15]) | ((a[15] ^ b[15]) & ((a[14] & b[14]) | ((a[14] ^ b[14]) & ((a[13] & b[13]) | ((a[13] ^ b[13]) & ((a[12] & b[12]) | ((a[12] ^ b[12]) & ((a[11] & b[11]) | ((a[11] ^ b[11]) & ((a[10] & b[10]) | ((a[10] ^ b[10]) & ((a[9] & b[9]) | ((a[9] ^ b[9]) & ((a[8] & b[8]) | ((a[8] ^ b[8]) & ((a[7] & b[7]) | ((a[7] ^ b[7]) & ((a[6] & b[6]) | ((a[6] ^ b[6]) & ((a[5] & b[5]) | ((a[5] ^ b[5]) & ((a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & (c_in))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));

    assign sum = a^b^ci;
    
endmodule