from os import environ

from flask import Flask, render_template
from requests import get

app = Flask(__name__)

BACKEND_HOST_ADDR = environ.get(
    "LONDON_TUBE_LINES_BACKEND_HOST_ADDR", "http://localhost:8000"
)


@app.route("/")
def index():
    try:
        lines = get(BACKEND_HOST_ADDR + "/lines").json()
    except:
        lines = False
    return render_template("index.html", data=lines)


if __name__ == "__main__":
    app.run()
