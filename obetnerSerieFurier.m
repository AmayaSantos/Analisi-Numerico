function yt=obetnerSerieFurier(alturas)
[B,I] = sort(abs(fft(alturas)));
%bar(abs(fft(alturas)))
B(end-4:end)
B(end-8:2:end)
w=I(end-8:2:end);
periodo=length(alturas);
w0=2*pi/periodo;
  
x=[1:periodo];
y=alturas';
f1=ones(1,periodo);      
f2=cos(w0*w(end)*x);
f3=-sin(w0*w(end)*x);
f4=cos(w0*w(end-1)*x);
f5=-sin(w0*w(end-1)*x);
f6=cos(w0*w(end-2)*x);
f7=-sin(w0*w(end-2)*x);
f8=cos(w0*w(end-3)*x);
f9=-sin(w0*w(end-3)*x);



m=[
f1*f1' f1*f2' f1*f3' f1*f4' f1*f5' f1*f6' f1*f7' f1*f8' f1*f9';
f2*f1' f2*f2' f2*f3' f2*f4' f2*f5' f2*f6' f2*f7' f2*f8' f2*f9';
f3*f1' f3*f2' f3*f3' f3*f4' f3*f5' f3*f6' f3*f7' f3*f8' f3*f9';
f4*f1' f4*f2' f4*f3' f4*f4' f4*f5' f4*f6' f4*f7' f4*f8' f4*f9';
f5*f1' f5*f2' f5*f3' f5*f4' f5*f5' f5*f6' f5*f7' f5*f8' f5*f9';
f6*f1' f6*f2' f6*f3' f6*f4' f6*f5' f6*f6' f6*f7' f6*f8' f6*f9';
f7*f1' f7*f2' f7*f3' f7*f4' f7*f5' f7*f6' f7*f7' f7*f8' f7*f9';
f8*f1' f8*f2' f8*f3' f8*f4' f8*f5' f8*f6' f8*f7' f8*f8' f8*f9';
f9*f1' f9*f2' f9*f3' f9*f4' f9*f5' f9*f6' f9*f7' f9*f8' f9*f9';
];


b=[y*f1';y*f2';y*f3';y*f4';y*f5';y*f6';y*f7';y*f8';y*f9'];
c=inv(m)*b;

A0=c(1);
Fik(1)=atan(c(3)/c(2));
Fik(2)=atan(c(5)/c(4));
Fik(3)=atan(c(7)/c(6));
Fik(4)=atan(c(9)/c(8));
Ak(1)=c(2)/cos(Fik(1));
Ak(2)=c(4)/cos(Fik(2));
Ak(3)=c(6)/cos(Fik(3));
Ak(4)=c(8)/cos(Fik(4));




yt=A0+Ak(1)*cos(w0*w(end)*x+Fik(1))+Ak(2)*cos(w0*w(end-1)*x+Fik(2))+Ak(3)*cos(w0*w(end-2)*x+Fik(3))+Ak(4)*cos(w0*w(end-3)*x+Fik(4));


dif=yt-y;
ecm=sqrt(dif*dif')/periodo

plot(x,y,x,yt,'r--');
return;

end
