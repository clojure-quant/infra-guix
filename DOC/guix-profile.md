

# profiles

Goal: create byte identical profiles over time that are not only shared between machines (important for deployment) but also between developers. 
Development, testing, staging, production - essentially these are all profiles!

guix package -i sambamba -p ~/opt/sambamba
Guix provides a profile file which contains the necessary shell settings into the environment
cat ~/opt/sambamba/etc/profile


For trying things out, I recommend using `guix environment --ad-hoc foo`
That way, your profile history does not contain the thing that you just wanted to try out, so `guix gc` can work more efficiently


