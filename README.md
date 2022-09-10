# Hourly Speedtest
is a basic Bash script to automatically run a network speed test using the Ookla Speedtest CLI and save results to a file

# Instructions
### Install Speedtest CLI
    $ sudo apt-get install curl\
    $ curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash\
    $ sudo apt-get install speedtest
### Edit the filename variable in the script to the path of the file you want the results to be saved to
    #!/bin/bash

    filename='test_results.txt' # Change this field to the path to the file of your choice
    
    ...
### Set a cronjob to run the script on a set schedule
    $ sudo crontab -e
Choose the editor of your liking\
\
Edit and add the following to the end

    @hourly /bin/bash /path/to/the/script/autospeedtest.sh
    # You can edit the first argument of this to the schedule you want with the (min hour day-month month day-week) syntax 
    # or use the presets e.g @daily/weekly/monthly
\
The results of the tests will be in the format below

    Time: "year-month-dateThour:minute:secondZ" 
Z in the end meaning Zulu or UTC (priorly called GMT) time\
Your local time zone may be offset from the UTC
