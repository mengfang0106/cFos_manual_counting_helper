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

print("\\Clear"); 
print("Start process directory: " + inputDir);


for (i = 0; i < list.length; i++) {
    if (endsWith(list[i], ".czi")) {
        cziName = list[i];
        print("---");
        print("Found CZI file: " + cziName);

        baseName = replace(cziName, ".czi", ""); 
        roiName = baseName + "_ROI.roi"; 
        
        cziPath = inputDir + cziName;
        roiPath = inputDir + roiName;

        if (File.exists(roiPath)) {
            print("Found matched ROI: " + roiName);

            run("Bio-Formats Importer", "open=[" + cziPath + "] autoscale color_mode=Default view=Hyperstack stack_order=XYCZT");

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
			
			outputPath = outputDir + baseName + ".tif";
            saveAs("Tiff", outputPath);
            print("Saved:" + baseName + ".tif");

        } else {
            print("  >> Warning: ROI file not found: " + roiName);
        }
		
		close("*"); 
    }
}

setBatchMode(false);
print("---");
print("Batch process done!");