function [ path, action ] = Astar_generate( veh_struct, Env_struct, x_goal, y_goal, theta_goal, delta )
%ASTAR_GENERATE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    x_temp(1) = veh_struct.x_now;
    y_temp(1) = veh_struct.y_now;
    theta_temp(1) = veh_struct.theta_now;
    t = 1;
    while true
        [x_next, y_next, theta_next] = veh_con_model(x_temp(t), y_temp(t), theta_temp(t), veh_struct, delta);
        action_temp(t) = delta;
        x_temp(t+1) = x_next;
        y_temp(t+1) = y_next;
        theta_temp(t+1) = theta_next;
        Env_con_reshow(Env_struct, [x_next, y_next], [1, 1], [1, 1])
%         pause(0.5);
        t = t+1;
        if pdist([x_next, y_next;x_goal,y_goal])<veh_struct.v*veh_struct.deltaT+0.1
            path = [x_temp',y_temp',theta_temp'];
            action = action_temp';
            action(end+1) = action(end);
            break
        end
    end

end

