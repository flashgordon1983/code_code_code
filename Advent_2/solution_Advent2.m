

cd C:\GitHub_Repos\code_code_code\Advent_2

input = readtable('puzzle_input.txt', 'ReadVariableNames', false);


input.Var1 = regexprep(input.Var1, expression, replace);
allowed = char(input.Var1);
allowed_num = str2num(allowed);

expression = '-';
replace = ' ';

letter = char(input.Var2);
l_string = char(input.Var3);

counted_letters = sum(letter(:,1) == l_string,2);

% min = str2num(allowed(:,1));
% max = str2num(allowed(:,3));

min_test = counted_letters >= allowed_num(:,1);

max_test = counted_letters <= allowed_num(:,2);

allowed_rows = min_test .* max_test;

valid_pw = sum(allowed_rows);
