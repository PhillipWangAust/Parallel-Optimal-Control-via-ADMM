function [dist, tag] = Other_refPathDist( x_now, y_now, x_ref, y_ref )
%OTHER_REFPATHDIST ��ο��켣�о��뵱ǰ״̬����ĵ㣬���ؾ���(dist)�Լ��õ��ڲο��켣�еı��(tag)
%   �˴���ʾ��ϸ˵��
    n = size(x_ref,1);
    dist = 10000;tag = 0;
    for i = 1:n
        dist_temp = pdist([x_now, y_now; x_ref(i), y_ref(i)]);
        if dist_temp <= dist
            dist = dist_temp;
            tag = i;
        end
    end

end

