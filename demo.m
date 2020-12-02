%% Settings
input_file = 'data/1.tif';
scale_size = 1;
scale_bright = 1;

%% Load data
M = load2D(input_file);

max_M = max(M(:));
M_size = size(M);
tLength = M_size(end);

%% Scale the data
M_mod_size = M_size * scale_size;
M_mod_size(end) = tLength;

M_mod = zeros(M_mod_size);
for t = 1:tLength
    current_frame = M(:, :, t);
    M_mod(:, :, t) = scale_bright * imresize(current_frame, scale_size) / max_M;
end

%% Show data
implay(M_mod);
