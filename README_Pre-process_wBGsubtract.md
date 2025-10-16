**README — Pre-process_wBGsubtract.ijm**

**Purpose**

This FIJI macro automates batch preprocessing of confocal .czi images and their corresponding ROI files for manual c-Fos counting.
It imports images, applies ROI masks, removes background, and exports ready-to-analyze .tif files.

**Input**

Input folder should contain raw .czi files and their corresponding ROI files.
ROI filenames must match the image names with the suffix _ROI.roi.
Example:  BC6_20x.czi  →  BC6_20x_ROI.roi

**Output**

The macro saves processed .tif files into a user-specified output folder (can be empty initially).
Each output file is background-subtracted, color-adjusted, and ready for manual c-Fos cell counting in FIJI or other compatible software.

**Processing Steps**

1. Batch import of .czi images via Bio-Formats.
2. Automatic loading of matching ROI files.
3. Removal of overlays and reapplication of ROIs.
4. Duplication of the selected regions and clearing outside areas.
5. Channel color assignment:
    Channel 1: Blue (for DAPI)
    Channel 2: Green (for c-Fos)
    Channel 3: Magenta (for Neurotrace)
6. Background subtraction using a rolling ball radius of 20 pixels.
7. Intensity normalization (0–120).
8. Export of final .tif image.


**Usage**

1. Open FIJI → Plugins → Macros → Run…
2. Select BGsubtract_cFos.ijm.
3. Choose the input folder (with .czi and _ROI.roi files).
4. Choose an output folder (can be empty).
5. Wait until the “Batch process done!” message appears.

**Output Example**

Input:  BC6_20x.czi
ROI:    BC6_20x_ROI.roi
Output: BC6_20x.tif   (background-subtracted, ROI-applied)

**Notes**

Make sure all .czi and _ROI.roi files are paired and located in the same input directory.
Unpaired .czi files will be skipped automatically.
Do not manually interrupt the process once batch mode begins.
Recommended FIJI version: ≥ 1.54g with Bio-Formats plugin installed.