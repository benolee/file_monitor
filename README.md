# FileMonitor

### Usage
    # Given a yaml configuration file like so:
    #
    # logfile:
    #   path: /tmp/file_monitor.log
    # monitor:
    #   path: /tmp
 
    # Run from shell
    file_monitor --config-path /tmp/config.yml start
 
    # You will now see create,updates, & deletes from /tmp printed to STDOUT



#### TODO
- daemon plugin so the file monitoring doesn't block the shell

  

