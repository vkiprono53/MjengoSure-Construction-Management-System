$(document).ready(function () {
    //Initial
     $('#content').load('content/dashboard');

    //Loading
    $('ul#nav li a').click(function () {
        var  page = $(this).attr('href');
      //  alert(page);
       $('#content').load(page);
        return false;
    });
});