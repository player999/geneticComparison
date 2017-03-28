function results = match_peaks(params, apeaks, fpeaks)
    apeaks_count = size(apeaks, 1);
    fpeaks_count = size(fpeaks, 1);
    combinations = combvec(1:apeaks_count, 1:fpeaks_count)';
    peaks_found = [];
    func = create_test_function(params.common.function);
    for i=1:size(combinations, 1)
       acoords = apeaks(combinations(i, 1),:);
       fcoords = fpeaks(combinations(i, 2),:);
       distance = dist(acoords, fcoords');
       if(distance > params.common.sigma)
          continue; 
       end
       
       delta_health = abs(func.func(acoords) - func.func(fcoords));
       if(delta_health > params.common.delta)
          continue; 
       end
       peaks_found = cat(1, peaks_found, i);
    end
    
    results = combinations(peaks_found,:);
end