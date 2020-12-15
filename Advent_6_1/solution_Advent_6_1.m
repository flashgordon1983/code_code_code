cd C:\GitHub_Repos\code_code_code\Advent_6_1



fid = fopen('puzzle_input.txt');
line = 1;
input = [];
while 1 == 1
    T_input = fgets(fid);
    if T_input == -1
        count(line) = size(unique(input),2);
       break 
    end
    T_input = regexprep(T_input,'[\n\r]+','');

    input = [input T_input];
    if isempty(T_input)
    count(line) = size(unique(input),2);
    input = [];
    line = line +1;
    end
end

fclose(fid);

answer = sum(count,2);