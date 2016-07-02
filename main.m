syms x y z v real 
syms f(x,y,z) g(x,y) h(x,y,z) m(x,y,z)
v=[x; y; z];

%FUNCION 1
f(x,y,z)= x*exp(-(x^2+y^2+z^2)) +(x^2+y^2+z^2);
%FUNCION 2
g(x,y)=exp(x^2+y^2);
%FUNCION 3
w=[3;2;-5];
h(x,y,z)=(log(2+sin(w'*v)))^2;
%FUNCION 4
Q=[3 4 -1; 4 7 1; -1 1 5];
r=[1;2;5];
m(x,y,z)=0.5*(v'*Q*v)+(r'*v);
%PUNTOS INICALES
x0=[1,1,1];
x1=[1,1];

% SOL PROB1
%[xf, z ,m ,time]=maximo_descenso(f,x0,0.01,2000);
%[xf1, z1 ,m1 ,time1]=newton(f,x0,0.01,2000);
%[xf2, z2 ,m2 ,time2]=fletcher_reeves(f,x0,0.01,2000);
%[xf3, z3 ,m3 ,time3]=DFP(f,x0,0.01,2000);
%[xf4, z4 ,m4 ,time4]=BFGS(f,x0,0.01,2000);
%PUNTO1 = [xf;xf1;xf2;xf3;xf4]
%ADICIONAL1=[[z ,m ,time];[z1 ,m1 ,time1];[z2 ,m2 ,time2];[z3 ,m3 ,time3];[z4 ,m4 ,time4]]

% SOL PROB2
% [xf5, z5 ,m5 ,time5]=maximo_descenso(g,x1,0.01,2000);
 [xf6, z6 ,m6 ,time6]=newton(g,x1,0.01,2000)
% [xf7, z7 ,m7 ,time7]=fletcher_reeves(g,x1,0.01,2000);
% [xf8, z8 ,m8 ,time8]=DFP(g,x1,0.01,2000);
% [xf9, z9 ,m9 ,time9]=BFGS(g,x1,0.01,2000);
% PUNTO2 = [xf5;xf6;xf7;xf8;xf9]
% ADICIONAL2=[[z5 ,m5 ,time5];[z6 ,m6 ,time6];[z7 ,m7 ,time7];[z8 ,m8 ,time8];[z9 ,m9 ,time9]]
% x0 = [0.999 0. 0.9]
% SOL PROB 3
 [xf10, z10 ,m10 ,time10]=maximo_descenso(h,x0,0.01,2000);
 [xf11, z11 ,m11 ,time11]=newton(h,x0,0.01,2000);
 [xf12, z12 ,m12 ,time12]=fletcher_reeves(h,x0,0.01,2000);
 [xf13, z13 ,m13 ,time13]=DFP(h,x0,0.01,2000);
 [xf14, z14 ,m14 ,time14]=BFGS(h,x0,0.01,2000);
 PUNTO3 = [xf10;xf11;xf12;xf13;xf14]
 ADICIONAL3=[[z10 ,m10 ,time10];[z11 ,m11 ,time11];[z12 ,m12 ,time12];[z13 ,m13 ,time13];[z14 ,m14 ,time14]]

% SOL PROB 4
% [xf15, z15 ,m15 ,time15]=maximo_descenso(m,x0,0.01,2000);
% [xf16, z16 ,m16 ,time16]=newton(m,x0,0.01,2000);
% [xf17, z17 ,m17 ,time17]=fletcher_reeves(m,x0,0.01,2000);
% [xf18, z18 ,m18 ,time18]=DFP(m,x0,0.01,2000);
% [xf19, z19 ,m19 ,time19]=BFGS(m,x0,0.01,2000);
% PUNTO4 = [xf15;xf16;xf17;xf18;xf19]
% ADICIONAL4=[[z15 ,m15 ,time15];[z16 ,m16 ,time16];[z17 ,m17 ,time17];[z18 ,m18 ,time18];[z19 ,m19 ,time19]]


%ADICIONAL4=[[z15 ,m15 ,time15];[z16 ,m16 ,time16];[z17 ,m17 ,time17];[z18 ,m18 ,time18];[z19 ,m19 ,time19]]