function out = chseq_analyze_trial_seq_one_subj_SDH2D(xlsfilename)
% out = chseq_analyze_trial_seq_one_subj_SDH2D('9436_choicehistory.xls')
% out = chseq_analyze_trial_seq_one_subj_SDH2D('9444_choicehistory.xls')

% 2nd spatial decision human fMRI dataset, this is just for the information, this variable is not used here
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
'12643_choicehistory.xls'
};

if isnumeric(xlsfilename)
	xlsfilename = subject_files{xlsfilename};
end

out = chseq_convert_choicehistory_xls_SDH2D_2_seq([datapath filesep xlsfilename]);

out.dataset_name		= xlsfilename;
out.all_conditions		= [1 2 3 4 5 6];
out.condition_labels		= {'BC l' 'BC r' 'BI l' 'BI r' 'UI l' 'UI r'};
out.conditions2exclude		= []; % [3 4 5 6];
out.group_conditions		= {[1 2] [3 4]};
out.group_condition_names	= {'BC' 'BI'};


out = ig_analyze_trial_sequence(out);





