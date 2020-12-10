

cd C:\GitHub_Repos\code_code_code\Advent_2


input = readtable('puzzle_input.txt', 'ReadVariableNames', false);


expression = '-';
replace = ' ';

input.Var1 = regexprep(input.Var1, expression, replace);
allowed = char(input.Var1);
allowed_num = str2num(allowed);



letter = char(input.Var2);
l_string = char(input.Var3);

counted_letters = sum(letter(:,1) == l_string,2);

% min = str2num(allowed(:,1));
% max = str2num(allowed(:,3));

min_test = counted_letters >= allowed_num(:,1);

max_test = counted_letters <= allowed_num(:,2);

allowed_rows = min_test .* max_test;

valid_pw = sum(allowed_rows);


% added for problem 2

instances_of_letters = (letter(:,1) == l_string);

row = 1:size(instances_of_letters,1) ;
col1 = allowed_num(:,1)';
col2 = allowed_num(:,2)';
sz = [size(instances_of_letters,1) size(instances_of_letters,2)];

ind_first = sub2ind(sz,row,col1);
ind_second = sub2ind(sz,row,col2);

first_position = instances_of_letters(ind_first);
second_position = instances_of_letters(ind_second);

validate_rows = (first_position + second_position) == 1;

valid_pw2 = sum(validate_rows,2);



