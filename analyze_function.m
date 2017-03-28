function results = analyze_function(params, population)
    algo = params.common.algorithm;
    if((strcmp(algo,'algorithm2') == 1) || (strcmp(algo, 'algorithm1') == 1))
       binary_coding = 1; 
    else
       binary_coding = 0;
    end
    
    if(strcmp(algo,'algorithm2') == 1)
        algorithm = @algorithm2;
    end
  
    runs = params.common.runs;
    delta = params.common.delta;
    sigma = params.common.sigma;
    
    result_population = algorithm(params, population);
    
    results = 1;
end