import json
import re
import sys


def sanitize_input(input_str):
    """
    Attempts to sanitize a super-permissive JSON-like input string by:
    - Adding quotes to unquoted keys.
    - Converting single quotes to double quotes for JSON compatibility.
    - Removing trailing commas.
    """
    # Remove trailing commas before closing braces or brackets
    input_str = re.sub(r",\s*([}\]])", r"\1", input_str)

    # Add double quotes around keys that are not quoted
    input_str = re.sub(r"([{,]\s*)([a-zA-Z_][a-zA-Z0-9_]*)(\s*:)", r'\1"\2"\3', input_str)

    # Replace single quotes with double quotes (only outside of already valid JSON keys/values)
    input_str = re.sub(r"(?<!\\)'", r'"', input_str)

    # Ensure no extraneous escaping of already valid quotes
    input_str = re.sub(r'\\"', r'"', input_str)

    return input_str


def pretty_print_json(input_data):
    """
    Tries to parse and pretty print permissive JSON-like objects.
    """
    try:
        # Sanitize the input string
        sanitized = sanitize_input(input_data)

        # Attempt to load the sanitized input as JSON
        parsed_data = json.loads(sanitized)

        # Pretty print the parsed JSON object
        pretty_output = json.dumps(parsed_data, indent=4, ensure_ascii=False)
        print(pretty_output)
    except json.JSONDecodeError as e:
        print("Failed to parse JSON:", e)
        print("Input after sanitization:", sanitized)
    except Exception as e:
        print("An unexpected error occurred:", e)


if __name__ == "__main__":
    raw_input = sys.stdin.read()
    pretty_print_json(raw_input)

