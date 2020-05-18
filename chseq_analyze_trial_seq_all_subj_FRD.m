function chseq_analyze_trial_seq_all_subj_FRD

data=importdata('Y:\Personal\AlexandraWitt\current_dat_file.mat');
data=data(data.success==1,:);
subjects=unique(data.subj);

for i=1:length(subjects)
    subject=subjects(i);
    % subject = 'DAGU'; for debigging specific subject
    subjdata=data(data.subj==subject,:);
    O(i).out = chseq_analyze_trial_seq_one_subj_FRD(subjdata);
    set(gcf,'NumberTitle', 'off', 'Name', char(subject))
    % set(findall(gcf,'-property','FontSize'),'FontSize',10); % if you want to change all font sizes
end

