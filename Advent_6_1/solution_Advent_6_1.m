cd C:\GitHub_Repos\code_code_code\Advent_6_1



fid = fopen('puzzle_input.txt');

% fmt = repmat('%s',1,1);
% M = textscan(fid,fmt,'Delimiter','\n');

line = 1;
input = {};
abc = 'abcdefghijklmnopqrstuvwxyz';
abc_split = split(abc,'');
person = 1;
while 1 == 1
    T_input = fgets(fid);
    if T_input == -1
        group(line,:) = (sum(correct_ans,1) == size(correct_ans,1));
       break 
    end
    
    T_input = regexprep(T_input,'[\n\r]+','');
    if ~isempty(T_input)
    t2_input = split(T_input,"");
%     strfind(input,abc);
%     input = [input ; T_input];
    for i = 1:size(t2_input,1)
        answered(i,:) = cellfun(@(c)strfind(c,t2_input{i}),abc_split, 'UniformOutput', false);
    end
    correct_ans(person,:) = sum(~cellfun(@isempty,answered),1);
    clear answered 
    person = person + 1;
    else
%     count(line) = size(unique(input),2);
      a = 1;
      group(line,:) = (sum(correct_ans,1) == size(correct_ans,1));
%     input = [];
     line = line +1;
     person = 1;
     clear correct_ans
    end
end

fclose(fid);

answer = sum(sum(group,1),2);

%answer = sum(count,2);