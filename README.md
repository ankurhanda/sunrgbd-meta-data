##What does this repository contain?

The **SUNRGBD2Dseg.mat** contained in the **SUNRGBDtoolbox/Metadata** directory needs a RAM of about **64GB** to load either in MATLAB or Octave. Therefore, for future use and to avoid any dependence on the .mat file, the data (*i.e.* semantic segmentation labels) is extracted and stored in this repository. We also provide links to the RGB data. If you are looking to do semantic segmentation on the RGB images, this repository is self contained for that and you should be able to do it without having to download the dataset from the original links provided in the SUN RGB-D paper. However, if you need additional depth data, you will need to download the tgz file from the dataset link. We also provide code to turn depth into DHA features used in the [SceneNet](https://robotvault.bitbucket.io/) paper, by using the rotation matrices provided in the SUN RGB-D dataset. 

- Train and test images path names in the SUN RGB-D provided in the **sunrgbd_training_images.txt** and **sunrgbd_testing_images.txt** respectively.
- 37 Class labels for images both in training and test dataset compressed in the **sunrgbd_test_train_labels.tar.gz** file.
- The first 5050 images in the **sunrgbd_test_train_labels.tar.gz** contain labels for test dataset while training set labels begin from 5051 and end at 10335.
- Training dataset (5285 jpg images) is available from [SUNRGBD-train_images.tgz](http://www.doc.ic.ac.uk/~ahanda/SUNRGBD-train_images.tgz)
- Test dataset (5050 jpg images) is available from [SUNRGBD-test_images.tgz](http://www.doc.ic.ac.uk/~ahanda/SUNRGBD-test_images.tgz)
- The mappings from 37 class labels to 13 class labels is provided in [SceneNetv1.0](https://github.com/ankurhanda/SceneNetv1.0) repository.

This alleviates the burden of having to install MATLAB (that requires a license) on your computer and parsing the .mat files in the SUN RGB-D dataset.

## How do I compute the DHA features?

- Download the SUN RGB-D dataset and make sure your paths are set properly. The SUN RGB-D dataset can be obtained from the link, [SUN RGB-D](http://rgbd.cs.princeton.edu/data/SUNRGBD.zip). The SUN RGB-D toolbox needed to parse the files is available here at [toolbox](http://rgbd.cs.princeton.edu/data/SUNRGBDtoolbox.zip).
- Depth images are contained in the depth_bfx folder in the SUN RGB-D dataset. You should be able to see that in one of the folders after you compress the .zip file ``SUNRGBD/kv1/NYUdata/NYU0034/depth_bfx``. These depth images have been obtained by running an inpainting algorithm on the raw depth images (that contain holes and missing values) to obtain a complete depth image for which each pixel has a depth value.
- Make sure you have octave installed on your machine. If not, please install via apt-get on your ubuntu machine ``sudo apt-get install octave`` or ``pacman -Sy octave`` on your arch linux machine.
- Run the computeDHA_SUNRGBD.m file in Octave (type octave --no-gui in your terminal) and it should return you the DHA features saved .bin file (if you wish to save in another format you could easily modify the code). 

##More meta data

- Camera rotation matrices are provided in **sunrgbd_train_T_fileNames.txt**, to allow for mapping the floor normal vector to gravity vector to obtain height from ground plane.
- Code to compute the DHA features from the depth image. The **computeDHA_SUNRGBD.m** file should run in octave.