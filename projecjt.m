videoObject = VideoReader("video3.mp4")

	numberOfFrames = videoObject.NumberOfFrames
	vidHeight = videoObject.Height;
	vidWidth = videoObject.Width;
	
	numberOfFramesWritten = 0;

 	for frame = 1 : numberOfFrames
		
		thisFrame = read(videoObject, frame);
		hImage = subplot(2, 2, 1);
		image(thisFrame);
		caption = sprintf('Frame %4d of %d.', frame, numberOfFrames);
		title("title");
		drawnow; 
		
		numberOfFramesWritten = numberOfFramesWritten + 1;
		
        alpha = .97;
		if frame == 1
			Background = thisFrame;
        else
			Background = (1-alpha)* thisFrame + alpha * Background;
        end
		subplot(2, 2, 3);
		imshow(Background);
		title('Adaptive Background');
		differenceImage = uint8(Background)-thisFrame;
		grayImage = rgb2gray(differenceImage); 
		thresholdLevel = graythresh(grayImage); 
		binaryImage = imbinarize( grayImage, thresholdLevel); 
		subplot(2, 2, 4);
		imshow(binaryImage);
		title('Binarized Difference Image');
	end
