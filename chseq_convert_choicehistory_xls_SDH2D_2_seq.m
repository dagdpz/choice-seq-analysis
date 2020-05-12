function out = chseq_convert_choicehistory_xls_SDH2D_2_seq(xlsfilename)
% This function converts excel tables exported by Carsten for the "Spatial decision human 2nd (fMRI) dataset" to sequences
% See:
% chseq_analyze_trial_seq_all_subj_SDH2D.m
% chseq_analyze_trial_seq_one_subj_SDH2D.m

d = dataset('XLSFile',xlsfilename);

% d = dataset('XLSFile','9436_choicehistory.xls');
% we want a sequence like that:
% 1 BC left
% 2 BC right
% 3 UC left
% 4 UC right
% 5 UI left
% 6 UI right


success = ~strcmp(d.success,'ABORT') & ~strcmp(d.success,'FAIL') & ~strcmp(d.success,'UNKNOWN');

% quick and dirty loop, can be optimized without loop
seq = [];
for k=1:length(d.success),
	if success(k),
		if strcmp(d.trialtype(k),'FREE') && strcmp(d.direction(k),'LEFT')
			seq = [seq 1];
		elseif strcmp(d.trialtype(k),'FREE') && strcmp(d.direction(k),'RIGHT')
			seq = [seq 2];
		elseif strcmp(d.trialtype(k),'INSTRUCTED') && strcmp(d.direction(k),'LEFT')
			seq = [seq 3];
		elseif strcmp(d.trialtype(k),'INSTRUCTED') && strcmp(d.direction(k),'RIGHT')
			seq = [seq 4];
		elseif strcmp(d.trialtype(k),'SINGLE_NEUTRAL') && strcmp(d.direction(k),'LEFT')
			seq = [seq 5];
		elseif strcmp(d.trialtype(k),'SINGLE_NEUTRAL') && strcmp(d.direction(k),'RIGHT')
			seq = [seq 6];
		end
	else
		seq = [seq -1];

	end
end


% insert 0 between runs
run = d.run;
idx_newrun = find(diff(run));
idx_newrun = idx_newrun + [1:length(idx_newrun)]'; % take into account increasing indices due to insertions
out.seq = ig_insert_values_into_vector(seq,idx_newrun,0);
out.seq = out.seq(out.seq>=0);

out.all_conditions		= [1 2 3 4 5 6];
out.condition_labels		= {'BC l' 'BC r' 'BI l' 'BI r' 'UI l' 'UI r'};
out.conditions2exclude		= [];
out.group_conditions		= {[1], [2]};
out.group_condition_names	= {'BC l' 'BC r'};



