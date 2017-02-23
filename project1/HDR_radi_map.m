function [Z] = HDR_radi_map(num, folder)
    Z = zeros(256, num, 3);
    B = zeros(num, 1);
    for color=1:3
        for i=1:num
            if(i < 10)
                path = strcat(folder, 'img0', num2str(i), '.jpg');
            else
                path = strcat(folder, 'img', num2str(i), '.jpg');
            end
            img = imread(path);
            img = imresize(img, 1);
            hei = size(img,1);
            wid = size(img,2);
            img_info = imfinfo(path);
            Exposure_time = img_info.DigitalCamera.ExposureTime;
            B(i) = log(Exposure_time);
            Z(size(img,1)*size(img,2),i,color) = 0;
            Z(:,i,color) = MyReshape(img(:,:,color));
        end
    end
    lambda = 0.5;
    [g, lE] = gsolve(Z(:,:,1), B, lambda);
    for color=1:3
        tmp_img = construct(Z(:,:,color), B, g);
        new_img(:,:,color) = MyRecover(tmp_img, hei, wid);
    end
%     imshow(new_img);
    imwrite(new_img, 'Result.jpg');
end