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
end

bags = reshape(bags,[numel(bags) 1]);

[unique_bags,bag_count,coded_bags] = unique(bags);

coded_bags_formatted = reshape(coded_bags,[numel(coded_bags)/(instr+1) instr+1 ]);

my_code = coded_bags(contains(bags,'shinygold'));
my_code = my_code(1);
clear bags
how_long = 1;
counter = 0;
all_codes = [];
while how_long > 0
     index = (ismember(coded_bags_formatted,my_code));
     index2 = sum(index(:,2:end)>0,2);
      my_code = unique([my_new_code ;coded_bags_formatted(find(index2),1)]);
      all_codes = [all_codes ; my_code];
      counter = size(unique(all_codes),1);
    if isempty(my_code)
           break 
    end
end

