$(document).ready(function () {
    "use strict"

    $('#switchWeek').on('change', function () {
        const url = location.pathname + '?week=' + this.value;
        location.replace(url);
    })

    $('#printBtn').on('click', function () {
        window.print();
    })
})