print <<END
Content-Type: text/html

<html>
<head><title>Unconfigured board</title></head>
<body>

<h1>This board has not been configured yet.</h1>
<h3>Things you need to do to get the board running:</h3>

<ul>
<li>Choose what kind of board this should be, and copy the files out of the corresponding
<code>mode_*</code> directory into the board directory.</li>
<li>Edit <code>config.pl</code> to suit your needs - remember to uncomment the lines
you change.</li>
<li>Access <code>kareha.pl</code> again (or just reload this page).</li>
</ul>
</body>

</html>
END
;
exit 0;

1;