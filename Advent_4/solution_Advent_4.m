

input_file = fopen('example.txt','r');
stopper = 1;
counter = 1;
while stopper ~= -1
    input{counter} = fgets(input_file);
        if input{counter} == -1
            stopper = -1;
        end
    counter = counter + 1;
end
fclose(input_file);

cellfun(@ischar,input);

ischar(input{1});

input{3};
