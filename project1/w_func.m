function [weight] = w_func(Zij)
    if(Zij <= 129)
        weight = Zij;
    else
        weight = 255-Zij;
    end
end