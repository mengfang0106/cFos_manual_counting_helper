/*
 * Macro to Batch Process CZI and ROI files
 * Pre-process for c-Fos manual counting
 */

/*
 * Select input folder first and then output folder
 */

inputDir = getDirectory("Select Input Folder");
outputDir = getDirectory("Select Output Folder");

setBatchMode(true); 

list = getFileList(inputDir);

for (i = 0; i < list.length; i++) {
    if (endsWith(list[i], ".czi")) {
        cziName = list[i];

        baseName = replace(cziName, ".czi", ""); 
        roiName = baseName + "_ROI.roi"; 
        
        cziPath = inputDir + cziName;
        roiPath = inputDir + roiName;

        if (File.exists(roiPath)) {

            run("Bio-Formats Importer", "open=[" + cziPath + "] autoscale color_mode=Default view=Hyperstack stack_order=XYCZT quiet");

            roiManager("reset"); 
            roiManager("open", roiPath);
            
            run("Remove Overlay");
            
            n = roiManager("count");
			for (k = 0; k < n; k++) {
   				roiManager("select", k);
    			run("Add Selection...");   
			}
			run("Show Overlay");            

			call("ij.Prefs.set", "overlay.save", "true");

     		//
            
            run("Duplicate...", "duplicate");

			setBackgroundColor(0, 0, 0);

			run("Clear Outside", "stack");

			Property.set("CompositeProjection", "null");

			Stack.setDisplayMode("color");
			Stack.setChannel(1);
			run("Blue");
			Stack.setChannel(2);
			run("Green");
			Stack.setChannel(3);
			run("Magenta");
			
			Stack.setChannel(2);
			run("Subtract Background...", "rolling=20 slice");
			setMinAndMax(0, 120);
		
		//
		
			outputPath = outputDir + baseName + ".tif";
            saveAs("Tiff", outputPath);

        } else {
        }
		
		close("*"); 
    }
}

setBatchMode(false);
print("Batch process done!");