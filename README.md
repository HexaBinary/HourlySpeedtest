# Hourly Speedtest
is a basic Bash script to automatically run a network speed test using the Ookla Speedtest CLI and save results to a file

# Requirements
### Install Speedtest CLI
    $ sudo apt-get install curl\
    $ curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash\
    $ sudo apt-get install speedtest
### Edit the filename variable in the script to the path of the file you want the results to be saved to
    #!/bin/bash

    filename='test_results.txt' # Change this field to the path to the file of your choice
    
    ...
### Create a link of this file to the cron folders in /etc - You can also set a cronjob if you have a specific timing requirement
    $ sudo ln -s ~/autospeedtest.sh /etc/cron.hourly 
      # You can choose between hourly/daily/weekly/monthly
