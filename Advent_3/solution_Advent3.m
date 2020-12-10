

cd C:\GitHub_Repos\code_code_code\Advent_3
down = 1;
right = 3;
start = 1;

input = char(importdata('example.txt'));
input_recoded = input == '#';

how_many_steps = ((size(input,1))-start)/down;

how_wide = right*how_many_steps+1;
multiplier = round(1/(size(input,2)/how_wide),0);

input_long = repmat(input_recoded,1,multiplier);
T_input_long = input_long';


width = size(T_input_long,1);

position = start + down*width + right;
tree_counter = 0;
for steps = 1:how_many_steps
    tree_counter = tree_counter + T_input_long(position);
    %[row,col] = ind2sub([size(T_input_long,1) size(T_input_long,2)],position);
    position = position + down*width + right;  
    
end
    