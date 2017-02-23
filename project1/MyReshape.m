function [A] = MyReshape(input_M)
    M_hei = size(input_M, 1);
    M_wid = size(input_M, 2);
    
    for i=1:M_hei
        A(1+(i-1)*M_wid:i*M_wid) = input_M(i,:);
    end
end