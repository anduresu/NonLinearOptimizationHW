function [ xf, z , m , time] = fletcher_reeves( f, x0, eps, n )
    tic ;
    k = 0 ;
    d = -eval(subs(jacobian(f),argnames(f),x0)) ; 
    x1 = x0 + paso(f,x0)*d ;
    dif = 1 ;
    while ( dif > -eps && norm(x1-x0) > eps && k <= n )
        grad0 = eval(subs(jacobian(f),argnames(f),x0));
        grad1 = eval(subs(jacobian(f),argnames(f),x1)) ;
        rho = ( (grad1.')*(grad1) )./( (grad0.')*(grad0) ) ;
        d = -grad1 + (rho*d.').' ;
        k = k+1 ; 
        x0 = x1 ;
        x1 = x0 + paso(f,x0)*d ;
        dif = eval(subs(f,argnames(f),x0)) - eval(subs(f,argnames(f),x1)) ;
        
    end
    time = toc ;
    xf = x0 ;
    z = eval(subs(f,argnames(f),x0)) ;
    m = k ;

end

