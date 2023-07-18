$(document).ready(function(){
var date = document.getElementById('date');
var calculate = document.getElementById('calculate');
var result = document.querySelector('.result');
var months;
        
// set maximum date to today
date.max = new Date().toISOString().split('T')[0];

function calculateAge() {
var today = new Date();
var birthDate = new Date(date.value);

// Calculation for years
var years;
    if (today.getMonth() > birthDate.getMonth() || (today.getMonth() == birthDate.getMonth() && today.getDate() >= birthDate.getDate())) {
                years = today.getFullYear() - birthDate.getFullYear();
    }
    else {
                years = today.getFullYear() - birthDate.getFullYear() - 1;
    }

// Calculation for months
        
    if (today.getDate() >= birthDate.getDate()) {
                months = today.getMonth() - birthDate.getMonth();
    }
    else if (today.getDate() < birthDate.getDate()) {
                months = today.getMonth() - birthDate.getMonth() - 1;
    }
        
// make month positive
months = months < 0 ? months + 12 : months;

// if ( months < 0  ) {
//     months = months + 12;
// } else {
//     months = months;
// }

var days;
var monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    if (today.getDate() >= birthDate.getDate()) {
                days = today.getDate() - birthDate.getDate();
    } 
    else {
                days = today.getDate() - birthDate.getDate() + monthDays[birthDate.getMonth()];
    }

// Display the result
result.innerHTML = `<p class="birthdate">You were born on ${birthDate.toDateString()}.</p>`;
result.innerHTML += `<p class="age">You are ${years} years, ${months} months and ${days} days old.</p>`;
    if (months == 0 && days == 0) {
                result.innerHTML += `<p class="wishing">Happiee Bornday!!!</p>`;
    }
}
calculate.addEventListener('click', calculateAge);
});