% Utility script to plot waveforms from make_waves function
% 14:52:45 Fri 30 Jul 2021 - Scott Robson

clf
hold on
for i=1:length(waves)
    plot(t,waves{i})
end
hold off
