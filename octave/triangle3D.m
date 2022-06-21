function to2D_triangle(v1,v2,v3, res)
  BRIGHTNESS = 1000;
  L = res
  C = res
  P = res
  line = zeros(L,C,P);

   dist1 = v1 - v2
   dist2 = v2 - v3
   dist3 = v1 - v3

   mod_dist1 = sqrt(dist1(1)^2 + dist1(2)^2 + dist1(3)^2)
   mod_dist2 = sqrt(dist3(1)^2 + dist3(2)^2 + dist3(3)^2)
   mod_dist3 = sqrt(dist2(1)^2 + dist2(2)^2 + dist2(3)^2)

    if(mod_dist1 > mod_dist2 && mod_dist1 > mod_dist3)
      init = v1
      final = v2
      fixo = v3
    else if(mod_dist2 > mod_dist1 && mod_dist2 > mod_dist3)
      init = v3
      final = v2
      fixo = v1
    else if(mod_dist3 > mod_dist2 && mod_dist3 > mod_dist1)
      init = v1
      final = v3
      fixo = v2
    endif
    endif
    endif

    if init(1) > final(1)
     n_max(1) = init(1) - final(1);
   else
     n_max(1) = final(1) - init(1);
   endif
  if init(2) > final(2)
     n_max(2) = init(2) - final(2);
   else
     n_max(2) = final(2) - init(2);
   endif
   if init(3) > final(3)
     n_max(3) = init(3) - final(3);
   else
     n_max(3) = final(3) - init(3);
   endif

   N = max(n_max);
   deltaT = 1/N;

    for i=0:N
      tk = deltaT * i;
      p = (1-tk)*init + tk*final;
      x = int8(p(1));
      y = int8(p(2));
      z = int8(p(3));
      line(max(x, 1),max(y, 1),max(z, 1)) = 1;

      if p(1) > fixo(1)
         n_max(1) = p(1) - fixo(1);
      else
         n_max(1) = fixo(1) - p(1);
      endif
      if p(2) > fixo(2)
        n_max(2) = p(2) - fixo(2);
      else
         n_max(2) = fixo(2) - p(2);
      endif
      if p(3) > fixo(3)
        n_max(3) = p(3) - fixo(3);
      else
        n_max(3) = fixo(3) - p(3);
      endif
      new_N = max(n_max)

       for j=0:new_N
        deltaT2 = 1/new_N;
        tk2 = deltaT2 * j;
        p2 = (1-tk2)*p + tk2*fixo;
        x = int8(p2(1));
        y = int8(p2(2));
        z = int8(p2(3));
        line(max(x, 1),max(y, 1),max(z, 1)) = 1;

      endfor
    endfor;

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