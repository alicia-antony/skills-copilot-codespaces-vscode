def calculator():
    """
    A simple calculator function that allows the user to perform basic arithmetic operations.

    The calculator provides the following operations:
    1. Addition
    2. Subtraction
    3. Multiplication
    4. Division
    5. Percentage calculation

    The user is prompted to select an operation and input the required numbers. The function
    validates the input and performs the selected operation. It handles invalid inputs and
    division by zero gracefully.

    Usage:
    - Run the function and follow the prompts to select an operation and input numbers.
    - The result of the operation will be displayed.

    Exceptions:
    - Handles ValueError if the user inputs non-numeric values.
    - Displays an error message for division by zero.

    Returns:
    - Prints the result of the selected operation to the console.
    """
    print("Select operation:")
    print("1. Add")
    print("2. Subtract")
    print("3. Multiply")
    print("4. Divide")
    print("5. Percentage")

    while True:
        try:
            choice = int(input("Enter choice (1/2/3/4/5): "))
            if choice not in [1, 2, 3, 4, 5]:
                print("Invalid input. Please select a valid operation.")
                continue

            num1 = float(input("Enter first number: "))
            if choice == 5:
                print(f"The result is: {num1 / 100}")
            else:
                num2 = float(input("Enter second number: "))

                if choice == 1:
                    print(f"The result is: {num1 + num2}")
                elif choice == 2:
                    print(f"The result is: {num1 - num2}")
                elif choice == 3:
                    print(f"The result is: {num1 * num2}")
                elif choice == 4:
                    if num2 == 0:
                        print("Error! Division by zero.")
                    else:
                        print(f"The result is: {num1 / num2}")
            break
        except ValueError:
            print("Invalid input. Please enter numeric values.")

if __name__ == "__main__":
    calculator()