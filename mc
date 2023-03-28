<!DOCTYPE html>
<html>
  <head>
    <title>Mortgage Calculator</title>
    <style>
      /* Add some styling to the form and table */
      form, table {
        margin: 20px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 10px;
        background-color: #f5f5f5;
      }
      
      /* Style the input fields and labels */
      input[type="number"] {
        width: 100%;
        padding: 5px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
        box-sizing: border-box;
      }
      
      label {
        display: block;
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 10px;
      }
      
      /* Style the button */
      .calculate-button {
        background-color: #4CAF50;
        color: white;
        padding: 10px;
        border: none;
        border-radius: 5px;
        font-size: 18px;
        cursor: pointer;
        transition: background-color 0.3s ease;
      }
      
      .calculate-button:hover {
        background-color: #3e8e41;
      }
      
      /* Style the mortgage summary table */
      table {
        width: 100%;
        border-collapse: collapse;
      }
      
      th, td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ddd;
      }
      
      th {
        background-color: #4CAF50;
        color: white;
      }
      
      /* Add some animation to the mortgage summary */
      #mortgage-summary {
        opacity: 0;
        transform: translateY(20px);
        transition: opacity 0.5s ease, transform 0.5s ease;
      }
      
      #mortgage-summary.visible {
        opacity: 1;
        transform: translateY(0);
      }
      
      /* Style the calculate button */
      #calculate-button {
        background-color: #4CAF50;
        color: white;
        padding: 10px;
        border: none;
        border-radius: 5px;
        font-size: 18px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        margin-top: 20px;
      }
      
      #calculate-button:hover {
        background-color: #3e8e41;
      }
    </style>
  </head>
  
  <body>
    <h1>Mortgage Calculator</h1>
    <form>
      <label for="home_price">Home price:</label>
      <input type="number" id="home_price" name="home_price" required><br>
      <label for="down_payment">Down payment:</label>
      <input type="number" id="down_payment" name="down_payment" required><br>
      <label for="interest_rate">Interest rate:</label>
      <input type="number" id="interest_rate" name="interest_rate" step="0.01" required><br>
      <label for="loan_term">Loan term (in years):</label>
      <input type="number" id="loan_term" name="loan_term" required><br>
      <label for="hoa">HOA:</label>
      <input type="number" id="hoa" name="hoa"><br>
      <label for="property_taxes">Property taxes (annual):</label>
      <input type="number" id="property_taxes" name="property_taxes"><br>
      <button class="calculate-button" onclick="calculateMortgage(event)">Calculate</button>
    </form>
    <div class="mortgage-summary-container">
      <h2>Mortgage Summary</h2>
      <table>
        <tr>
          <td>Monthly payment:</td>
          <td id="monthly_payment"></td>
        </tr>
        <tr>
          <td>Total payments:</td>
          <td id="total_payments"></td>
        </tr>
        <tr>
          <td>Total interest:</td>
          <td id="total_interest"></td>
        </tr>
      </table>
    </div>

    <script>
      function calculateMortgage(event) {
        event.preventDefault(); // Prevent the form from submitting

        // Get user inputs
        var homePrice = parseFloat(document.getElementById("home_price").value);
        var downPayment = parseFloat(document.getElementById("down_payment").value);
        var interestRate = parseFloat(document.getElementById("interest_rate").value);
        var loanTerm = parseInt(document.getElementById("loan_term").value);
        var hoa = parseFloat(document.getElementById("hoa").value) || 0;
        var propertyTaxes = parseFloat(document.getElementById("property_taxes").value) || 0;

        // Calculate the loan amount
        var loanAmount = homePrice - downPayment;

        // Calculate the monthly interest rate
        var monthlyInterestRate = interestRate / 1200;

        // Calculate the number of monthly payments
        var numPayments = loanTerm * 12;

        // Calculate the monthly payment
        var monthlyPayment = (loanAmount * monthlyInterestRate * Math.pow(1 + monthlyInterestRate, numPayments)) / (Math.pow(1 + monthlyInterestRate, numPayments) - 1);
        var totalPayments = monthlyPayment * numPayments;
        var totalInterest = totalPayments - loanAmount;

        // Display the mortgage summary to the user
        document.getElementById("monthly_payment").innerHTML = "$" + monthlyPayment.toFixed(2);
        document.getElementById("total_payments").innerHTML = "$" + totalPayments.toFixed(2);
        document.getElementById("total_interest").innerHTML = "$" + totalInterest.toFixed(2);
      }
    </script>
  </body>
</html>
