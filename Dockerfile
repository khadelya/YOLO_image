FROM nvcr.io/nvidia/pytorch:22.04-py3
RUN rm -rf /opt/pytorch  # remove 1.2GB dir

# Downloads to user config dir
ADD https://ultralytics.com/assets/Arial.ttf https://ultralytics.com/assets/Arial.Unicode.ttf /root/.config/Ultralytics/

# Install linux packages
RUN apt update && apt install --no-install-recommends -y zip htop screen libgl1-mesa-glx

# Create working directory
RUN mkdir -p /usr/src/app

# Copy contents
RUN git clone https://github.com/ultralytics/yolov5 /usr/src/yolov5

# Install pip packages
RUN python -m pip install --upgrade pip
RUN pip uninstall -y torch torchvision torchtext Pillow
WORKDIR /usr/src/yolov5
RUN pip install --no-cache -r requirements.txt albumentations wandb gsutil notebook Pillow>=9.1.0 \
    torch torchvision --extra-index-url https://download.pytorch.org/whl/cu113

# Set environment variables
ENV OMP_NUM_THREADS=8
