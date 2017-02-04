##What does this repository contain?

The **SUNRGBD2Dseg.mat** contained in the **SUNRGBDtoolbox/Metadata** directory needs a RAM of about **64GB** to load either in MATLAB or Octave. Therefore, the data (*i.e.* semantic segmentation labels) that is needed to do semantic segmentation experiments is extracted and stored in this repository.

- Train and test images path names in the SUN RGB-D
- 37 Class labels for images both in training and test dataset compressed in the .tar.gz file.
- The first 5050 images in the .tar.gz file contain labels for test dataset while training set labels begin from 5051 and end at 10335.
- Training dataset (5285 jpg images) is available from [SUNRGBD-train_images.tgz](http://www.doc.ic.ac.uk/~ahanda/SUNRGBD-train_images.tgz)
- Test dataset (5050 jpg images) is available from [SUNRGBD-test_images.tgz](http://www.doc.ic.ac.uk/~ahanda/SUNRGBD-test_images.tgz)
- The mappings from 37 class labels to 13 class labels is provided in [SceneNetv1.0](https://github.com/ankurhanda/SceneNetv1.0) repository.

This alleviates the burden of having to install MATLAB (that requires a license) on your computer and parsing the .mat files in the SUN RGB-D dataset.

##More meta data

- Camera rotation matrices are provided to allow for mapping the normal vector to gravity vector to obtain height from ground plane.
- Code to compute the DHA features from the depth image. The computeDHA_SUNRGBD.m file should run in octave.