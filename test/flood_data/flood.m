close all
clear variables

obs_list=dir('obs*.txt');
for_list=dir('for*.txt');
ln=length(obs_list);
for i=1:ln
    fname=obs_list(i).name;
    fid=fopen(fname);
    data=textscan(fid,'%02d/%02d %02d:%02d %5.2fft %fkcfs');
    fclose(fid);
    yr=year(datetime);
    date=datetime(yr,cell2mat(data(1)),cell2mat(data(2)),cell2mat(data(3)),cell2mat(data(4)),0);
    stage=cell2mat(data(5));
    flow=cell2mat(data(6));
    figure(1)
    plot(date,stage)
    grid on
    xlabel('UTC')
    ylabel('stage (feet)')
    hold on
    
    figure(2)
    plot(date,flow)
    grid on
    xlabel('UTC')
    ylabel('flow (kcfs)')
    hold on
    
    fname=for_list(i).name;
    fid=fopen(fname);
    data=textscan(fid,'%02d/%02d %02d:%02d %5.2fft %fkcfs');
    fclose(fid);
    yr=year(datetime);
    date=datetime(yr,cell2mat(data(1)),cell2mat(data(2)),cell2mat(data(3)),cell2mat(data(4)),0);
    stage=cell2mat(data(5));
    flow=cell2mat(data(6));
    figure(1)
    plot(date,stage)
    legend('observations','forecast')
    
    figure(2)
    plot(date,flow)
    
end