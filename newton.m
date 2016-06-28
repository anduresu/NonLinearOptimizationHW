function [xf, z ,m ,time] = newton(f,x0,eps,n)
    tic;
    k=0;
    gradient_f = eval(subs(jacobian(f),argnames(f),x0));
    while(k<=n && norm(gradient_f)>eps)
        hessian_f=eval(subs(hessian(f),argnames(f),x0));
        x0=x0-(hessian_f\gradient_f')';
        gradient_f = eval(subs(jacobian(f),argnames(f),x0));
        k=k+1;
    end
    ending=toc;
    xf=x0;
    z=eval(subs(f,argnames(f),x0));
    m=k;
    time=ending;
end
