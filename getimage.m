pkg load image-acquisition;
obj = videoinput("v4l2", "/dev/video0");

set(obj, "VideoFormat", "RGB3");
set(obj, "VideoResolution", [640 480]);

#preview(obj);

start(obj);

img = getsnapshot(obj);
image(img);

stop(obj);