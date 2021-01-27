### Object detection using MMDetection on Ubutnu (x86)

# Step 1: Installing Torch, Torchvision, mmcv Packages and there dependencies
  - cd mmdetection_ubuntu(x86)
  - chmod +x setup.sh
  - . ./setup.sh

* Note: Make sure setup.sh has to run as mentioned ". ./setup.sh"

# Step 2 : Run demo.py
  - python3 demo/image_demo.py demo/demo.jpg configs/faster_rcnn/faster_rcnn_r50_fpn_1x_coco.py ckpts/faster_rcnn_r50_fpn_1x_coco_20200130-047c8118.pth --device cpu

## Reference
  - GitHub repo (https://github.com/open-mmlab/mmdetection) 
  - MMCV installation (https://github.com/open-mmlab/mmdetection/issues/3271#issuecomment-762705676)
  - Documentation (https://mmdetection.readthedocs.io/en/latest/get_started.html#verification) 
  - MMCV GitHub (https://github.com/open-mmlab/mmcv)
  - Checkpoint download (https://github.com/open-mmlab/mmdetection/tree/master/configs/faster_rcnn)
