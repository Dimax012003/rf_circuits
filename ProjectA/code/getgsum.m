%p=[d1,d2,d3,l1,l2,l3];



function sumG=getgsum(p,Zl,normF)
fo = 0.3*10^(9);
co=fo;
Zo=50;
normf = normF;% αλλαζω το διαστημα στην περιπτωση του δ και του ε ερωτηματος
bignum=1000000000000000000000;
b=2*pi.*normf*fo/co;
ZL=Zl;%μπορω να αλλαξω τιμες απο εδω και να δω την αντιστοιχη βελτιστοποιηση
Zin=ZL; 
for i=[1:3]
    Zin1=zin(p(i),Zin,b,Zo);
    Zin2=zin(p(i+3),bignum,b,Zo);
    Zin=parallel(Zin1,Zin2);
end
G=abs((Zin-Zo)./(Zin+Zo));
sumG=sum(G)./(length(G));
end


function Zin=zin(li,Zli,b,Zo)
Zin = Zo*(Zli+1j*Zo*tan(b*li))./(Zo+1j*Zli.*tan(b*li));
end
function Par=parallel(Z1,Z2)
Par=(Z1.*Z2)./(Z1+Z2);
end