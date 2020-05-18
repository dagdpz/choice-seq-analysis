function out = chseq_analyze_trial_seq_one_subj_FRD(data)

% 1 - SIL (saccade instr left)
% 2 - SIR
% 3 - SFL
% 4 - SFR
% 5 - RIL
% 6 - RIR
% 7 - RFL
% 8 - RFR

seq=[];
for trial = 1:height(data)
    if isequal(data.effector(trial), 'saccade') && isequal(data.choice(trial),'instructed') && isequal(data.target_selected(trial),'left')
        seq =[seq 1];
    elseif isequal(data.effector(trial), 'saccade') && isequal(data.choice(trial),'instructed') && isequal(data.target_selected(trial),'right')
        seq = [seq 2];
    elseif isequal(data.effector(trial), 'saccade') && isequal(data.choice(trial),'choice') && isequal(data.target_selected(trial),'left')
        seq = [seq 3];
    elseif isequal(data.effector(trial), 'saccade') && isequal(data.choice(trial),'choice') && isequal(data.target_selected(trial),'right')
        seq = [seq 4];
    elseif isequal(data.effector(trial), 'reach') && isequal(data.choice(trial),'instructed') && isequal(data.target_selected(trial),'left')
        seq = [seq 5];
    elseif isequal(data.effector(trial), 'reach') && isequal(data.choice(trial),'instructed') && isequal(data.target_selected(trial),'right')
        seq = [seq 6];
    elseif isequal(data.effector(trial), 'reach') && isequal(data.choice(trial),'choice') && isequal(data.target_selected(trial),'left')
        seq = [seq 7];
    elseif isequal(data.effector(trial), 'reach') && isequal(data.choice(trial),'choice') && isequal(data.target_selected(trial),'right')
        seq = [seq 8];
    end
end


% insert 0 between runs
run = cast(data.run, 'int8');
idx_newrun = find(diff(run));
idx_newrun = idx_newrun + [1:length(idx_newrun)]'; % take into account increasing indices due to insertions
out.seq = ig_insert_values_into_vector(seq,idx_newrun,0);
out.seq = out.seq(out.seq>=0);

out.all_conditions		= [1 2 3 4 5 6 7 8];
out.condition_labels		= {'SI l' 'SI r' 'SF l' 'SF r' 'RI l' 'RI r' 'RF l' 'RF r'};
out.conditions2exclude		= [];
out.group_conditions		= {[1 2] [3 4] [5 6] [7 8]};
out.group_condition_names	= {'SI' 'SF' 'RI' 'RF'};
out.conditions_compare_vs_LR = [3 4 7 8]; % all free choices
out.group_LR                 = {[1 3 5 7] [2 4 6 8]}; % left and right trials

out = ig_analyze_trial_sequence(out);

