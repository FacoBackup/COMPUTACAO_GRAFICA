function to2D(v1,v2, res)
  BRIGHTNESS = 1000;
  L = res
  C = res
  P = res
  line = zeros(L,C,P);

  xX = abs(v1(1) - v2(1))
  yY = abs(v1(2) - v2(2))
  zZ = abs(v1(3) - v2(3))
  [n] = max([xX yY zZ])
  deltaT = 1/n

  for i = 0:n
      tk = deltaT * i;
      p = (1-tk)*v1 + tk*v2;
      x = int8(p(1));
      y = int8(p(2));
      z = int8(p(3));
      line(max(x, 1),max(y, 1),max(z, 1)) = 1;
  endfor

  line2d = zeros(L,C);
  for x = 1:L
    for y = 1:C
      for z = 1:P
        if(line(x,y,z) == 1)
          line2d(x,y) =  min(max(BRIGHTNESS/z.^2,0.1), 1.);
        end
      end
    end
  end

  imshow(line2d)

endfunction