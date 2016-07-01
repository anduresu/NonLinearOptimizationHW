function [alpha]=paso(f,x0)
    %parametros de control
    sigma = .1;
    beta = .5;
    a = 1;
    %inicializacion
    g=eval(subs(jacobian(f),argnames(f),x0));
    d = -g;                   
    fnormal=eval(subs(f,argnames(f),x0));
    fcorrida = eval(subs(f,argnames(f),x0+a*d));
    %iteracion
    while (fcorrida-fnormal)/a > sigma*g*d'
        a = a*beta;
        fnormal=eval(subs(f,argnames(f),x0));
        fcorrida = eval(subs(f,argnames(f),x0+a*d));
    end
    alpha=a;
end