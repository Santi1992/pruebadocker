from flask import Flask

def create_app():
    app = Flask(__name__)


    @app.route('/')
    def saludo():
        return 'Mi primer programa Flask!'

    @app.route('/ping',methods=["GET"])
    def ping():
        return 'pong!'
    
    return app
    ## No hago un app.run dado que el encarado de correrla será gunicorn
    
    # if __name__ == "__main__":

    
    # app.run(host ='0.0.0.0',port=5001,debug=True)