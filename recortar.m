function recorteNivel=recortar(datos,mesInicio,mesFinal,diaInicio,diaFinal)
ancho=length(datos(:,1));

for i=1:ancho
if (((mesInicio==datos(i,2)) && (diaInicio == datos(i,3))) && (0 ==  datos(i,4)))
  
  inicio=i;
endif
if (((mesFinal == datos(i,2) ) && (diaFinal ==  datos(i,3))) && (00 ==  datos(i,4)))
  
  final=i+23;
endif


end
recorteNivel=datos(inicio:final,:);
return;
end