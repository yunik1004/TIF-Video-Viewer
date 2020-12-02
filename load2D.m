function M = load2D(filePath)
    %LOAD2D loads a tiff file as a time-varying 2-dimensional array
    %
    %    Parameters:
    %        'filePath' - The path of the tiff file
    %
    %    Output:
    %        'M' - The output array

    imgResolution = size(single(imread(filePath, 'tif', 1)));
    tLength = numel(imfinfo(filePath));

    M = zeros([imgResolution, tLength], 'single');

    for t = 1:tLength
        M(:, :, t) = single(imread(filePath, 'tif', t));
    end

end
