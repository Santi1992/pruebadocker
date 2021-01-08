import multiprocessing

import os

from distutils.util import strtobool

# A todos estos como paramétros puedo pasarles el os.getenv()
bind = "0.0.0.0:80"

workers = (multiprocessing.cpu_count()*2) +1
threads = 2

reload = False

#The maximum concurrent requests areworkers * threads 10 in our case.

#  PARA CORRER #######

# gunicorn -c "<archivo de conf>" "<nombreArchivo:funcCreateApp()>" 
                                    # lunch

