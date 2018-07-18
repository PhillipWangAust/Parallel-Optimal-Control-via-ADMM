function collide = Env_con_obscheck( Env_struct, target_posi )
     % obstacle ��һ��n*2ά�ľ���nά��ʾn���߽�㡣���Ϊ�����꣬�Ҳ�Ϊ������
     % target_posi ��һ��1*2�ľ��󣬱�ʾ�����ĵ�
     if ~isempty(Env_struct.obstacle)
         obstacle = Env_struct.obstacle;
         obstacle(end+1,:) = obstacle(1,:);
         width = Env_struct.width;
         height = Env_struct.height;
         num = size(obstacle,1);
         if target_posi(1)>0 && target_posi(1)<width && target_posi(2)>0 && target_posi(2)<height 
             collide = false;
             count = 0;
             for i = 1:num-1
                 if ((obstacle(i+1,2)-obstacle(i,2))*(target_posi(1)-obstacle(i,1)) >= (obstacle(i+1,1)-obstacle(i,1))*(target_posi(2)-obstacle(i,2)))
                     count = count+1;                
                 end

             end
             if count == num-1
                 collide = true;
             else
                 collide = false;
             end
         else
             collide = true;
         end
     else
         collide = false;
     end
     
end

