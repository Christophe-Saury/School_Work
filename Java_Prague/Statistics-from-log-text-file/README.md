# Statistics-from-log-text-file
Had to build a program that could process a log text file containing 2-3 million lines, and from there establish statistics of the number of successful logins for each ip
adress. This was made for my school in a contest with 50 participants with the goal of making the fastest working program. I ended up 3/50

The program uses a for loop to go through the logs then filters them using the minimal amount of required characters to filter them. It then sets up a dictionary to 
store the number of times each ip adress logged in successfully.

Something I wanted to try implementing but failed / didn't have time to do was to use asynchronous threads to cut the log entries into multiple equal parts and go through
each of these parts simultaneously. 
