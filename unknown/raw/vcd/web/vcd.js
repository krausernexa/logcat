function setFormArgs() {
    var q = location.search.substring(1);
    var values = q.split('&');
    for (var i = 0; i < values.length; i++) {
        var n = values[i].split('=');
        var e = document.getElementById(n[0]);
        if (e) {
            e.style.visibility = "visible";
            e.value = decodeURIComponent(n[1]);
        }
    }
}