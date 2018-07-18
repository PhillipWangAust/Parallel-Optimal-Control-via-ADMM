function veh_struct = veh_con( x_ini, y_ini, theta_ini, x_tar, y_tar, theta_tar, H_tar, A_tar, v, L, deltaT, R_veh , R_safe, deltaSet,res, Np, lm, um, qc, qp, start_time)
% thetaΪ�����ƣ���ΧΪ-pi~pi
%deltaSetΪ�����ƣ�ȡֵ��ΧΪ-pi/6~pi/6�����ｫ��ȷ�Ϊ10�ݣ���sizeΪ10*1
    %% ����Ϊ����Astar���ֵ�����
    % ����ʱ��
    veh_struct.start_time = start_time;
    % ��ʼλ��
    veh_struct.x_ini = x_ini;
    veh_struct.y_ini = y_ini;
    veh_struct.theta_ini = theta_ini;
    % 
    veh_struct.x_period = x_ini;
    veh_struct.y_period = y_ini;
    veh_struct.theta_period = theta_ini;
    % 
    veh_struct.x_now = x_ini;
    veh_struct.y_now = y_ini;
    veh_struct.theta_now = theta_ini;
    % Ŀ��λ��
    veh_struct.x_tar = x_tar;
    veh_struct.y_tar = y_tar;
    veh_struct.theta_tar = theta_tar;
    veh_struct.H_tar = H_tar;
    veh_struct.A_tar = A_tar;
    % ��¼·��
    veh_struct.real_path = [veh_struct.x_now,veh_struct.y_now,veh_struct.theta_now];
    % ��������
    veh_struct.v = v;
    veh_struct.v_temp = v;
    veh_struct.L = L;
    veh_struct.deltaSet = deltaSet; % ת�Ƕ�������
    % ʱ�ղ���
    veh_struct.deltaT = deltaT; % ʱ����
    veh_struct.R_veh = R_veh; % ������ȫ����
    veh_struct.R_safe = R_safe; % �ϰ��ﰲȫ����
    veh_struct.res = res; % ��ͼ����
        
    % ����Ϊ����MPC���ֵ�����
    veh_struct.Np = Np;
    veh_struct.delta_plan = [];
    veh_struct.x_plan = [];
    veh_struct.y_plan = [];
    veh_struct.theta_plan = [];
    veh_struct.x_plan_temp = [];
    veh_struct.y_plan_temp = [];
    veh_struct.theta_plan_temp = [];
    % �ο�
    veh_struct.x_ref = [];
    veh_struct.y_ref = [];
    veh_struct.theta_ref = [];
    veh_struct.action_ref = [];
    % Ԥ��
    veh_struct.x_pre = [];
    veh_struct.y_pre = [];
    veh_struct.theta_pre = [];
    veh_struct.action_pre = [];
    
    veh_struct.A_linear = [];
    veh_struct.B_linear = [];
    veh_struct.W_linear = [];
    veh_struct.A_tilde = [];
    veh_struct.B_tilde = [];
    veh_struct.W_tilde = [];
    veh_struct.Gamma = [];
    veh_struct.Delta_hat = [];
    veh_struct.LM = repmat(lm, Np, 1);
    veh_struct.UM = repmat(um, Np, 1);  
    
    for i = 1:Np
        tempqp(3*(i-1)+1:3*i) = [1 1 1]; 
    end
    veh_struct.Qc = qc*eye(veh_struct.Np);
    veh_struct.Qp = qp*diag(tempqp);
    
    % ADMM
    veh_struct.delta_l = min(veh_struct.deltaSet);
    veh_struct.delta_u = max(veh_struct.deltaSet);
        
    %����Ϊ����Э������
    veh_struct.terminal = 0;

end

