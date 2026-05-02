
%% MAIN CALCULATION 

% obtaining SP estimate 
sp_estimation

% proposed method 
Y_pre = Y(:,1:T);
[~,B_hat] = scm_batch(Y_pre);

% record weights relevant in misspecification sensitivity analysis 
IBIB = (eye(N)-B_hat)'*(eye(N)-B_hat);
wMisSpeBiasSP = A/(A'*IBIB*A)*A'*IBIB-eye(N);
wMisSpeBiasSP = wMisSpeBiasSP(1,:);
wMisSpeBiasSP = wMisSpeBiasSP(sum(A,2)'==0);
wMisSpeBiasSP = sort(abs(wMisSpeBiasSP),'descend');

% pure donor SCM 
indSP = sum(A,2);
indSP(1) = 0; % mark spillover units
Y_pre(indSP==1,:) = []; % delete potentially spillover units 
[a_hat,B_hat] = scm_batch(Y_pre);

% record weights relevant in misspecification sensitivity analysis 
wMisSpeBiasPD = B_hat(1,:);
wMisSpeBiasPD(1) = [];
wMisSpeBiasPD = sort(abs(wMisSpeBiasPD),'descend');


%% OUTPUT CONFIGURATION
ftSize = 17;
lWidth = 3;
alphaNVmax = 26.8609292396105;


%% OUTPUT - p=1
p = 1;

f = figure();

alphaBarVec = linspace(0,40,100);
misSpeBiasSP = sum(wMisSpeBiasSP(1:p))*alphaBarVec;
misSpeBiasPD = sum(wMisSpeBiasPD(1:p))*alphaBarVec;

alphaHatMin = min(teEstimateSP);
alphaHatMax = max(teEstimateSP);

% level of spillover needed to invalidate largest treatment effect  
alphaIntersectMax = alphaHatMax/sum(wMisSpeBiasSP(1:p));
% level of spillover needed to invalidate smallest treatment effect  
-alphaHatMin/sum(wMisSpeBiasSP(1:p));

% draw
hold on 

pSP = plot(alphaBarVec,misSpeBiasSP,alphaBarVec,-misSpeBiasSP);
pPD = plot(alphaBarVec,misSpeBiasPD,'--',alphaBarVec,-misSpeBiasPD,'--');
  
yline(0)
yline(alphaHatMax,'LineWidth',lWidth*.7,'LineStyle',':')
yline(alphaHatMin,'LineWidth',lWidth*.7,'LineStyle',':')
xline(alphaNVmax,'LineWidth',lWidth*.7,'LineStyle',':')

l = line([alphaIntersectMax,alphaIntersectMax],[0,alphaHatMax]);
l.LineWidth = lWidth*.7;
l.LineStyle = ':';
l.Color = [0.25, 0.25, 0.25];

hold off

% style
pSP(1).LineWidth = lWidth;
pSP(2).LineWidth = lWidth;
pPD(1).LineWidth = lWidth;
pPD(2).LineWidth = lWidth;

pSP(1).Color = [   0    0.4470    0.7410]; % blue
pSP(2).Color = [   0    0.4470    0.7410]; 
pPD(1).Color = [ 0.8500    0.3250    0.0980]; % red
pPD(2).Color = [ 0.8500    0.3250    0.0980];

legend('\delta_{1,SP} bounds','','\delta_{1,PD} bounds','Location','northwest')
xlabel('$\bar\alpha$','Interpreter','latex')
ylabel('Bias')

xticks([0,10,20,alphaNVmax,30,40])
xticklabels({'0','10','20','\alpha_{max}^{NV}','30','40'})
yticks([-30,-20,alphaHatMin,-10,0,alphaHatMax,10,20,30])
yticklabels({'-30','','\alpha_{min}^{CA}','-10','0',...
    '\alpha_{max}^{CA}','10','20','30'})

text(alphaIntersectMax-1.5,-2,num2str(round(alphaIntersectMax,2)),...
    'FontSize',ftSize,'FontName','Times New Roman')

set(gca, 'FontName', 'Times New Roman')
ax = gca;
ax.FontSize = ftSize; 

% save file 
filesave = append('output/', 'pure_donor_comparison_p',num2str(p),'.pdf');
filePath = sprintf(filesave);
saveas(f,filePath);


%% OUTPUT - p=2
p = 2;

f = figure();

alphaBarVec = linspace(0,40,100);
misSpeBiasSP = sum(wMisSpeBiasSP(1:p))*alphaBarVec;
misSpeBiasPD = sum(wMisSpeBiasPD(1:p))*alphaBarVec;

alphaHatMin = min(teEstimateSP);
alphaHatMax = max(teEstimateSP);

% level of spillover needed to invalidate largest treatment effect  
alphaIntersectMax = alphaHatMax/sum(wMisSpeBiasSP(1:p));
% level of spillover needed to invalidate smallest treatment effect  
-alphaHatMin/sum(wMisSpeBiasSP(1:p));

% draw
hold on 

pSP = plot(alphaBarVec,misSpeBiasSP,alphaBarVec,-misSpeBiasSP);
pPD = plot(alphaBarVec,misSpeBiasPD,'--',alphaBarVec,-misSpeBiasPD,'--');
  
yline(0)
yline(alphaHatMax,'LineWidth',lWidth*.7,'LineStyle',':')
yline(alphaHatMin,'LineWidth',lWidth*.7,'LineStyle',':')
xline(alphaNVmax,'LineWidth',lWidth*.7,'LineStyle',':')

l = line([alphaIntersectMax,alphaIntersectMax],[0,alphaHatMax]);
l.LineWidth = lWidth*.7;
l.LineStyle = ':';
l.Color = [0.25, 0.25, 0.25];

hold off

% style
pSP(1).LineWidth = lWidth;
pSP(2).LineWidth = lWidth;
pPD(1).LineWidth = lWidth;
pPD(2).LineWidth = lWidth;

pSP(1).Color = [   0    0.4470    0.7410]; % blue
pSP(2).Color = [   0    0.4470    0.7410]; 
pPD(1).Color = [ 0.8500    0.3250    0.0980]; % red
pPD(2).Color = [ 0.8500    0.3250    0.0980];

legend('\delta_{1,SP} bounds','','\delta_{1,PD} bounds','Location','northwest')
xlabel('$\bar\alpha$','Interpreter','latex')
ylabel('Bias')

xticks([0,10,20,alphaNVmax,30,40])
xticklabels({'0','10','20','\alpha_{max}^{NV}','30','40'})
yticks([-30,-20,alphaHatMin,-10,0,alphaHatMax,10,20,30])
yticklabels({'-30','','\alpha_{min}^{CA}','-10','0',...
    '\alpha_{max}^{CA}','10','20','30'})

text(alphaIntersectMax-1.5,-2,num2str(round(alphaIntersectMax,2)),...
    'FontSize',ftSize,'FontName','Times New Roman')

set(gca, 'FontName', 'Times New Roman')
ax = gca;
ax.FontSize = ftSize; 

% save file 
filesave = append('output/', 'pure_donor_comparison_p',num2str(p),'.pdf');
filePath = sprintf(filesave);
saveas(f,filePath);

