##What does this repository contain?

The **SUNRGBD2Dseg.mat** contained in the **SUNRGBDtoolbox/Metadata** directory needs a RAM of about **64GB** to load either in MATLAB or Octave. Therefore, the data (*i.e.* semantic segmentation labels) that is needed to do semantic segmentation experiments is extracted and stored in this repository.

- Train and test images path names in the SUN RGB-D
- 37 Class labels for images both in training and test dataset compressed in the .tar.gz file.
- The first 5050 images in the .tar.gz file contain labels for test dataset while training set labels begin from 5051 and end at 10335.
- Training dataset (5285 jpg images) is available from [SUNRGBD-train_images.tgz](http://www.doc.ic.ac.uk/~ahanda/SUNRGBD-train_images.tgz)
- Test dataset (5050 jpg images) is available from [SUNRGBD-test_images.tgz](http://www.doc.ic.ac.uk/~ahanda/SUNRGBD-test_images.tgz)


This alleviates the burden of having to install MATLAB (that requires a license) on your computer and parsing the .mat files in the SUN RGB-D dataset.
