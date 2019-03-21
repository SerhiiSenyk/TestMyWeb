from flask import Flask , render_template, url_for
app = Flask(__name__)

@app.route("/")
def home():
    return render_template('home.html' , posts= 'posts')
@app.route("/schedule")
def schedule():
    return render_template('schedule.html' , title = 'About')

if __name__ == '__main__':
    app.run(debug =True)
