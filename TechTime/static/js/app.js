$(document).ready(function () {
    "use strict"

    currentDate = new Date();
    startDate = new Date(currentDate.getFullYear(), 0, 1);
    let days = Math.floor((currentDate - startDate) /
        (24 * 60 * 60 * 1000));

    let weekNumber = Math.ceil(days / 7);

    $('#weekId').value(weekNumber)
})