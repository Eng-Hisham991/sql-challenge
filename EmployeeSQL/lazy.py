

import os
from cool_client import cool_client

client = CoolClient(username= os.environ.get('username'),
         password= os.environ.get('password'))