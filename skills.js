// function to convert celsius to fahrenheit
function celsiusToFahrenheit(celsius) {
    return (celsius * 9/5) + 32;
}
// Driver Code
let celsius = 25;
let fahrenheit = celsiusToFahrenheit(celsius);
console.log(`${celsius} Celsius is equal to ${fahrenheit} Fahrenheit`);
// function to convert fahrenheit to celsius
function fahrenheitToCelsius(fahrenheit) {
    return (fahrenheit - 32) * 5/9;
}
// Driver Code
fahrenheit = 77;
celsius = fahrenheitToCelsius(fahrenheit);
console.log(`${fahrenheit} Fahrenheit is equal to ${celsius} Celsius`);

// function to convert pounds to kilograms
function poundsToKilograms(pounds) {
    return pounds * 0.453592;
}

// Driver Code
pounds = 150;
let kilograms = poundsToKilograms(pounds);
console.log(`${pounds} pounds is equal to ${kilograms} kilograms`);
// function to convert kilograms to pounds
function kilogramsToPounds(kilograms) {
    return kilograms / 0.453592;
}
// Driver Code
kilograms = 55;
pounds = kilogramsToPounds(kilograms);
console.log(`${kilograms} kilograms is equal to ${pounds} pounds`);