`include "src/lcd.sv"
module top (
    /** Input Ports */
    input logic CLK,

    /** Output Ports */
    output logic LCD_DEN,
    output logic [4:0] LCD_B,
    output logic [5:0] LCD_G,
    output logic [4:0] LCD_R
);

/** Logic */
lcd lcdtest(
    .pclk(CLK),
    .LCD_DE(LCD_DEN),
    .LCD_B(LCD_B),
    .LCD_G(LCD_G),
    .LCD_R(LCD_R)
);

endmodule