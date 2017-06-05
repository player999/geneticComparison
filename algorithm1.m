 %  Copyright (C) 2017
 %
 %  Author: Kateryna Nikishchikhina <kateryna.nikishchikhina@gmail.com>
 %
 %  This program is free software; you can redistribute it and/or
 %  modify it under the terms of the GNU General Public License as
 %  published by the Free Software Foundation, version 2 of the
 %  License.



function [result_population, data] = algorithm1(parameters, pop)
    evals = 0;
    neighbourhood = parameters.neighbourhood;
    epsilon = parameters.epsilon;
    fitness_function = create_test_function(parameters.common.function);
    
    while neighbourhood > epsilon
        for i=1:size(pop,1)
            change = 1;
            variable_order = [1:size(pop,2)];
            start = randsample(size(pop,2),1);
            variable_order = cat(2, variable_order(start:end), variable_order(1:start-1));
            person = pop(i,:);
            while change == 1
               change = 0;
               for j=1:length(variable_order)
                  person1 = person;
                  person2 = person;
                  person1(j) = person1(j) + neighbourhood;
                  person2(j) = person2(j) - neighbourhood;
                  score = fitness_function.func(person);
                  evals = evals + 1;
                  if fitness_function.func(person1) > score
                    person = person1;
                    change = 1;
                    evals = evals + 1;
                  elseif fitness_function.func(person2) > score
                    person = person2;
                    change = 1;
                    evals = evals + 2;
                  else
                    evals = evals + 2; 
                  end
               end
            end
            pop(i, :) = person;
        end
        if evals > parameters.common.max_evals
           break; 
        end
        neighbourhood = neighbourhood / 2;
    end
    result_population = pop;
    data = struct;
    data.nfe = evals;
end