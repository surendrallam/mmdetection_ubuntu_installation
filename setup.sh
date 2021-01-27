## MMDetection installation on Ubuntu(x86)

## Installing the necessary Packages and Libraries.

echo "Installing necessary Packages and Libraries"
sudo apt-get update
sudo apt-get install python3-dev
echo -e "\n\n Done updating\n\n"

if python -c 'import pkgutil; exit(not pkgutil.find_loader("git"))'; then
    echo ""
else
    sudo apt-get install git
    echo -e "\n\nDone installing git\n\n"
fi


if python -c 'import pkgutil; exit(not pkgutil.find_loader("pip"))'; then
    echo ""
else
    sudo apt-get install python3-pip
    echo -e "\n\nDone installing pip\n\n"
fi


if python -c 'import pkgutil; exit(not pkgutil.find_loader("torch"))'; then
    echo ""
else
    pip3 install torch
    echo -e "\n\nDone installing torch\n\n"
fi


if python -c 'import pkgutil; exit(not pkgutil.find_loader("torchvision"))'; then
    echo ""
else
    pip3 install  torchvision
    echo -e "\n\nDone installing torchvision\n\n"
fi

echo "Done installing Libraries."

echo -e "\n\nDownloading necessary Git Repo and installing libraries\n\n"
## Downloading necessary Git Repo's

##Install mmcv-full
cd
DIR="mmcv/"
if [ -d "$DIR" ]; then
  rm -rf mmcv/
  git clone https://github.com/open-mmlab/mmcv.git
  cd mmcv
  MMCV_WITH_OPS=1 python3 -m pip install -e . # package mmcv-full will be installed after this step cd ..
else
  git clone https://github.com/open-mmlab/mmcv.git
  cd mmcv
  MMCV_WITH_OPS=1 python3 -m pip install -e . # package mmcv-full will be installed after this step cd ..
  exit 1
fi

echo -e "\n\n Done installting MMCV\n\n"

##Clone the MMDetection repository.
cd
DIR="mmdetection/"
if [ -d "$DIR" ]; then
  rm -rf mmdetection/
  git clone https://github.com/open-mmlab/mmdetection.git
  cd mmdetection
  pip3 install -r requirements/build.txt
  pip3 install -v -e .
else
  git clone https://github.com/open-mmlab/mmdetection.git
  cd mmdetection
  pip3 install -r requirements/build.txt
  pip3 install -v -e .
  exit 1
fi

echo -e "\n\nDone cloning MM Detection\n\n"

## Downloading checkpoint
DIR="ckpts/"
if [ -d "$DIR" ]; then
  cd ckpts
  wget http://download.openmmlab.com/mmdetection/v2.0/faster_rcnn/faster_rcnn_r50_fpn_1x_coco/faster_rcnn_r50_fpn_1x_coco_20200130-047c8118.pth
  cd ../
else
  mkdir ckpts
  cd ckpts
  wget http://download.openmmlab.com/mmdetection/v2.0/faster_rcnn/faster_rcnn_r50_fpn_1x_coco/faster_rcnn_r50_fpn_1x_coco_20200130-047c8118.pth
  cd ../
  exit 1
fi

echo -e "\n\nDone with downloading checkpoint\n\n"
