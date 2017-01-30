
utterance_ind = 530;

figure(3);clf;
subplot(2,1,1);
[x,fs] = audioread(filenames{utterance_ind});

[b,a] = cheby2(6,60,50/22050,'high');

x = filter(b,a,x);
x = resample(x,500,fs);
t = 0:1/500:length(x)/500-1/500;
plot(t,x);
xlim([0 max(t)]);
ylabel('amplitude')


tmp = ylim;
for k = 1:length(bounds_t{utterance_ind})   
   line([bounds_t{utterance_ind}(k)-0.01 bounds_t{utterance_ind}(k)-0.01],[-0.01 0.01],'Color','black','LineWidth',2,'LineStyle','-');    
end
line([0.01 0.01],[-0.01 0.01],'Color','black','LineWidth',2,'LineStyle','-'); % Move onset bound a bit to make it visible in pic
%ylim(tmp);
ylim([min(x) max(x)]);
xlim([0 max(t)]);
ylim([-0.01 0.01])
subplot(2,1,2);
t = 0:1/100:length(F0_raw{utterance_ind})/100-1/100;
plot(t,F0_raw{utterance_ind},'LineWidth',2);
hold on;
plot(t,CONCAT{utterance_ind}(1:length(t)),'LineWidth',2,'LineStyle','-.','Color','red')
grid;

for k = 1:length(bounds_t{utterance_ind})
    xpoint = bounds_t{utterance_ind}(k)-0.01;
    a = find(t >= xpoint,1);
    if(~isempty(a))
    yval = F0_raw{utterance_ind}(a);
    else
       yval = F0_raw{utterance_ind}(end); 
    end
      
   line([bounds_t{utterance_ind}(k)-0.01 bounds_t{utterance_ind}(k)-0.01],[yval-1 yval+1],'Color','black','LineWidth',2); 
end
% Move onset bound a bit to make it visible in pic
   line([0.01 0.01],[F0_raw{utterance_ind}(1)-1 F0_raw{utterance_ind}(1)+1],'Color','black','LineWidth',2);  

xlabel('time (s)');
ylabel('Z-score normalized F0');
xlim([0 max(t)]);
ylim([min(F0_raw{utterance_ind})-1 max(F0_raw{utterance_ind})+1]);

