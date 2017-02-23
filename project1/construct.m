function [new_img] = construct(Z, B, g)
    new_img = zeros(size(Z,1),1);
    for i=1:size(Z,1)
        total_w = 0;
        tmp_w = 0;
        for j=1:size(Z,2)
            total_w = total_w + w_func(Z(i,j));
            tmp_w = tmp_w + w_func(Z(i,j))*(g(Z(i,j)+1) - B(j));
        end
        new_img(i) = tmp_w / total_w;
    end
    
end