function [avgerror] = visualiseavg(avgimg,croppedOriginal,highResL1,highResL2)
%visualiseavg Plots the Average image and gives the MSE for the avgimg.
%   Detailed explanation goes herR
    furthercropped=croppedOriginal(2:end-1,2:end-1);
    avgerror= mean((avgimg(:) - furthercropped(:)).^2);
    figure()
    subplot(2,2,3)
    imagesc(avgimg, [0, 1])
    title(sprintf('Average Image (mse = %.1d)', avgerror))
    colormap(gray)
    axis image

    subplot(2,2,2)
    imagesc(highResL2, [0, 1])
    title(sprintf('L-2 gradient regularization (mse = %.1d)', mean((highResL2(:) - croppedOriginal(:)).^2)))
    colormap(gray)
    axis image

    subplot(2,2,4)
    imagesc(highResL1, [0, 1])
    title(sprintf('L-1 gradient regularization (mse = %.1d)', mean((highResL1(:) - croppedOriginal(:)).^2)))
    colormap(gray)
    axis image

    subplot(2,2,1)
    imagesc(croppedOriginal, [0, 1])
    colormap(gray)
    title('Original Image')
    axis image
end

