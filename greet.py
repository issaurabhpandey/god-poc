from flask import Flask, request

app = Flask(__name__)


@app.route('/')
def home():
    return HOME_HTML


HOME_HTML = """
    <html><body>
        <h2>Welcome to my Application</h2>
        <form action="/greet">
            What's your name? <input type='text' name='username'><br>
            <input type='submit' value='Continue'>
        </form>
    </body></html>"""


@app.route('/greet')
def greet():
    username = request.args.get('username', '')
    if username == '':
        username = 'GOD'
    return GREET_HTML.format(username)


GREET_HTML = """
    <html><body>
        <h2>Hello, {0}!</h2>
    </body></html>
    """

if __name__ == "__main__":
    app.run(host="localhost", port=5003)
