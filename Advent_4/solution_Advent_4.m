

input_file = fopen('example.txt','r');
input = textscan(input_file,'%s', 'Delimiter',': ');

input = fileread('example.txt');

input = readtable('example.txt', 'ReadVariableNames', false);

