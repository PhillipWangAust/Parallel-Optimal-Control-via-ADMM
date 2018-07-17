function delta = Geo_angleCompare( alpha, beta )
%GEO_ANGLECOMPARE ��(-pi,pi]�ĽǶȷ�Χ�ڣ����alpha��beta����С�н�delta��һ���������pi��
%   �˴���ʾ��ϸ˵��
    delta = pi;
    if alpha > beta
        large_angle = alpha;
        small_angle = beta;
    elseif alpha < beta
        large_angle = beta;
        small_angle = alpha;
    else
        delta = 0;
    end
    if delta ~= 0
        diff_angle = large_angle - small_angle;
        if diff_angle <= pi
            delta = diff_angle;
        else
            delta = 2*pi - diff_angle;
        end
    end
end

