function [ xf, z, m, t ] = fletcher_reeves( f, x0, eps, n )
    tic ;
    k = 0 ;
    d0 = -eval(subs(gradient(f),argnames(f),x0)) 
    x0
    x1 = x0 + paso(f,x0)*d0.' 
    while ( norm(x1-x0) > eps || k <= n )
    	grad0 = -eval(subs(gradient(f),argnames(f),x0)) 
    	grad1 = -eval(subs(gradient(f),argnames(f),x1))  
        num = ((grad1-grad0).')*(grad1) 
        div = (grad0.')*(grad0)
    	rho = num/div  
    	d1 = grad1 + (rho*d0) ; 
        k = k+1 ; 
        x0 = x1 ;
        x1 = x0 + paso(f,x0)*d0.' 
        d0 = d1 
        
    end
    toc 
   	t = toc-tic ;
   	xf = x1 ;
   	z = feval(f,x1) ;
   	m = k ;

end

