function retval = admittances (Q, Ad)
  #Matriz Q descreve a topologia do grafo

  Qt = Q';
  
  #Define a matriz de admitancias proprias
  Yp = zeros(size(Ad), size(Ad));  
  for(i = 1:size(Ad))
    for(j = 1:size(Ad))
      if (i = j)
        Yp(i,j) = Ad(i);
      end;
    end;
  end;
  
  retval = Qt * Yp * Q;
  
endfunction
