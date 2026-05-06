module lcd
(
  input logic pclk,        

  output logic LCD_DE,      // Display Enable

  output logic [4:0] LCD_B, // 5-bit blue color data
  output logic [5:0] LCD_G, // 6-bit green color data
  output logic [4:0] LCD_R  // 5-bit red color data
);

int currx = 0;
int curry = 0;

always @ (posedge pclk)begin
  if (currx == 524)begin
    currx <= 0;
    if (curry == 284)begin
      curry <= 0;
    end
    else begin
      curry <= curry + 1;
    end
  end
  else begin
    currx <= currx + 1;
  end

  if (currx < 480 && curry < 272) begin
    LCD_DE <= 1;
    if (currx < 160)begin
      LCD_R <= 5'b11111;
      LCD_G <= 6'b000000;
      LCD_B <= 5'b00000;
    end
    else if (currx < 320 && currx >= 160)begin
      LCD_R <= 5'b00000;
      LCD_G <= 6'b111111;
      LCD_B <= 5'b00000;
    end
    else begin
      LCD_R <= 5'b00000;
      LCD_G <= 6'b000000;
      LCD_B <= 5'b11111;
    end
  end
  else begin
    LCD_DE <= 0;
  end
end

endmodule