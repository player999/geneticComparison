function pops = make_populations(popsize, nargs, lims, runs)
    pops = zeros(popsize, nargs, runs);
    for i=1:runs
        pop = rand(popsize, nargs);
        for j=1:nargs
            pop(:,j) = (pop(:,j) .* (lims(j,2) - lims(j,1))) + lims(j,1);
            pops(:,:,i) = pop;
        end
    end
end