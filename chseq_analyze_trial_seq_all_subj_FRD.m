data=importdata('Y:\Personal\AlexandraWitt\current_dat_file.mat');
data=data(data.success==1,:);
subjects=unique(data.subj);
compl_subjs=[];
for i=1:length(subjects)
    if max(cast(data(data.subj==subjects(i),:).session, 'int8'))==3
        compl_subjs=[compl_subjs subjects(i)];
    end
end

for i=1:length(compl_subjs)
    subject=compl_subjs(i);
%    subject = 'DAGU'; for debugging specific subject
    subjdata=data(data.subj==subject,:);
    O(i).out = chseq_analyze_trial_seq_one_subj_FRD(subjdata);
   
%      set(gcf,'NumberTitle', 'off', 'Name', char(subject))
%      pos= get(gcf, 'Position');
%      set(gcf,'PaperPositionMode','Auto','PaperType','A4','PaperUnits','points','PaperSize',[pos(3) pos(4)]);
%      saveas(gcf,[char(subject) '.png'],'png');
%     set(findall(gcf,'-property','FontSize'),'FontSize',10); % if you want to change all font size
    SF_prop_R(i)	= O(i).out.group_conditions(2).c2_prop;
  	SF_prop_L(i)	= 1 - O(i).out.group_conditions(2).c2_prop;
 	SF_Ppc_g_LL(i)	= O(i).out.group_conditions(2).Ppc_g(1,1); % first L current, second L preceding
 	SF_Ppc_g_LR(i)	= O(i).out.group_conditions(2).Ppc_g(1,2);
 	SF_Ppc_g_RL(i)	= O(i).out.group_conditions(2).Ppc_g(2,1);
 	SF_Ppc_g_RR(i)	= O(i).out.group_conditions(2).Ppc_g(2,2);
 	
 	SF_Ppc_g_P(i)	= O(i).out.group_conditions(2).Ppc_g_P;
 
    RF_prop_R(i)	= O(i).out.group_conditions(4).c2_prop;
  	RF_prop_L(i)	= 1 - O(i).out.group_conditions(4).c2_prop;
 	RF_Ppc_g_LL(i)	= O(i).out.group_conditions(4).Ppc_g(1,1); % first L current, second L preceding
 	RF_Ppc_g_LR(i)	= O(i).out.group_conditions(4).Ppc_g(1,2);
 	RF_Ppc_g_RL(i)	= O(i).out.group_conditions(4).Ppc_g(2,1);
 	RF_Ppc_g_RR(i)	= O(i).out.group_conditions(4).Ppc_g(2,2);
 	
 	RF_Ppc_g_P(i)	= O(i).out.group_conditions(4).Ppc_g_P;
    
    SF_prop_R_suc(i)	= O(i).out.group_conditions(2).c2_prop_suc;
  	SF_prop_L_suc(i)	= 1 - O(i).out.group_conditions(2).c2_prop_suc;
 	SF_Ppc_g_LL_suc(i)	= O(i).out.group_conditions(2).Ppc_g_suc(1,1); % first L current, second L preceding
 	SF_Ppc_g_LR_suc(i)	= O(i).out.group_conditions(2).Ppc_g_suc(1,2);
 	SF_Ppc_g_RL_suc(i)	= O(i).out.group_conditions(2).Ppc_g_suc(2,1);
 	SF_Ppc_g_RR_suc(i)	= O(i).out.group_conditions(2).Ppc_g_suc(2,2);
 	
 	SF_Ppc_g_P_suc(i)	= O(i).out.group_conditions(2).Ppc_g_P_suc;
 
    RF_prop_R_suc(i)	= O(i).out.group_conditions(4).c2_prop_suc;
  	RF_prop_L_suc(i)	= 1 - O(i).out.group_conditions(4).c2_prop_suc;
 	RF_Ppc_g_LL_suc(i)	= O(i).out.group_conditions(4).Ppc_g_suc(1,1); % first L current, second L preceding
 	RF_Ppc_g_LR_suc(i)	= O(i).out.group_conditions(4).Ppc_g_suc(1,2);
 	RF_Ppc_g_RL_suc(i)	= O(i).out.group_conditions(4).Ppc_g_suc(2,1);
 	RF_Ppc_g_RR_suc(i)	= O(i).out.group_conditions(4).Ppc_g_suc(2,2);
 	
 	RF_Ppc_g_P_suc(i)	= O(i).out.group_conditions(4).Ppc_g_P_suc;
     
     SFL_Ppc_L(i) = O(i).out.Ppc_LR(1,1);
     SFL_Ppc_R(i) = O(i).out.Ppc_LR(1,2);
     SFR_Ppc_L(i) = O(i).out.Ppc_LR(2,1);
     SFR_Ppc_R(i) = O(i).out.Ppc_LR(2,2);
     RFL_Ppc_L(i) = O(i).out.Ppc_LR(3,1);
     RFL_Ppc_R(i) = O(i).out.Ppc_LR(3,2);
     RFR_Ppc_L(i) = O(i).out.Ppc_LR(4,1);
     RFR_Ppc_R(i) = O(i).out.Ppc_LR(4,2);
     
     Ppc_LR_P_1(i)= O(i).out.Ppc_LR_P(1);
     Ppc_LR_P_2(i)= O(i).out.Ppc_LR_P(2);
     Ppc_LR_P_3(i)= O(i).out.Ppc_LR_P(3);
     Ppc_LR_P_4(i)= O(i).out.Ppc_LR_P(4);
         
     SFL_Pnc_L(i) = O(i).out.Pnc_LR(1,1);
     SFL_Pnc_R(i) = O(i).out.Pnc_LR(1,2);
     SFR_Pnc_L(i) = O(i).out.Pnc_LR(2,1);
     SFR_Pnc_R(i) = O(i).out.Pnc_LR(2,2);
     RFL_Pnc_L(i) = O(i).out.Pnc_LR(3,1);
     RFL_Pnc_R(i) = O(i).out.Pnc_LR(3,2);
     RFR_Pnc_L(i) = O(i).out.Pnc_LR(4,1);
     RFR_Pnc_R(i) = O(i).out.Pnc_LR(4,2);
     
     Pnc_LR_P_1(i)= O(i).out.Pnc_LR_P(1);
     Pnc_LR_P_2(i)= O(i).out.Pnc_LR_P(2);
     Pnc_LR_P_3(i)= O(i).out.Pnc_LR_P(3);
     Pnc_LR_P_4(i)= O(i).out.Pnc_LR_P(4);
    
