function d2 = FDM(num, err_min)
%{
 {@brief: finite difference method
 {@param num: the number of metal trough which be divided
 {@param err_min: the number of minimal computing error
 {@return d2: the potential of metal trough
 %}

%%in
for i = 2 : num + 1
	for j = 1 : num + 1
		d1( i, j ) = 0;
	end
end
d1( 1, num + 1 ) = 0;
d1( num + 1, num + 1 ) = 0;
d1( 1, 2: num ) = 100;
d2 = d1;
err = 1;
err_in = 0;
temp = 2 / ( 1 + sin( pi / num ) );
k = 0;

%%process
while err > err_min
	k = k + 1;

	for i = 2 : num
		for j = 2 : num
			d2( i, j ) = d1( i, j ) + ( d1( i + 1, j ) + d1( i, j + 1 ) + d2( i - 1, j ) + d2( i, j - 1 ) - 4 * d1( i, j ) ) * temp / 4;
			err_in = abs( d2( i, j ) - d1( i, j ) );
			if ( err_in < err )
				err = err_in;
			end
		end
	end
	d1 = d2;
end

%%out

