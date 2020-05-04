% function chseq_analyze_trial_seq_all_subj

% 2nd spatial decision human fMRI dataset
datapath = 'F:\Dropbox\Sources\Repos\choice-seq-analysis\data\spatial_decision_human_2nd_dataset';

subject_files = {
'8989_choicehistory.xls'
'8991_choicehistory.xls'
'9013_choicehistory.xls'
'9080_choicehistory.xls'
'9110_choicehistory.xls'
'9132_choicehistory.xls'
'9193_choicehistory.xls'
'9224_choicehistory.xls'
'9247_choicehistory.xls'
'9436_choicehistory.xls'
'9444_choicehistory.xls'
'9583_choicehistory.xls'
'11499_choicehistory.xls'
'11811_choicehistory.xls'
'12275_choicehistory.xls'
'12276_choicehistory.xls'
'12563_choicehistory.xls'
'12564_choicehistory.xls'
'12568_choicehistory.xls'
'12578_choicehistory.xls'
'12593_choicehistory.xls'
'12643_choicehistory.xls' % only 9 runs?
};

for k = 1:length(subject_files),
	O(k).out = chseq_analyze_trial_seq_one_subj([datapath filesep subject_files{k}]);
	
	if 0
	pos = get(gcf,'Position');
	set(gcf,'PaperPositionMode','Auto','PaperType','A4','PaperUnits','points','PaperSize',[pos(3) pos(4)]);
	saveas(gcf,[subject_files{k} '.pdf'],'pdf');
	close;
	end
	
	BC_prop_R(k)	= O(k).out.group_conditions(1).c2_prop;
	BC_prop_L(k)	= 1 - O(k).out.group_conditions(1).c2_prop;
	BC_Ppc_g_LL(k)	= O(k).out.group_conditions(1).Ppc_g(1,1); % first L current, second L preceding
	BC_Ppc_g_LR(k)	= O(k).out.group_conditions(1).Ppc_g(1,2);
	BC_Ppc_g_RL(k)	= O(k).out.group_conditions(1).Ppc_g(2,1);
	BC_Ppc_g_RR(k)	= O(k).out.group_conditions(1).Ppc_g(2,2);
	
	BC_Ppc_g_P(k)	= O(k).out.group_conditions(1).Ppc_g_P;
	
	BC_Pnc_g_LL(k)	= O(k).out.group_conditions(1).Pnc_g(1,1);
	BC_Pnc_g_LR(k)	= O(k).out.group_conditions(1).Pnc_g(1,2);
	BC_Pnc_g_RL(k)	= O(k).out.group_conditions(1).Pnc_g(2,1);
	BC_Pnc_g_RR(k)	= O(k).out.group_conditions(1).Pnc_g(2,2);
	
	BC_Pnc_g_P(k)	= O(k).out.group_conditions(1).Pnc_g_P;
	
	name	= subject_files{k}; name = name(1:strfind(name,'_')-1);
	subject_names{k} = name;
	
end


ig_figure('Position',[100 100 1800 1000],'Name',sprintf('2nd spatial decision human fMRI dataset, %d subjects',length(subject_files)));

subplot(2,1,1)
h1 = bar([BC_prop_L; BC_Ppc_g_LL; BC_Ppc_g_RL; BC_prop_R; BC_Ppc_g_LR; BC_Ppc_g_RR]','grouped'); hold on;
Ppc_sig = NaN(1,length(subject_files)); Ppc_sig(BC_Ppc_g_P<0.05) = 0.95; plot(Ppc_sig,'k*');
set(gca,'Xtick',[1:length(subject_files)],'XtickLabel',subject_names);
title('P(preceding|current)');
colormap cool
legend({'prop L' 'LL' 'RL' 'prop R' 'LR' 'RR'})


subplot(2,1,2)
title('P(next|current)');
h2 = bar([BC_prop_L; BC_Pnc_g_LL; BC_Pnc_g_RL; BC_prop_R; BC_Pnc_g_LR; BC_Pnc_g_RR]','grouped'); hold on;
Pnc_sig = NaN(1,length(subject_files)); Pnc_sig(BC_Pnc_g_P<0.05) = 0.95; plot(Pnc_sig,'k*');
set(gca,'Xtick',[1:length(subject_files)],'XtickLabel',subject_names);
title('P(next|current)');
colormap cool

% set(gcf,'PaperPositionMode','Auto','PaperType','A4','PaperUnits','points','PaperSize',[pos(3) pos(4)]);
% saveas(gcf,['BC_summary_22subj.pdf'],'pdf');

[h,p] = ttest(BC_prop_R,0.5)