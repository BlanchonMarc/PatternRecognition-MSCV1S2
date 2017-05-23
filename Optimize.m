function [ w, cost ] = Optimize( x, y, w, lambda )

    parameter = w;
    
    option = optimset('GradObj', 'on');
    
    [w, cost] = fminunc( @(t) (costFunction(x, y, t, lambda)), parameter, option);


end

