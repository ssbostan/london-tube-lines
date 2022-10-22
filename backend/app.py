from json import load as json_load

from flask import Flask, render_template

app = Flask(__name__)

app.config["JSONIFY_PRETTYPRINT_REGULAR"] = True

with open("lines.json") as f:
    LINES = json_load(f)


@app.route("/")
def index():
    return render_template("index.html")


@app.route("/lines")
def lines():
    return LINES


if __name__ == "__main__":
    app.run()
