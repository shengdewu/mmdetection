FROM dl.nvidia/cuda:11.1-cudnn8-devel-torch1.10.0

# Install MMCV
RUN pip3 install --no-cache-dir mmcv-full -f https://download.openmmlab.com/mmcv/dist/cu102/torch1.10.1/index.html


COPY mmdet /code/mmdetection/mmdet
COPY tools/train.py /code/mmdetection/tools
COPY setup.py /code/mmdetection
COPY setup.cfg /code/mmdetection
COPY README.md /code/mmdetection

RUN cd /code/mmdetection && pip3 install -v -e .

WORKDIR /code
ENTRYPOINT ["python3", "mmdetection/tools/train.py"]