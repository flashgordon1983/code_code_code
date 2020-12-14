

cd C:\GitHub_Repos\code_code_code\Advent_5

input = char(importdata('puzzle_input.txt'));

binary_input_FB = input == 'B';

front_back = binary_input_FB(:,1)*64 + binary_input_FB(:,2)*32 + ...
             binary_input_FB(:,3)*16 + binary_input_FB(:,4)*8 + ...
             binary_input_FB(:,5)*4 + binary_input_FB(:,6)*2 +...
             binary_input_FB(:,7)*1;
         
binary_input_LR = input == 'R';         
         
left_right = binary_input_LR(:,8)*4 + binary_input_LR(:,9)*2 +...
             binary_input_LR(:,10)*1;
         
seat_IDs = front_back .*8 + left_right;

answer = max(seat_IDs);
sorted_IDs = sort(seat_IDs);
not_my_seat = (sorted_IDs(2:end)-sorted_IDs(1:end-1))==2;

my_seat_neighbours = [sorted_IDs(not_my_seat) sorted_IDs(find(not_my_seat)+1)];