

cd C:\GitHub_Repos\code_code_code\Advent_3

input = char(importdata('puzzle_input.txt'));
input_recoded = input == '#';

down = [1 1 1 1 2];
right = [1 3 5 7 1];

for slopes = 1:5
    

start = 1;



how_many_steps = ((size(input,1))-start)/down(slopes);

how_wide = right(slopes)*how_many_steps+1;
multiplier = (round(1/(size(input,2)/how_wide),0))+1;

input_long = repmat(input_recoded,1,multiplier);
T_input_long = input_long';


width = size(T_input_long,1);

position = start + down(slopes)*width + right(slopes);
tree_counter = 0;
    for steps = 1:how_many_steps

        tree_counter = tree_counter + T_input_long(position);
    %     [row(steps),col(steps)] = ind2sub([size(T_input_long,1) size(T_input_long,2)],position);
        position = position + down(slopes)*width + right(slopes);  


    end
    slope_trees(slopes) = tree_counter;

end

answer = prod(slope_trees);


    