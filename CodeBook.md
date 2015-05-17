##This is a CodeBook for dataset created by run_analysis.R

There are two main variables

1. subject - Identificator of person being measured (30 subjects in total)
2. activity - a factor variable describing activity perfomed by subject (6 activities in total)

And feature variables. Feature variables have various distinctions: 
* **gyro** and **Acc** They come from two devices - gyroscope and accelerometr.
* **Body** and **Gravity** - Acceleration signals are divided into Body and Gravity signals.
* **Jerk** -Body linear acceleration and angular velocity were derived in time to obtain Jerk signals.
* **Mag** - Means magnitude calculated using Euclidean norm
* **mean()** - Means mean value
* **std()** - Mean standard deviation
* **meanFreq()** - Mean weighted average of the frequency components to obtain a mean frequency
* **prefix t** - Means time domain signal captured at constant rate of 50hz
* **prefix f** - Means frequency domain signals, after applying FFT
* suffixes **X**, **Y**, **Z** - are directions

List of all features:
3. tBodyAcc-mean()-X
4. tBodyAcc-mean()-Y
5. tBodyAcc-std()-Z
6. tGravityAcc-mean()-X
7. tGravityAcc-mean()-Y
8. tGravityAcc-mean()-Z
9. tGravityAcc-std()-X
10. tGravityAcc-std()-Y
11. tGravityAcc-std()-Z
12. tBodyAccJerk-mean()-X
13. tBodyAccJerk-mean()-Y
14. tBodyAccJerk-mean()-Z
15. tBodyAccJerk-std()-X
16. tBodyAccJerk-std()-Y
17. tBodyAccJerk-std()-Z
18. tBodyGyro-mean()-X
19. tBodyGyro-mean()-Y
20. tBodyGyro-mean()-Z
21. tBodyGyro-std()-X
22. tBodyGyro-std()-Y
23. tBodyGyro-std()-Z
24. tBodyGyroJerk-mean()-X
25. tBodyGyroJerk-mean()-Y
26. tBodyGyroJerk-mean()-Z
27. tBodyGyroJerk-std()-X
28. tBodyGyroJerk-std()-Y
29. tBodyGyroJerk-std()-Z
30. tBodyAccMag-mean()
31. tBodyAccMag-std()
32. tGravityAccMag-mean()
33. tGravityAccMag-std()
34. tBodyAccJerkMag-mean()
35. tBodyAccJerkMag-std()
36. tBodyGyroMag-mean()
37. tBodyGyroMag-std()
38. tBodyGyroJerkMag-mean()
39. tBodyGyroJerkMag-std()
40. fBodyAcc-mean()-X
41. fBodyAcc-mean()-Y
42. fBodyAcc-mean()-Z
43. fBodyAcc-std()-X
44. fBodyAcc-std()-Y
45. fBodyAcc-std()-Z
46. fBodyAcc-meanFreq()-X
47. fBodyAcc-meanFreq()-Y
48. fBodyAcc-meanFreq()-Z
49. fBodyAccJerk-mean()-X
50. fBodyAccJerk-mean()-Y
51. fBodyAccJerk-mean()-Z
52. fBodyAccJerk-std()-X
53. fBodyAccJerk-std()-Y
54. fBodyAccJerk-std()-Z
55. fBodyAccJerk-meanFreq()-X
56. fBodyAccJerk-meanFreq()-Y
57. fBodyAccJerk-meanFreq()-Z
58. fBodyGyro-mean()-X
59. fBodyGyro-mean()-Y
60. fBodyGyro-mean()-Z
61. fBodyGyro-std()-X
62. fBodyGyro-std()-Y
63. fBodyGyro-std()-Z
64. fBodyGyro-meanFreq()-X
65. fBodyGyro-meanFreq()-Y
66. fBodyGyro-meanFreq()-Z
67. fBodyAccMag-mean()
68. fBodyAccMag-std()
69. fBodyAccMag-meanFreq()
70. fBodyBodyAccJerkMag-mean()
71. fBodyBodyAccJerkMag-std()
72. fBodyBodyAccJerkMag-meanFreq()
73. fBodyBodyGyroMag-mean()
74. fBodyBodyGyroMag-std()
75. fBodyBodyGyroMag-meanFreq()
76. fBodyBodyGyroJerkMag-mean()
77. fBodyBodyGyroJerkMag-std()
78. fBodyBodyGyroJerkMag-meanFreq()


