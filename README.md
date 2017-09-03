# FaceRecognition in ARKit

This is a simple showcase project, that detects faces using the Vision-API and runs the extracted face through a CoreML-model to identiy the specific persons.

![image of scene with face recognition](demo.gif)


## Requirements

* Xcode 9
* iPhone 6s or newer
* Machine-Learning model

## Machine-Learning model

More detailed instructions will follow. The short version is:

* We trained a model in the AWS using Nvidia DIGITS
* Took a couple of hundred pictures of each person, and extracted the faces
* Also added an "unknown" category with differnent faces.
* Used a pretrained model fine-tuned for face-recognition.

## Acknowledgements

* [3D-Text](https://github.com/hanleyweng/CoreML-in-ARKit)