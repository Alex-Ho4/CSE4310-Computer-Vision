Name: Alex Ho
UTA ID: 1001294712

Task 2:
============

Task 2 was relatively straightforward. I utilized the same algorithm for finding the bounding box: I blurred the input frame and frame0000 then compared the difference. I grabbed all values above a threshold of 30 and then took the two largest connected areas which correspond to the torso and the legs. Once I had my person's shape, I used find() to get the matrix of non-zero elements and numel to count how many elements are in the matrix. If there are >= 1500 elements in the shape, I counted it as finding a person.

The range that counts as a person are from frame 18 to frame 110. It's able to successfully find the person for every frame in this range and tell there is no person in the other frames. I wanted it to be able to find the person starting at frame 15, but due to the set threshold, the person's shape does not track the full height of the person until around frame 28. I still chose this threshold because it follows the person more accurately in later frames, only being too short when the person is still partially obscured.

Task 3:
===========

Task 3 works by first getting the bounding box values from the two given frames. It then calculates the centroid for each one, getting the mean of the top and bottom rows for it's center row and the mean of the left and right columns for its center column. I then use parse_file_name() to get the frame numbers of the input and calculate the absolute value of the difference. The average velocity is calculated by subtracting the second frame's center from the first frame's center and dividing it by the frame difference. This is done for both rows and columns seperately.

Because it uses the same algorithm as Task 1 and 2, it also has the same issues near the edge. Using frames that are < 28 may be too short, so the vertical velocity may not be fully accurate. Frames that are > 110 do not count as having a person in it and the bounding box there shrinks considerably.