function tk = step( f , x0 )
	tg = 0 ;
	td = 0 ;
	t = 1/2 ;
	tk = 0 ;
	while tk ~= t   
		[a,b,c] = golstein_rule( f, x0, t) ;
		if a == 1 
			tk = t ;
		end
		if b == 1
			td = t ;
		end
		if c == 1
			tg = t ;
		end

		if b == 1 || c == 1 
			if td == 0 
				t = 10*tg ;
			
			else
				t = (tg + td)/2 ;
			end
		end

	end

end

function [ val , grad0 ] = h( f, x0, t )
	d = -eval(subs(jacobian(f),argnames(f),x0)) ;
	x_delta = x0 + t*d ;
	val = eval(subs(f,argnames(f),x_delta)) - eval(subs(f,argnames(f),x0)) ;	
	grad0 = eval(subs(gradient(f),argnames(f),x0))*d ;
end

function [ a , b , c ] = golstein_rule( f, x0, t )
	a = 0 ;
	b = 0 ;
	c = 0 ;
	m2 = 0.618033989 ;
	m1 = 1 - m2 ;
	[h_valt, grad_h0] = h(f, x0, t) ;
	if ( h_valt > m1*grad_h0*t )
		b = 1 ;
	end
	if ( h_valt < m2*grad_h0*t )
		c = 1 ;
	end
	if b == 0 && c == 0
		a = 1 ;
	end
end

