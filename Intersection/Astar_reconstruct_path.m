function [final_path, final_action] = Astar_reconstruct_path( came_from, current_node, veh_struct )
%ASTAR_RECONSTRUCT_PATH �˴���ʾ�йش˺�����ժҪ
% final_path Ϊһn*3�ľ�������ǰ���б�ʾ����������λ�ã������б�ʾ��theta
    if came_from.isKey(num2str(current_node)) == 1
        a = came_from(num2str(current_node));
        p = Astar_reconstruct_path( came_from,a, veh_struct );
        final_path = [p;current_node];
    else
        final_path = current_node;
    end
    n = size(final_path,1);
    final_action = zeros(n,1);
    for i = 1:n-1
        final_action(i,:) = veh_con_inver_model(final_path(i,:),final_path(i+1,:), veh_struct);
    end
end

