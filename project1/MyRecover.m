function [A] = MyRecover(M, hei, wid)
    for i=1:hei
        A(i,:) = M(1+(i-1)*wid:i*wid);
end