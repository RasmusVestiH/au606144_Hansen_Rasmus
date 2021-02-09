#!/usr/bin/env python
# coding: utf-8

# ## Assignment 1 - Basic image processing
# 
# Basic scripting with Python
# 
# Create or find small dataset of images, using an online data source such as Kaggle. At the very least, your dataset should contain no fewer than 10 images.
# 
# 
# 
# Write a Python script which does the following:
# 
# For each image, find the width, height, and number of channels
# 
# For each image, split image into four equal-sized quadrants (i.e. top-left, top-right, bottom-left, bottom-right)
# 
# Save each of the split images in JPG format
# 
# Create and save a file containing the filename, width, height for all of the new images.
# 
# 
# General instructions
# 
# For this exercise, you can upload either a standalone script OR a Jupyter Notebook
# Save your script as basic_image_processing.py OR basic_image_processing.ipynb
# If you have external dependencies, you must include a requirements.txt
# You can either upload the script here or push to GitHub and include a link - or both!
# Your code should be clearly documented in a way that allows others to easily follow the structure of your script.
# Similarly, remember to use descriptive variable names! A name like width is more readable than w.
# The filenames of the split images should clearly relate to the original image.
# 
# 
# Purpose
# 
# This assignment is designed to test that you have a understanding of:
# 
# how to structure, document, and share a Python script;
# how to effectively make use of basic functions in cv2;
# how to read, write, and process images files.

# In[185]:


import os
import numpy as np
import sys 
sys.path.append(os.path.join(".."))
import cv2


# In[186]:


from utils.imutils import jimshow
from pathlib import Path


# In[187]:


filepath = os.path.join("..","data","pictures")


# In[188]:


filepath


# In[ ]:





# In[189]:


#creating the newlist in which the image files with name will append to

newlist = []
data_path = Path(filepath)

for filename in os.listdir(data_path):
    image = cv2.imread(os.path.join(data_path, filename))
    newlist.append(f"width, height, channels for {filename} are {image.shape}")
   



 


# In[190]:


string_image_atr = "\n".join(newlist) #We set them as newlines to create a better overview


# In[191]:


image_atr_file = os.path.join("..","data", "image_file.txt") #The joining the path for where the file is going to be saved


# In[192]:


with open(image_atr_file, "w", encoding = "utf-8") as file:
    file.write(string_image_atr) #Writing the file above


# In[193]:


#We make a loop in which the filename loops this part is not completed as I could not figure it out. 
for filename in os.listdir(datapath):
    image = cv2.imread(os.path.join(datapath, filename))

    height, width, channels = image.shape
    
    half_height = int(height/2)
    half_width = int(width/2)
    
    quadrant_1 = image_split(0,half_height,0,half_width,image)
    quadrant_2 = image_split(0,half_height,half_width, width,image)
    quadrant_3 = image_split(half_height,height,0, half_width,image)
    quadrant_4 = image_split(half_height,height,half_width, width,image)
    
    new_images = [quadrant_1, quadrant_2, quadrant_3, quadrant_4]
    newlist = np.array(image.shape)
    
    #Trying to save the files I have given up. Don't know how to save it as a csv or even how to get the data sorted it out... 
    outfile = os.path.join(datapath, str(new_images) + ".jpg")
    
    temp_df = ({'filename': newlist, 'height': height, 'width': width, "channels" : channels})

    print(temp_df)


# In[145]:


temp_df


# In[ ]:




