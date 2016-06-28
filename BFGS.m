function [xf,z,m,time] = BFGS(f,x0,eps,n)
    tic
    S=diag(ones(length(x0),1));
    k=0;
    gradient_f = eval(subs(jacobian(f),argnames(f),x0));
    while(k<=n && norm(gradient_f)>eps)
        foo=(paso(f,x0).*(S*gradient_f'))';
        x0=x0-foo;
        p=-foo';
        q=(eval(subs(jacobian(f),argnames(f),x0))-gradient_f)';
        S=S+(1+(q'*S*q)/(p'*q))*((p*p')/(p'*q))-(p*q'*S'+S*q*p')/(p'*q);
        gradient_f = eval(subs(jacobian(f),argnames(f),x0));
        k=k+1;
    end
    ending=toc;
    xf=x0;
    z=eval(subs(f,argnames(f),x0));
    m=k;
    time=ending;
end