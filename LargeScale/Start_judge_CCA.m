function [ veh_struct ] = Start_judge_CCA( veh_struct, time_flag )
%START_JUDGE_CCA �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    if veh_struct.start_time > time_flag
        veh_struct.v =0;
        veh_struct.start = 0;
    else
        veh_struct.v = veh_struct.v_temp;
        veh_struct.start = 1;
    end


end

