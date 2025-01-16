String handleButtonAction(String currentInput, String buttonValue) {
  // Clear the entire display
  if (buttonValue == 'C') {
    return "";
  }

  // Delete the last character
  if (buttonValue == 'DEL') {
    return currentInput.isEmpty ? "" : currentInput.substring(0, currentInput.length - 1);
  }

  // Evaluate the expression when "=" is pressed
  if (buttonValue == "=") {
    try {
      final result = _evaluateExpression(currentInput); // Call to evaluate the expression
      return result.toString(); // Return the result as a string
    } catch (e) {
      return "Error"; // If there's an error in evaluation, return "Error"
    }
  }

  // Add the button value (number or operator) to the current input
  return currentInput + buttonValue;
}

double _evaluateExpression(String expression) {
  try {
    // Remove all spaces for cleaner input
    expression = expression.replaceAll(" ", "");

    // First, evaluate the content inside parentheses recursively
    while (expression.contains('(')) {
      // Find the last opening parenthesis
      final openIndex = expression.lastIndexOf('(');
      final closeIndex = expression.indexOf(')', openIndex);

      if (openIndex != -1 && closeIndex != -1) {
        // Extract the part inside the parentheses
        final insideParentheses = expression.substring(openIndex + 1, closeIndex);

        // Evaluate this part recursively
        final result = _evaluateAdditionAndSubtraction(
            _evaluateMultiplicationAndDivision(insideParentheses));

        // Replace the parentheses with the evaluated result
        expression = expression.replaceRange(openIndex, closeIndex + 1, result.toString());
      }
    }

    // Now evaluate the expression without parentheses
    expression = _evaluateMultiplicationAndDivision(expression);
    return _evaluateAdditionAndSubtraction(expression);
  } catch (e) {
    throw Exception("Invalid expression");
  }
}

String _evaluateMultiplicationAndDivision(String expression) {
  // This will handle multiplication and division
  // We need to handle negative numbers as well
  final mulDivPattern = RegExp(r'(\-?\d+(\.\d+)?)([\*/])(\-?\d+(\.\d+)?)');
  while (mulDivPattern.hasMatch(expression)) {
    expression = expression.replaceAllMapped(mulDivPattern, (match) {
      double num1 = double.parse(match.group(1)!);
      double num2 = double.parse(match.group(4)!);
      String operator = match.group(3)!;

      double result = operator == '*' ? num1 * num2 : num1 / num2;
      return result.toString();
    });
  }
  return expression;
}

double _evaluateAdditionAndSubtraction(String expression) {
  // This will handle addition and subtraction
  final addSubPattern = RegExp(r'(\-?\d+(\.\d+)?)([\+-])(\-?\d+(\.\d+)?)');
  while (addSubPattern.hasMatch(expression)) {
    expression = expression.replaceAllMapped(addSubPattern, (match) {
      double num1 = double.parse(match.group(1)!);
      double num2 = double.parse(match.group(4)!);
      String operator = match.group(3)!;

      double result = operator == '+' ? num1 + num2 : num1 - num2;
      return result.toString();
    });
  }
  return double.parse(expression); // Return the final result as a number
}
