from flask import Flask, render_template, request

app = Flask(__name__)

def sanitize_input(user_input):
    try:
        number = int(user_input)
        return number
    except ValueError:
        return None

def check_even_odd(number):
    if number % 2 == 0:
        return "even"
    else:
        return "odd"

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        user_input = request.form['number']
        number = sanitize_input(user_input)

        if number is not None:
            result = check_even_odd(number)
            return render_template('result.html', number=number, result=result)
        else:
            return render_template('index.html', error=True)

    return render_template('index.html', error=False)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)

