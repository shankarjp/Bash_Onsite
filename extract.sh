#! /bin/bash

sudo apt install lynx
lynx -dump -nolist https://gist.github.com/Shreyas-21/5a75554046ce7fcd70af3c88cebd8393 | awk '/file1.txt/{flag=1; next} /Raw/{flag=0} flag' > file1.txt
lynx -dump -nolist https://gist.github.com/Shreyas-21/5a75554046ce7fcd70af3c88cebd8393 | awk '/file2.txt/{flag=1; next} /Raw/{flag=0} flag' > file2.txt
lynx -dump -nolist https://gist.github.com/Shreyas-21/5a75554046ce7fcd70af3c88cebd8393 | awk '/file3.txt/{flag=1; next} /Sign up/{flag=0} flag' > file3.txt