end

%sequence by effector
ig_figure('Position',[100 100 1800 1000],'Name',sprintf('Free Reach Decision choice sequence, %d subjects',length(compl_subjs)));

subplot(2,1,1)
h1 = bar([SF_prop_L; SF_Ppc_g_LL; SF_Ppc_g_RL; SF_prop_R; SF_Ppc_g_LR; SF_Ppc_g_RR]','grouped'); hold on;
Ppc_sig = NaN(1,length(compl_subjs)); Ppc_sig(SF_Ppc_g_P<0.025) = 0.95; plot(Ppc_sig,'k*');
set(gca,'Xtick',[1:length(compl_subjs)],'XtickLabel',cellstr(compl_subjs));
title('Free saccade(preceding|current)');
colormap cool
legend({'prop L' 'LL' 'RL' 'prop R' 'LR' 'RR'})


subplot(2,1,2)
h2 = bar([RF_prop_L; RF_Ppc_g_LL; RF_Ppc_g_RL; RF_prop_R; RF_Ppc_g_LR; RF_Ppc_g_RR]','grouped'); hold on;
Ppc_sig = NaN(1,length(compl_subjs)); Ppc_sig(RF_Ppc_g_P<0.025) = 0.95; plot(Ppc_sig,'k*');
set(gca,'Xtick',[1:length(compl_subjs)],'XtickLabel',cellstr(compl_subjs));
title('Free reach(preceding|current)');
colormap cool

% pos=get(gcf,'Position');
% set(gcf,'PaperPositionMode','Auto','PaperType','A4','PaperUnits','points','PaperSize',[pos(3) pos(4)]);
% saveas(gcf,['subject_summary.png'],'png');

%successive sequence by effector
ig_figure('Position',[100 100 1800 1000],'Name',sprintf('Free Reach Decision successive choice sequence, %d subjects',length(compl_subjs)));

subplot(2,1,1)
h1 = bar([SF_prop_L_suc; SF_Ppc_g_LL_suc; SF_Ppc_g_RL_suc; SF_prop_R_suc; SF_Ppc_g_LR_suc; SF_Ppc_g_RR_suc]','grouped'); hold on;
Ppc_sig = NaN(1,length(compl_subjs)); Ppc_sig(SF_Ppc_g_P_suc<0.025) = 1; plot(Ppc_sig,'k*');
set(gca,'Xtick',[1:length(compl_subjs)],'XtickLabel',cellstr(compl_subjs));
title('Successive free saccade(preceding|current)');
colormap cool
legend({'prop L' 'LL' 'RL' 'prop R' 'LR' 'RR'})


subplot(2,1,2)
h2 = bar([RF_prop_L_suc; RF_Ppc_g_LL_suc; RF_Ppc_g_RL_suc; RF_prop_R_suc; RF_Ppc_g_LR_suc; RF_Ppc_g_RR_suc]','grouped'); hold on;
Ppc_sig = NaN(1,length(compl_subjs)); Ppc_sig(RF_Ppc_g_P_suc<0.025) = 1; plot(Ppc_sig,'k*');
set(gca,'Xtick',[1:length(compl_subjs)],'XtickLabel',cellstr(compl_subjs));
title('Successive free reach(preceding|current)');
colormap cool

% pos=get(gcf,'Position');
% set(gcf,'PaperPositionMode','Auto','PaperType','A4','PaperUnits','points','PaperSize',[pos(3) pos(4)]);
% saveas(gcf,['succ_subject_summary.png'],'png');

%comparison of preceeding/next LR grouped
    
sigs=NaN(1,length(compl_subjs)*4);

for i=1:length(compl_subjs)
    sigs(find(isnan(sigs),1))= Ppc_LR_P_1(i);
    sigs(find(isnan(sigs),1))=Ppc_LR_P_2(i);
    sigs(find(isnan(sigs),1))=Ppc_LR_P_3(i);
    sigs(find(isnan(sigs),1))=Ppc_LR_P_4(i);
end
x=[0.7,0.9,1.1,1.3,1.7,1.9,2.1,2.3,2.7,2.9,3.1,3.3,3.7,3.9,4.1,4.3,4.7,4.9,5.1,5.3,5.7,5.9,6.1,6.3,6.7,6.9,7.1,7.3,7.7,7.9,8.1,8.3,8.7,8.9,9.1,9.3,9.7,9.9,10.1,10.3,10.7,10.9,11.1,11.3];
ig_figure('Position',[100 100 1800 1000],'Name',sprintf('Free Reach Decision choice sequence, LR, %d subjects',length(compl_subjs)));

subplot(2,1,1)
h1 = bar([SFL_Ppc_L; SFR_Ppc_L; RFL_Ppc_L;  RFR_Ppc_L]','grouped'); hold on;
Ppc_sig = NaN(1,length(compl_subjs)*4); Ppc_sig(sigs<0.00625) = 0.95; plot(x,Ppc_sig,'k*');
set(gca,'Xtick',[1:length(compl_subjs)],'XtickLabel',cellstr(compl_subjs));
title('P(preceding L |current)');
colormap cool
legend({'SFL' 'SFR' 'RFL' 'RFR'})

sigs=NaN(1,length(compl_subjs)*4);

for i=1:length(compl_subjs)
    sigs(find(isnan(sigs),1))= Pnc_LR_P_1(i);
    sigs(find(isnan(sigs),1))=Pnc_LR_P_2(i);
    sigs(find(isnan(sigs),1))=Pnc_LR_P_3(i);
    sigs(find(isnan(sigs),1))=Pnc_LR_P_4(i);
end

subplot(2,1,2)
h2 = bar([SFL_Pnc_L; SFR_Pnc_L; RFL_Pnc_L;  RFR_Pnc_L]','grouped'); hold on;
Pnc_sig = NaN(1,length(compl_subjs)*4); Pnc_sig(sigs<0.00625) = 0.95; plot(x,Pnc_sig,'k*');
set(gca,'Xtick',[1:length(compl_subjs)],'XtickLabel',cellstr(compl_subjs));
title('P(next L|current)');
colormap cool
legend({'SFL' 'SFR' 'RFL' 'RFR'})


% pos=get(gcf,'Position');
% set(gcf,'PaperPositionMode','Auto','PaperType','A4','PaperUnits','points','PaperSize',[pos(3) pos(4)]);
% saveas(gcf,['subject_summary_LR_sigL.png'],'png');

%get effect size (potential fMRI covariate)
%Cohen's w - doesn't match up with significances at all; not sure if that's
%due to the different test (Fisher vs. chi square) or due to my
%implementation
%gives values for each "column" of our result plots (i.e. preceding left
%and right choices are split)
for k=1:length(compl_subjs)   
    cohenwSFL(k)=sqrt(((O(k).out.group_conditions(2).Ppc_g(1)-SF_prop_L(k))^2)/(SF_prop_L(k))+((O(k).out.group_conditions(2).Ppc_g(2)-SF_prop_R(k))^2)/(SF_prop_R(k)));
    cohenwSFR(k)=sqrt(((O(k).out.group_conditions(2).Ppc_g(3)-SF_prop_L(k))^2)/(SF_prop_L(k))+((O(k).out.group_conditions(2).Ppc_g(4)-SF_prop_R(k))^2)/(SF_prop_R(k)));
    cohenwRFL(k)=sqrt(((O(k).out.group_conditions(4).Ppc_g(1)-RF_prop_L(k))^2)/(RF_prop_L(k))+((O(k).out.group_conditions(4).Ppc_g(2)-RF_prop_R(k))^2)/(RF_prop_R(k)));
    cohenwRFR(k)=sqrt(((O(k).out.group_conditions(4).Ppc_g(3)-RF_prop_L(k))^2)/(RF_prop_L(k))+((O(k).out.group_conditions(4).Ppc_g(4)-RF_prop_R(k))^2)/(RF_prop_R(k)));
end

%reverse engineered phi: estimate a chi square value from the Fisher's test
%p value, then calculate phi from that - needs sample size to be 
%additionally output from igtools 
%obviously matches with significance values since it's calculated from them
%value per effector
for k=1:length(compl_subjs)   
    phiSF(k)=sqrt(chi2inv(1-O(k).out.group_conditions(2).Ppc_g_P,1)/O(k).out.chiN(2));
    phiRF(k)=sqrt(chi2inv(1-O(k).out.group_conditions(4).Ppc_g_P,1)/O(k).out.chiN(4));
end