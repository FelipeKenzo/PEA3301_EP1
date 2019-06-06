
TOP069;
CAR069;
VOL069;

  %-----Montagem da matriz de admitâncias primitivas-----%
  distancia = 0;
  Ypr = zeros(3*rows(topologia) , 3*rows(topologia));
  
  k=1;
  for( i=1:rows(topologia))
     k=3*i-2;
     distancia = topologia(i, 3);
     
     % matrizAd = | Ya   0   0 |
     %            |  0  Yb   0 |
     %            |  0   0  Yc |
     
     matrizAd = [ 1 / (topologia(i, 4) + j*topologia(i, 5)) , 1 / (topologia(i, 6) + j*topologia(i, 7)) , 1 / (topologia(i, 8) + j*topologia(i, 9))
                  1 / (topologia(i,10) + j*topologia(i,11)) , 1 / (topologia(i,12) + j*topologia(i,13)) , 1 / (topologia(i,14) + j*topologia(i,15))
                  1 / (topologia(i,16) + j*topologia(i,17)) , 1 / (topologia(i,18) + j*topologia(i,19)) , 1 / (topologia(i,20) + j*topologia(i,21))
                ];
                
     matrizAd = (1 / distancia) * matrizAd;
     
     %Não existem mútuas entre os ramos
     Ypr(k:k+2,k:k+2) = matrizAd;  
        
  end;
  
  %-----Montagem da matriz de incidências Q-----%
  
  countNos = 35;
  countRamos = rows(topologia);
  um = eye(3);
  zero = zeros(3);
  
  Q = zeros(3*countRamos, 3*countNos);
  
  k=1;
  for(i=1 : countRamos)
    k = 3*i-2;
    p = topologia(i,1)/10; %pai (barra inicial)
    f = topologia(i,2)/10; %filho (barra final)
  
    Q( k:k+2 , 3*p-2:3*p) = um;
    Q( k:k+2 , 3*f-2:3*f) = -1 * um;
    
  end;  

  
  for(i = 1:3:3*countRamos)
    for(j = 1:3:3*countNos)
      if((Q(i:i+2,j:j+2) != um ) || Q(i:i+2,j:j+2) != -1 * um)
        Q(i:i+2,j:j+2) = zero;
      end;
    end;
  end;
 
 
 Ybus=transpose(Q)*Ypr*Q;
 
 Yprf = zeros( 3*(rows(topologia)+1) , 3*(rows(topologia)+1) );
 Qf = zeros( 3*(countRamos+1) , 3*(countNos+1) );
  
  

%%endfunction
