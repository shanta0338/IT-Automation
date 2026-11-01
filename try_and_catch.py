class InvalidInputError(Exception):
    pass


class EmptyInputError(Exception):
    pass


def calculate_average(numbers):
    try:
        return sum(numbers) / len(numbers)
    except TypeError:
        raise InvalidInputError(f"Expected a list or tuple, but got {type(numbers)}")
    except ZeroDivisionError:
        raise EmptyInputError("The list is empty. Cannot calculate the average.")
    finally:
        print("Execution of calculate_average function completed.")

calculate_average(5.9)