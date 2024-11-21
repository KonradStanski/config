def format_table(dict_list):
    # Check if the list is empty
    if not dict_list:
        return []

    # Collect all unique headers from all dictionaries, in the order they appear
    headers = []
    seen_headers = set()
    for item in dict_list:
        for key in item.keys():
            if key not in seen_headers:
                headers.append(key)
                seen_headers.add(key)

    # Determine the maximum width for each column
    column_widths = {header: len(header) for header in headers}
    for item in dict_list:
        for header in headers:
            value = str(item.get(header, ''))
            column_widths[header] = max(column_widths[header], len(value))

    # Create a format string for each row (left-aligned)
    format_str = ' '.join(f"{{:<{column_widths[header]}}}" for header in headers)

    # Prepare the list of strings
    rows = []

    # Add the header row
    rows.append(format_str.format(*headers))

    # Add each row of data
    for item in dict_list:
        row = [str(item.get(header, '')) for header in headers]
        rows.append(format_str.format(*row))

    return rows


# Example usage
if __name__ == "__main__":
    data = [
        {"Name": "Alice", "Age": 30, "City": "New York"},
        {"Name": "Bob", "Age": 25, "City": "Los Angeles"},
        {"Name": "Charlie", "Age": 35, "City": "Chicago"},
    ]
    for line in format_table(data):
        print(line)
