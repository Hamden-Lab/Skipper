"""
This file contains host information for the archon.interface package.
"""

# dictionary for the camera host IP addresses
#
camhost = {}
__camhost = {1: "10.0.0.1"} # so far, we are using the default IP
# __camhost = {1: "192.168.1.3",
#              2: "192.168.1.4",
#              3: "192.168.1.5",
#              4: "192.168.1.6"}

# dictionary for the camera host ports
# 0 is port for guided
# 1-4 are ports for vicd
#
# How do we set up the comport?  Or do we assign one
# and then make the computer use a certain port?
# default port is 4242
camport = {}
__camport = {1: 4242}
# __camport = {1: 62018,
#              2: 62018,
#              3: 62018,
#              4: 62018}

# dictionary for human-readable camera names
#
camname = {}
__camname = {1: "localhost"}
# __camname = {1: "camera1",
#              2: "camera2",
#              3: "camera3",
#              4: "camera4"}
__emanmac = {v: k for k, v in list(__camname.items())}

# dictionary for camera sockets
#
camsocket = {}
__camsocket = {1: ""}
# __camsocket = {1: '',
#                2: '',
#                3: '',
#                4: ''}
