function [g, lE] = gsolve(Z, B, l)
    n = 256;
%     A = sparse(zeros(size(Z,1)*size(Z,2) + n+1, n + size(Z,1)));
%     b = zeros(size(A,1), 1);
    sample_num = 50;
    sample_point = randperm(size(Z,1) ,sample_num);
    A = zeros(size(Z,2)*sample_num + n+1, n + sample_num);
    b = zeros(size(A,1), 1);
    
    k = 1;
    for i = 1:sample_num
        for j = 1:size(Z,2)
            sample = sample_point(i);
            tmp_w = w_func(Z(sample,j)+1);
            A(k, Z(sample,j)+1) = tmp_w;
            A(k, n+i) = -tmp_w;
            b(k, 1) = tmp_w * B(j);
            k = k+1;
        end
    end
    
    A(k, 129) = 1;
    k = k+1;
    
    for i = 1:n-2
        A(k,i) = l*w_func(i+1);
        A(k,i+1) = -2*l*w_func(i+1);
        A(k,i+2) = l*w_func(i+1);
        k = k+1;
    end
    x = A\b;
    
%     x = ones(10000,1);
    g = x(1:n);
    lE = x(n+1:size(x,1));
end