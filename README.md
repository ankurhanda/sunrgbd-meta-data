##What does this repository contain?

The **SUNRGBD2Dseg.mat** contained in the **SUNRGBDtoolbox/Metadata** directory needs a RAM of about **64GB** to load either in MATLAB or Octave. Therefore, for future use and to avoid any dependence on the .mat file, the data (*i.e.* semantic segmentation labels) is extracted and stored in this repository. We also provide links to the RGB data. If you are looking to do semantic segmentation on the RGB images, this repository is self contained for that and you should be able to do it without having to download the dataset from the original links provided in the SUN RGB-D paper. However, if you need additional depth data, you will need to download the [tgz file](http://rgbd.cs.princeton.edu/data/SUNRGBD.zip) from the dataset link. We also provide code to turn depth into DHA features used in the [SceneNet](https://robotvault.bitbucket.io/) paper, by using the rotation matrices provided in the SUN RGB-D dataset. To summarise, this repository contains the following

- Train and test images path names in the SUN RGB-D provided in the **sunrgbd_training_images.txt** and **sunrgbd_testing_images.txt** respectively.
- 37 Class labels for images both in training and test dataset compressed in the **sunrgbd_test_train_labels.tar.gz** file.
- The first 5050 images in the **sunrgbd_test_train_labels.tar.gz** contain labels for test dataset while training set labels begin from 5051 and end at 10335.
- Training dataset (5285 jpg images) is available from [SUNRGBD-train_images.tgz](http://www.doc.ic.ac.uk/~ahanda/SUNRGBD-train_images.tgz)
- Test dataset (5050 jpg images) is available from [SUNRGBD-test_images.tgz](http://www.doc.ic.ac.uk/~ahanda/SUNRGBD-test_images.tgz)
- The mappings from 37 class labels to 13 class labels are provided in [SceneNetv1.0](https://github.com/ankurhanda/SceneNetv1.0) repository. The 37 class names are stored in **seg37list.mat** that comes in the SUNRGBDtoolbox but it contains the following list. 
~~~
>> seg = load('seg37list.mat');
>> seg.seg37list
ans = 
{
  [1,1] = wall
  [1,2] = floor
  [1,3] = cabinet
  [1,4] = bed
  [1,5] = chair
  [1,6] = sofa
  [1,7] = table
  [1,8] = door
  [1,9] = window
  [1,10] = bookshelf
  [1,11] = picture
  [1,12] = counter
  [1,13] = blinds
  [1,14] = desk
  [1,15] = shelves
  [1,16] = curtain
  [1,17] = dresser
  [1,18] = pillow
  [1,19] = mirror
  [1,20] = floor_mat
  [1,21] = clothes
  [1,22] = ceiling
  [1,23] = books
  [1,24] = fridge
  [1,25] = tv
  [1,26] = paper
  [1,27] = towel
  [1,28] = shower_curtain
  [1,29] = box
  [1,30] = whiteboard
  [1,31] = person
  [1,32] = night_stand
  [1,33] = toilet
  [1,34] = sink
  [1,35] = lamp
  [1,36] = bathtub
  [1,37] = bag
}
~~~

- 13 class training/testing labels are provided in **train13labels.tgz** and **test13labels.tgz** respectively, in this directory.

This alleviates the burden of having to install MATLAB (that requires a license) on your computer and parsing the .mat files in the SUN RGB-D dataset.

## Training on RGB data for 13 classes 

- Get the RGB training data from [SUNRGBD-training_images.tgz](http://www.doc.ic.ac.uk/~ahanda/SUNRGBD-train_images.tgz)
- Get the 13 class labels from [train13labels.tgz](https://github.com/ankurhanda/sunrgbd-meta-data/blob/master/train13labels.tgz).
- Correspondingly, get the test RGB images from [SUNRGBD-test_images.tgz](http://www.doc.ic.ac.uk/~ahanda/SUNRGBD-test_images.tgz) and 13 class labels from [test13labels.tgz](https://github.com/ankurhanda/sunrgbd-meta-data/blob/master/test13labels.tgz) for any benchmarking.


## Training on RGB data for 37 classes

- Get the RGBs as above.
- Dowload the **sunrgbd_train_test_labels.tar.gz** in this directory and untar it ``tar -xvzf sunrgbd_train_test_labels.tar.gz``.
- Create two directories ``mkdir -p labels/train labels/test``
- Move the first 5050 files in ``test`` directory 
``mv ../img-00[0-4]*.png test && mv ../img-0050[0-4]*.png test && mv ../img-005050.png test`` 
and remaining in ``train`` directory ``mv ../img-*.png train``.
- If you need to create a ``.txt`` file with names of corresponding rgbs and labels, please follow this 
``paste sunrgbd_rgb_files.txt -d' ' sunrgbd_labels37_files.txt`` where ``sunrgbd_rgb_files.txt`` contains the names of the rgb files and similarly for ``sunrgbd_labels37_files.txt``

## How do I compute the DHA features?

- Download the SUN RGB-D dataset and make sure your paths are set properly. The SUN RGB-D dataset can be obtained from the link, [SUN RGB-D](http://rgbd.cs.princeton.edu/data/SUNRGBD.zip). The SUN RGB-D toolbox needed to parse the files is available here at [toolbox](http://rgbd.cs.princeton.edu/data/SUNRGBDtoolbox.zip).
- Depth images are contained in the depth_bfx folder in the SUN RGB-D dataset. You should be able to see that in one of the folders after you compress the .zip file ``SUNRGBD/kv1/NYUdata/NYU0034/depth_bfx``. These depth images have been obtained by running an inpainting algorithm on the raw depth images (that contain holes and missing values) to obtain a complete depth image for which each pixel has a depth value.
- Make sure you have octave installed on your machine. If not, please install via apt-get on your ubuntu machine ``sudo apt-get install octave`` or ``pacman -Sy octave`` on your arch linux machine.
- Run the **computeDHA_SUNRGBD.m** file in Octave (type octave --no-gui in your terminal) and it should return you the DHA features saved .bin file (if you wish to save in another format you could easily modify the code). 
- Camera rotation matrices are provided in **sunrgbd_train_T_fileNames.txt**, to allow for mapping the floor normal vector to gravity vector to obtain height from ground plane. 

## How do I benchmark? 
[getAccuracyNYU.m](https://github.com/ankurhanda/SceneNetv1.0/blob/master/getAccuracyNYU.m) available in the [SceneNetv1.0](https://github.com/ankurhanda/SceneNetv1.0/) repository allows you to obtain the avereage global and class accuracies. 

## What are the classes and where is the mapping form the class number to the class name?

The mapping is also available at [SceneNetv1.0](https://github.com/ankurhanda/SceneNetv1.0/) repository.
