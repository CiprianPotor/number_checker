from flask import Flask, render_template, request

app = Flask(__name__)

# Function to sanitize and convert user input to an integer
def sanitize_input(user_input):
    try:
        number = int(user_input)
        return number
    except ValueError:
        return None

# Function to check if a number is even or odd
def check_even_odd(number):
    if number % 2 == 0:
        return "even"
    else:
        return "odd"

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        # Get user input from the form
        user_input = request.form['number']
        
        # Sanitize the input and convert it to an integer
        number = sanitize_input(user_input)

        if number is not None:
            # Check if the number is even or odd
            result = check_even_odd(number)
            
            # Render the result template with the number and result
            return render_template('result.html', number=number, result=result)
        else:
            # Render the index template with an error flag
            return render_template('index.html', error=True)

    # Render the index template without any errors
    return render_template('index.html', error=False)

if __name__ == '__main__':
    # Run the Flask application on host 0.0.0.0 and port 8000
    app.run(host='0.0.0.0', port=8000)
