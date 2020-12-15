

input_file = fopen('puzzle_input.txt','r');
stopper = 1;
counter = 1;
keySet = {'byr', 'iyr', 'eyr', 'hgt', 'hcl', 'ecl', ...
          'pid', 'cid'};
valueSet = {'', '' ,'' ,'' ,'' , '', '' , ''}; 
ID = 1;
while stopper ~= -1
    input = fgets(input_file);
    if input == -1
            break
    end
    T_input = strsplit(input);
    
    if size(input,2) > 2
    individual_input = cellfun(@(c)strsplit(c,':'), T_input, 'UniformOutput', false);
    individual_input_mat = vertcat(individual_input{1:end-1});
   
        for lookup = 1:size(keySet,2)
            index = cellfun(@(c)strcmp(c,keySet{lookup}), individual_input, 'UniformOutput', false);
            if  sum(sum((vertcat(index{1:end-1})))) > 0
                [row,col] = find(vertcat(index{1:end-1}));
                valueSet{ID,lookup} = individual_input_mat{row,col+1};
            end

        end
    

    else
        ID = ID + 1;
    end
    
    

    counter = counter + 1;
end
fclose(input_file);

check = cellfun(@isempty,valueSet);
check = ~(check);
allowed = sum(sum(check(:,1:7),2) == 7,1);



