function y = Math_bound( x, bound_l, bound_u )
%MATH_BOUND �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    y = x;
    for i = size(x,1)
        if x(i) <= bound_l
            y(i) = bound_l;
        elseif x(i) >= bound_u
            y(i) = bound_u;
        end
    end

end

