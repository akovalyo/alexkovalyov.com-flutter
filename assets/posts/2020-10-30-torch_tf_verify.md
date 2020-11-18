---
layout: post
title: "Verifying Pytorch/Tensorflow is using the GPU"
date: 2020-10-30
description: Checking the correctness of installation
image: /assets/images/torch-tf.png
author: Alex Kovalyov
tags: 
  - pytorch
  - tensorflow
---


## Pytorch

```python
import torch

print('__pyTorch VERSION:', torch.__version__)
print('CUDA available: ' + str(torch.cuda.is_available()))
print('cuDNN version: ' + str(torch.backends.cudnn.version()))
print('__Number CUDA Devices:', torch.cuda.device_count())
print('Active CUDA Device: GPU', torch.cuda.current_device())

a = torch.cuda.FloatTensor(2).zero_()
print('Tensor a = ' + str(a))
b = torch.randn(2).cuda()
print('Tensor b = ' + str(b))
c = a + b
print('Tensor c = ' + str(c))

```

#### torchvision

```python


import torchvision

print(torchvision.__version__)
```


## Tensorflow

```python

import tensorflow as tf

print("Num GPUs Available: ", len(tf.config.experimental.list_physical_devices('GPU')))

```

```python

tf.debugging.set_log_device_placement(True)
a = tf.constant([[1.0, 2.0, 3.0], [4.0, 5.0, 6.0]])
b = tf.constant([[1.0, 2.0], [3.0, 4.0], [5.0, 6.0]])
c = tf.matmul(a, b)

print(c)

```

The above code will print an indication the MatMul op was executed on GPU:0.