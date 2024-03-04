# Write your code here


def add():
    numbers = input("Enter two numbers, separated by a comma: ").split(',')
    x = float(numbers[0])
    y = float(numbers[1])
    result = x + y
    print("Result of addition:", result)


def subtract():
    numbers = input("Enter two numbers, separated by a comma: ").split(',')
    x = float(numbers[0])
    y = float(numbers[1])
    result = x - y
    print("Result of subtraction:", result)


def multiply():
    numbers = input("Enter two numbers, separated by a comma: ").split(',')
    x = float(numbers[0])
    y = float(numbers[1])
    result = x * y
    print("Result of multiplication:", result)


def divide():
    numbers = input("Enter two numbers, separated by a comma: ").split(',')
    x = float(numbers[0])
    y = float(numbers[1])
    if y == 0:
        print("Error: Cannot divide by zero!")
    else:
        result = x / y
        print("Result of division:", result)


def is_prime():
    x = int(input("Enter the integer to check for prime: "))
    if x < 2:
        print(x, "is not a prime number")
        return
    for i in range(2, min([int(x**0.5)+1, x])):
        if x % i == 0:
            print(x, "is not a prime number")
            return
    else:
        print(x, "is a prime number")


def prime_factor():
    import sympy
    n = int(input("Enter an integer to get its prime factors: "))
    factors = sympy.primefactors(n)
    print("Prime factors of", n, "are", ", ".join(
        [str(num) for num in factors]))


def simplify_sqrt():
    from sympy import sqrt, factor
    x = int(input("Enter an integer to get its simplified square root: "))
    # Define the square root expression
    sqrt_expression = sqrt(x)
    # Simplify the square root expression
    simplified_expression = factor(sqrt_expression)
    print(simplified_expression)


def solve_variable():
    import sympy
    from sympy import symbols
    from sympy.solvers import solve
    x = symbols('x')
    eq = input('Enter an equation to solve for x: 0 = ')
    print("x = ", solve(eq,x)[0])

def base_convertor(number:str,input_base:int, output_base:int):
    """
    Converts a number from one base to another.

    Parameters:
        number (str): The number to be converted.
        input_base (int): The base of the input number.
        output_base (int): The base to which the number is to be converted.

    Returns:
        str: The converted number.
    
    
    Made by IAMAJAYPRO
    https://bit.ly/ffc_iamajaypro - freeCodeCamp profile
    """
    #Made by IAMAJAYPRO

    output = int(number, input_base)
    base_helper = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',
                   'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
    quotient = int(output)
    remainder = ""
    while quotient > 0:
        basevalue = quotient % output_base
        if basevalue > 9:
            basevalue = base_helper[basevalue-10]
        remainder = remainder + str(basevalue)
        quotient //= output_base
    output = remainder[::-1]
    return output.upper()

def convert_base():
    input_base = int(input("Enter the base of the input number: "))
    output_base = int(input("Enter the base to which the number is to be converted: "))
    number = input("Enter the number to be converted: ")

    result = base_convertor(number, input_base, output_base)
    print("Converted number:", result)


functions_list = [
    ("Quit",exit),
    ("Addition", add),
    ("Subtraction", subtract),
    ("Multiplication", multiply),
    ("Division", divide),
    ("Check Prime", is_prime),
    ("Prime Factors", prime_factor),
    ("Simplify Square Root", simplify_sqrt),
    ("Solve Equation for Variable", solve_variable),
    ("Base Convertor",convert_base)
]

def display_menu():
    print("Menu:")
    for index, (option, _) in enumerate(functions_list):
        print(f"{index}. {option}")
    print("Enter the number corresponding to your choice, or 0 to quit.")
    print("You can also type 'quit' to quit.")


def main():
    print("This project was created by IAMAJAYPRO")
    print("https://bit.ly/ffc_iamajaypro - freeCodeCamp profile")
    display_menu()
    while True:
        print("Enter menu to display menu")
        choice = input("Enter your choice: ")
        choice=choice.strip()
        if choice == '0' or choice.lower() in ["quit","exit"]:
            print("Have a good day.")
            break
        elif choice.lower()=="menu" or choice=="":
            display_menu()
        elif choice.isdigit() and 0 < int(choice) <= len(functions_list):
            function_index = int(choice)
            func_name, selected_function = functions_list[function_index]
            print("You have chosen",func_name)
            selected_function()

        else:
            print("Invalid choice. Please enter a number from the menu.")
            display_menu()

if __name__=="__main__":
    main()
