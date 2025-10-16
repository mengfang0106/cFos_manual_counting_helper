# cFos Manual Counting Helper

FIJI macros for batch preprocessing and optional background subtraction of confocal **c-Fos** images.  
These scripts automate the preparation of images and ROIs for manual c-Fos cell counting in FIJI.

---

## Files

| File | Description |
|------|--------------|
| `Pre-process.ijm` | Batch preprocessing **without** background subtraction. |
| `Pre-process_wBGsubtract.ijm` | Batch preprocessing **with** background subtraction (rolling ball = 20 px). |
| `README_Pre-process.md` | Instructions for the non-subtracted version. |
| `README_Pre-process_wBGsubtract.md` | Instructions for the background-subtracted version. |

---

## Usage

1. In FIJI: **Plugins → Macros → Run…**  
2. Choose either macro and select input/output folders.  
3. Each macro processes `.czi` + `_ROI.roi` pairs into `.tif` images ready for manual c-Fos counting.

---

## License

Released under the **MIT License**.  
You are free to use or adapt these macros with proper acknowledgment.

---

*Created by [Meng Fang](https://github.com/mengfang0106), 2025.*
