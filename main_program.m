function [retval] = main_program (TOP, CAR, VOL)
  
  %Montagem da matriz de admitancias primitivas
  distancia = 0;
  Ypr = zeros(rows(TOP) , rows(TOP));
  
  for( i=1:rows(TOP))
     distancia = TOP(i, 3);
     
     % matrizAd = | Ya Yab   Yca |
     %            |Yab  Yb   Ybc |
     %            |Yca  Ybc   Yc |
     
     matrizAd = [ 1 / (TOP(i, 4) + i*TOP(i, 5)) , 1 / (TOP(i, 6) + i*TOP(i, 7)) , 1 / (TOP(i, 8) + i*TOP(i, 9))
                  1 / (TOP(i,10) + i*TOP(i,11)) , 1 / (TOP(i,12) + i*TOP(i,13)) , 1 / (TOP(i,14) + i*TOP(i,15))
                ];
                
     matrizAd = (1 / distancia) * matrizAd;
     
     %Não existem mútuas entre os ramos
     Ypr(i,i) = matrizAd;     
  end;
  
  

endfunction
