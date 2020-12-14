cd C:\GitHub_Repos\code_code_code\Advent_6

fid = fopen('puzzle_input.txt');
line = 1;
while 1 == 1
    T_input = fgets(fid);
    if T_input == -1
       break 
    end
    T2_input = strsplit(T_input);
    input(line,1:size(T2_input,2)) = T2_input;
    line = line + 1;
end


input(cellfun(@isempty,input)) = {'empty'};
%cellfun(@isempty,input);
bags(:,1) = strcat(input(:,1),input(:,2));

for instr = 0:10
    try
        bags(:,instr+2) = strcat(input(:,6 + 4*instr),input(:,7 + 4*instr));
    catch
        break
    end
% bags(:,3) = strcat(input(:,10),input(:,11));
% bags(:,4) = strcat(input(:,14),input(:,15));
% bags(:,5) = strcat(input(:,18),input(:,19));
end

bags = reshape(bags,[numel(bags) 1]);

[unique_bags,bag_count,coded_bags] = unique(bags);

coded_bags_formatted = reshape(coded_bags,[numel(coded_bags)/(instr+1) instr+1]);

my_code = coded_bags(contains(bags,'shinygold'));
my_code = my_code(1);
clear bags
how_long = 1;
counter = 0;
my_new_code = [];
while how_long > 0
%%%problem is that there are more levels to each bag!
    for i = 1:numel(my_code)
        index = (ismember(coded_bags_formatted,my_code));
        index(:,1) = 0;
        index1 = index;
        index2 = index;
        index2(:,2)=0;
        index1(:,3) = 0;
        counter = counter + sum(sum(index));
        [row,col] = find(index1);
        index1 = sub2ind([size(coded_bags_formatted,1)  size(coded_bags_formatted,2)], row, col-1);
        [row,col] = find(index2);
        index2 = sub2ind([size(coded_bags_formatted,1)  size(coded_bags_formatted,2)], row, col-2);
        index = [index1 ; index2];
        my_code = unique([my_new_code ;coded_bags_formatted(index)]);

    end
%     my_code = my_new_code;
%     my_new_code = [];
    if isempty(my_code)
           break 
    end
end

