##What does this repository contain?

The **SUNRGBD2Dseg.mat** contained in the **SUNRGBDtoolbox/Metadata** directory needs a RAM of about **64GB** to load either in MATLAB or Octave. Therefore, the much needed data that is needed to do semantic segmentation experiments is extracted and stored in this repository.

- Train and test images path names in the SUN RGB-D
- 37 Class labels for images both in training and test dataset compressed in the .tar.gz file.

This alleviates the burden of having to install MATLAB (that requires a license) on your computer and parsing the excrutiatingly complicatted .mat files in the SUN RGB-D dataset.