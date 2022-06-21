function to2D(matrix)
  BRIGHTNESS = 1000;
  [R C D] = size(matrix);

  DATA_2D = zeros(R,C);
  for x = 1:R
    for y = 1:C
      for z = 1:D
        if(matrix(x,y,z) == 1)
          DATA_2D(x,y) = 1 -  min(max(BRIGHTNESS/z.^2,0.1), .75);
        end
      end
    end
  end

  imshow(DATA_2D)

endfunction