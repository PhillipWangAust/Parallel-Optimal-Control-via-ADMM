function Other_draw_circle( x0,y0,r,color )
%DRAW_CIRCLE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    sita = 0:pi/20:2*pi;
    x = x0+r*cos(sita); y = y0+r*sin(sita);
    plot(x, y, 'k','linewidth',2);
    fill(x,y,color);
end

