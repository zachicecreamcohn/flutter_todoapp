# Setup

## Install Flutter Everywhere on your computer
1. Move the ```flutter``` app that we downloaded into your home directory. For me, this is ```Users/zacharycohn/```.
2. ```cd``` into your home directory by opening a terminal window and typing ```cd ~```
3. Type ```open -e .zprofile``` and hit enter.
- If this doesn't work, try ```open -e .bash_profile``` or ```open -e .zshrc```
4. Paste the following into the bottom of the document that opens:
```
export PATH="$PATH:/Users/<your-name>/flutter/bin"
export PATH="$PATH:$HOME/.pub-cache/bin"
```
- Remember to change ```<your-name>``` to match the home directory name. For me, it was ```export PATH="$PATH:/Users/zacharycohn/flutter/bin```
5. Save and close the window
6. In your terminal, type: ```source .zprofile``` Note, for you it might be ```source .bash_profile``` or ```source .zshrc```.
7. Now, flutter should be installed everywhere. You can type ```flutter -v``` to confirm that. If you see a bunch of text, you know it's installed.


## Open the iphone simulator
1. Run ```open -a Simulator``` in the terminal


## Create the app
1. Run this in your terminal to create a new flutter app: ```flutter create <my_app>```. Change ```<my_app>``` to whatever you want to call the app
2. ```cd``` into the folder that has been automatically created. 
3. To run the app, make sure you're in the new directory that was created and run: ```flutter run```


## The coding part
- All of your coding will be in the ```lib``` folder