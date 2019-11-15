tic;
clc;
clear;
close all;

%% in
num_default = 4;
num = input(['please input the number of metal trough which be divided, default is ', num2str(num_default,'%d'), ':\n']);
if isempty(num)
	num = num_default;
	disp(num);
end

err_min_default = 1e-4;
err_min = input(['please input the number of minimal computing error, default is ', num2str(err_min_default,'%f'), ':\n']);
if isempty(err_min)
	err_min = err_min_default;
	disp(err_min);
end

%% process
out = FDM(num, err_min);

%% out
fprintf( 'Result is:\n' )
disp(out);
toc;

