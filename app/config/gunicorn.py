import multiprocessing

import os

from distutils.util import strtobool

# A todos estos como paramétros puedo pasarles el os.getenv()
bind = "0.0.0.0:243"

workers = (multiprocessing.cpu_count()*2) +1
#Worker son tareas que se ejecutan en segundo plano.
threads = 2

reload = False

#The maximum concurrent requests are workers * threads 10 in our case.

#  PARA CORRER #######

# gunicorn -c "<archivo de conf>" "<nombreArchivo:funcCreateApp()>" 
                                    # lunch

