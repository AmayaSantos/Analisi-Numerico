archivo=csvread('datos.csv');
obetnerSerieFurier(archivo(:,6));


%{
principiosDeEnero=recortar(archivo,1,1,1,14);
nivel1=principiosDeEnero(:,6);
obetnerSerieFurier(nivel1);
}%



%{
FinDeEnero=recortar(archivo,1,1,15,31);
nivel2=FinDeEnero(:,6);

obetnerSerieFurier(nivel2);
}%


%{
los datos de enero y febrero;
EneroFebrero=recortar(archivo,1,2,1,28);
nivel3=EneroFebrero(:,6);
obetnerSerieFurier(nivel3);
}%


%{
• los datos de marzo y abril.
MarzoAbril=recortar(archivo,3,4,1,30);
nivel4=MarzoAbril(:,6);
obetnerSerieFurier(nivel4);
}%