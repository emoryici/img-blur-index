//  Integrated Cellular Imaging (ICI) - Emory University
//  Integrated Core Facilities
//
//  Neil R. Anthony  -  09/03/2018

//  Calculate blur index for stack
//

// set FFT options to default
run("FFT Options...", "fft");

// create results table and heading names for blur
blur_title = "blurdata";
blur_title_wnd = "["+blur_title+"]";
run("Table...", "name="+blur_title_wnd+" width=900 height=500");
blur_head_str = "\\Headings:z\tchn1_blur\tchn2_blur";
print(blur_title_wnd, "\\Clear");
print(blur_title_wnd, blur_head_str);

title = getTitle();

Stack.getDimensions(width, height, channels, slices, frames);
//print(width, height, channels, slices, frames);



for (i = 0; i < slices; i++) {

	Stack.setSlice(i+1);
	setBatchMode(true);
	Stack.setChannel(1);
	run("FFT");
	run("Specify...", "width=512 height=512 x=0 y=0");
	getStatistics(area, mean, min, max, std, histogram);
	setThreshold(mean + (3*std), 255);
	run("Create Selection");
	getStatistics(area);
	c1b = area;
	close();

	Stack.setChannel(2);
	run("FFT");
	run("Specify...", "width=512 height=512 x=0 y=0");
	getStatistics(area, mean, min, max, std, histogram);
	setThreshold(mean + (3*std), 255);
	run("Create Selection");
	getStatistics(area);
	c2b = area;
	close();
	setBatchMode(false);
	//"\\Headings:z\tchn1_blur\tchn2_blur";
	print(blur_title_wnd, i+1 + "\t" + c1b + "\t" + c2b);
	
}




