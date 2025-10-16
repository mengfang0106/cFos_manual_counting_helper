**README — Pre-process.ijm**

**Purpose**

This FIJI macro performs the same batch preprocessing as BGsubtract_cFos.ijm, except it does not include the background subtraction step. It is intended for users who prefer to perform manual or customized background correction afterward.

**Recommended Post-output Workflow**

	1	Measure background intensity for each image: Analyze → Measure → record the Mean value of a background region.
	2	Subtract background manually: Process → Math → Subtract… → enter the measured mean value.

**Notes**

	•	All other preprocessing steps (ROI loading, overlay removal, masking, channel color assignment, etc.) remain identical to the background-subtracted version.
	•	Output .tif files are ready for downstream manual c-Fos counting after background correction.
