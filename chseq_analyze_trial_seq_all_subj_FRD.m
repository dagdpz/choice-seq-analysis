data=importdata('Y:\Personal\AlexandraWitt\current_dat_file.mat');
data=data(data.success==1,:);
subjects=unique(data.subj);
compl_subjs=[];
for i=1:length(subjects)
    if max(cast(data(data.subj==subjects(i),:).session, 'int8'))==3
        compl_subjs=[compl_subjs subjects(i)];
    end
end
colormap jet
for i=1:length(compl_subjs)
    subject=compl_subjs(i);
    subject = 'DAGU'; for debugging specific subject
    subjdata=data(data.subj==subject,:);
    O(i).out = chseq_analyze_trial_seq_one_subj_FRD(subjdata);
   
     set(gcf,'NumberTitle', 'off', 'Name', char(subject))
%      pos= get(gcf, 'Position');
%      set(gcf,'PaperPositionMode','Auto','PaperType','A4','PaperUnits','points','PaperSize',[pos(3) pos(4)]);
%      saveas(gcf,[char(subject) '.png'],'png');
%     set(findall(gcf,'-property','FontSize'),'FontSize',10); % if you want to change all font sizes
%     
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
    
    SFL_Ppc_L(i) = O(i).out.Ppc_LR(1,1);
    SFL_Ppc_R(i) = O(i).out.Ppc_LR(1,2);
    SFR_Ppc_L(i) = O(i).out.Ppc_LR(2,1);
    SFR_Ppc_R(i) = O(i).out.Ppc_LR(2,2);
    RFL_Ppc_L(i) = O(i).out.Ppc_LR(3,1);
    RFL_Ppc_R(i) = O(i).out.Ppc_LR(3,2);
    RFR_Ppc_L(i) = O(i).out.Ppc_LR(4,1);
    RFR_Ppc_R(i) = O(i).out.Ppc_LR(4,2);
        
    SFL_Pnc_L(i) = O(i).out.Pnc_LR(1,1);
    SFL_Pnc_R(i) = O(i).out.Pnc_LR(1,2);
    SFR_Pnc_L(i) = O(i).out.Pnc_LR(2,1);
    SFR_Pnc_R(i) = O(i).out.Pnc_LR(2,2);
    RFL_Pnc_L(i) = O(i).out.Pnc_LR(3,1);
    RFL_Pnc_R(i) = O(i).out.Pnc_LR(3,2);
    RFR_Pnc_L(i) = O(i).out.Pnc_LR(4,1);
    RFR_Pnc_R(i) = O(i).out.Pnc_LR(4,2);
    
end

%sequence by effector
ig_figure('Position',[100 100 1800 1000],'Name',sprintf('Free Reach Decision choice sequence, %d subjects',length(compl_subjs)));

subplot(2,1,1)
h1 = bar([SF_prop_L; SF_Ppc_g_LL; SF_Ppc_g_RL; SF_prop_R; SF_Ppc_g_LR; SF_Ppc_g_RR]','grouped'); hold on;
Ppc_sig = NaN(1,length(compl_subjs)); Ppc_sig(SF_Ppc_g_P<0.05) = 0.95; plot(Ppc_sig,'k*');
set(gca,'Xtick',[1:length(compl_subjs)],'XtickLabel',cellstr(compl_subjs));
title('Free saccade(preceding|current)');
colormap cool
legend({'prop L' 'LL' 'RL' 'prop R' 'LR' 'RR'})


subplot(2,1,2)
h2 = bar([RF_prop_L; RF_Ppc_g_LL; RF_Ppc_g_RL; RF_prop_R; RF_Ppc_g_LR; RF_Ppc_g_RR]','grouped'); hold on;
Ppc_sig = NaN(1,length(compl_subjs)); Ppc_sig(RF_Ppc_g_P<0.05) = 0.95; plot(Ppc_sig,'k*');
set(gca,'Xtick',[1:length(compl_subjs)],'XtickLabel',cellstr(compl_subjs));
title('Free reach(preceding|current)');
colormap cool

% pos=get(gcf,'Position');
% set(gcf,'PaperPositionMode','Auto','PaperType','A4','PaperUnits','points','PaperSize',[pos(3) pos(4)]);
% saveas(gcf,['subject_summary.png'],'png');

%comparison of preceeding/next LR grouped
ig_figure('Position',[100 100 1800 1000],'Name',sprintf('Free Reach Decision choice sequence, LR, %d subjects',length(compl_subjs)));

subplot(2,1,1)
h1 = bar([SFL_Ppc_L; SFL_Ppc_R; SFR_Ppc_L; SFR_Ppc_R; RFL_Ppc_L; RFL_Ppc_R; RFR_Ppc_L; RFR_Ppc_R]','grouped'); hold on;
%Ppc_sig = NaN(1,length(compl_subjs)); Ppc_sig(Ppc_LR_P<0.05) = 0.95; plot(Ppc_sig,'k*');
set(gca,'Xtick',[1:length(compl_subjs)],'XtickLabel',cellstr(compl_subjs));
title('P(preceding|current)');
colormap cool
legend({'SFL_L' 'SFL_R' 'SFR_L' 'SFR_R' 'RFL_L' 'RFL_R' 'RFR_L' 'RFR_R'})


subplot(2,1,2)
h2 = bar([SFL_Pnc_L; SFL_Pnc_R; SFR_Pnc_L; SFR_Pnc_R; RFL_Pnc_L; RFL_Pnc_R; RFR_Pnc_L; RFR_Pnc_R]','grouped'); hold on;
%Pnc_sig = NaN(1,length(compl_subjs)); Pnc_sig(Pnc_LR_P<0.05) = 0.95; plot(Pnc_sig,'k*');
set(gca,'Xtick',[1:length(compl_subjs)],'XtickLabel',cellstr(compl_subjs));
title('P(next|current)');
colormap cool

% pos=get(gcf,'Position');
% set(gcf,'PaperPositionMode','Auto','PaperType','A4','PaperUnits','points','PaperSize',[pos(3) pos(4)]);
% saveas(gcf,['subject_summary_LR.png'],'png');


