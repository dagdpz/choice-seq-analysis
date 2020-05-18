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
    % subject = 'DAGU'; for debugging specific subject
    subjdata=data(data.subj==subject,:);
    O(i).out = chseq_analyze_trial_seq_one_subj_FRD(subjdata);
   
%      set(gcf,'NumberTitle', 'off', 'Name', char(subject))
%      pos= get(gcf, 'Position');
%      set(gcf,'PaperPositionMode','Auto','PaperType','A4','PaperUnits','points','PaperSize',[pos(3) pos(4)]);
%      saveas(gcf,[char(subject) '.png'],'png');
%     set(findall(gcf,'-property','FontSize'),'FontSize',10); % if you want to change all font sizes
    
%     BC_prop_R(i)	= O(i).out.group_conditions(1).c2_prop;
% 	BC_prop_L(i)	= 1 - O(i).out.group_conditions(1).c2_prop;
% 	BC_Ppc_g_LL(i)	= O(i).out.group_conditions(1).Ppc_g(1,1); % first L current, second L preceding
% 	BC_Ppc_g_LR(i)	= O(i).out.group_conditions(1).Ppc_g(1,2);
% 	BC_Ppc_g_RL(i)	= O(i).out.group_conditions(1).Ppc_g(2,1);
% 	BC_Ppc_g_RR(i)	= O(i).out.group_conditions(1).Ppc_g(2,2);
% 	
% 	BC_Ppc_g_P(i)	= O(i).out.group_conditions(1).Ppc_g_P;
% 	
% 	BC_Pnc_g_LL(i)	= O(i).out.group_conditions(1).Pnc_g(1,1);
% 	BC_Pnc_g_LR(i)	= O(i).out.group_conditions(1).Pnc_g(1,2);
% 	BC_Pnc_g_RL(i)	= O(i).out.group_conditions(1).Pnc_g(2,1);
% 	BC_Pnc_g_RR(i)	= O(i).out.group_conditions(1).Pnc_g(2,2);
% 	
% 	BC_Pnc_g_P(i)	= O(i).out.group_conditions(1).Pnc_g_P;
end

ig_figure('Position',[100 100 1800 1000],'Name',sprintf('Free Reach Decision choice sequence, %d subjects',length(compl_subjs)));

subplot(2,1,1)
h1 = bar([BC_prop_L; BC_Ppc_g_LL; BC_Ppc_g_RL; BC_prop_R; BC_Ppc_g_LR; BC_Ppc_g_RR]','grouped'); hold on;
Ppc_sig = NaN(1,length(compl_subjs)); Ppc_sig(BC_Ppc_g_P<0.05) = 0.95; plot(Ppc_sig,'k*');
set(gca,'Xtick',[1:length(compl_subjs)],'XtickLabel',cellstr(compl_subjs));
title('P(preceding|current)');
colormap cool
legend({'prop L' 'LL' 'RL' 'prop R' 'LR' 'RR'})


subplot(2,1,2)
title('P(next|current)');
h2 = bar([BC_prop_L; BC_Pnc_g_LL; BC_Pnc_g_RL; BC_prop_R; BC_Pnc_g_LR; BC_Pnc_g_RR]','grouped'); hold on;
Pnc_sig = NaN(1,length(compl_subjs)); Pnc_sig(BC_Pnc_g_P<0.05) = 0.95; plot(Pnc_sig,'k*');
set(gca,'Xtick',[1:length(compl_subjs)],'XtickLabel',cellstr(compl_subjs));
title('P(next|current)');
colormap cool

% pos=get(gcf,'Position');
% set(gcf,'PaperPositionMode','Auto','PaperType','A4','PaperUnits','points','PaperSize',[pos(3) pos(4)]);
% saveas(gcf,['subject_summary.png'],'png');


