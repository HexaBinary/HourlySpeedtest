# Hourly Speedtest
is a basic Bash script to automatically run a network speed test using the Ookla Speedtest CLI and save results to a file
## By using this script you agree to the End User License Agreement, Terms of Use and Privacy Policy of the Speedtest software at these URLs:
    https://www.speedtest.net/about/eula
	https://www.speedtest.net/about/terms
	https://www.speedtest.net/about/privacy
# Instructions
## Install Speedtest CLI
    $ sudo apt-get install curl
    $ curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
    $ sudo apt-get install speedtest bc jq
### If you are using a Raspberry Pi (running raspbian), the OS detection in the installation script won't work. You will need to do the following after the previus step (Ignore if you run generic debian-ubuntu etc.)
    $ sudo nano /etc/apt/sources.list.d/ookla_speedtest-cli.list
#### Change the last two lines with the following (Change the raspbian at the end of the https://packagecloud... url to debian)
    deb [signed-by=/etc/apt/keyrings/ookla_speedtest-cli-archive-keyring.gpg] https://packagecloud.io/ookla/speedtest-cli/debian/ buster main
    deb-src [signed-by=/etc/apt/keyrings/ookla_speedtest-cli-archive-keyring.gpg] https://packagecloud.io/ookla/speedtest-cli/debian/ buster main
    
## Edit the filename variable in the script to the path of the file you want the results to be saved to
    #!/bin/bash

    filename='test_results.txt' # Change this field to the path to the file of your choice
    
    ...
## Set a cronjob to run the script on a set schedule
    $ sudo crontab -e
Choose the editor of your liking\
\
Edit and add the following to the end

    @hourly /bin/bash /path/to/the/script/autospeedtest.sh
    # You can edit the first argument of this to the schedule you want with the (min hour day-month month day-week) syntax 
    # or use the presets e.g @daily/weekly/monthly
