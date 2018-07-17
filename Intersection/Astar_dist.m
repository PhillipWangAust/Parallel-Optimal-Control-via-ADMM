function score = Astar_dist( now_state, next_state, delta )
%ASTAR_DIST �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    w1 = 1; w2 = 0.1;
    Tn = pdist([now_state(1:2);next_state(1:2)]);
    An = delta^2;
    score = w1*Tn+w2*An;

end

