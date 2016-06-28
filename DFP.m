function [xf,z,m,time] = DFP(f,x0,eps,n)
    tic
    S=diag(ones(length(x0),1));
    k=0;
    gradient_f = eval(subs(jacobian(f),argnames(f),x0));
    while(k<=n && norm(gradient_f)>eps)
        foo=(paso(f,x0).*(S*gradient_f'))';
        x0=x0-foo;
        p=-foo';
        q=(eval(subs(jacobian(f),argnames(f),x0))-gradient_f)';
        S=S+(p*p')/((p')*q) - (S*q*q'*S)/(q'*S*q);
        gradient_f = eval(subs(jacobian(f),argnames(f),x0));
        k=k+1;
    end
    ending=toc;
    xf=x0;
    z=eval(subs(f,argnames(f),x0));
    m=k;
    time=ending;
end