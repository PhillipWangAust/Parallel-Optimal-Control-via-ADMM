function Env_struct = Env_con( height, width, road_width, obstacle, res )
    % heightΪ�����߶ȣ�widthΪ������ȣ�obstacleΪ�����е��ϰ�����Ϣ��Ϊһ��n*2�����飻resΪ�����ķֱ��� 
    Env_struct.height = height;
    Env_struct.width = width;
    Env_struct.obstacle = obstacle;
    Env_struct.res = res;
    Env_struct.road_width = road_width;
end

