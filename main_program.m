
TOP069;
CAR069;
VOL069;

  %-----Montagem da matriz de admitâncias primitivas-----%
  distancia = 0;
  Ypr = zeros(rows(topologia) , rows(topologia));
  
  for( i=1:rows(topologia))
     distancia = topologia(i, 3);
     
     % matrizAd = | Ya Yab   Yca |
     %            |Yab  Yb   Ybc |
     %            |Yca  Ybc   Yc |
     
     matrizAd = [ 1 / (topologia(i, 4) + i*topologia(i, 5)) , 1 / (topologia(i, 6) + i*topologia(i, 7)) , 1 / (topologia(i, 8) + i*topologia(i, 9))
                  1 / (topologia(i,10) + i*topologia(i,11)) , 1 / (topologia(i,12) + i*topologia(i,13)) , 1 / (topologia(i,14) + i*topologia(i,15))
                ];
                
     matrizAd = (1 / distancia) * matrizAd;
     
     %Não existem mútuas entre os ramos
     Ypr(i,i) = matrizAd;     
  end;
  
  %-----Montagem da matriz de incidências Q-----%
  
  countNos = 35;
  countRamos = rows(topologia);
  um = eye(3);
  zero = zeroes(3);
  
  Q = zeroes(countRamos, countNos);
  
  for(i = 1:countRamos)  
    Q( i , topologia(i,1)/10) = um;
    Q( i , topologia(i,2)/10) = -1 * um;  
  end;
  
  for(i = 1:countRamos)
    for(j = 1:countNos)
      if((Q(i,j) != um ) || Q(i,j) != -1 * um)
        Q(i,j) = zero;
      end;
    end;
  end;
  
 
  
  

%%endfunction
