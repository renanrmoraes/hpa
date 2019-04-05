<html>
<head>
	<title>Hello world!</title>
	<link href='//fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
	<style>
	body {
		background-color: white;
		text-align: center;
		padding: 50px;
		font-family: "Open Sans","Helvetica Neue",Helvetica,Arial,sans-serif;
	}

	#logo {
		margin-bottom: 40px;
	}
	</style>
</head>
  <body>
    <?php
	if (ob_get_level() == 0) ob_start();
        for($i = 0; $i < 500000000; $i++) {
        	echo "<br> Line to show.";
	        echo str_pad('',4096)."\n";    

        	ob_flush();
	        flush();
	        sleep(2);
	}

	echo "Done.";

	ob_end_flush();

    ?>
    <?php if($_ENV["HOSTNAME"]) {?><h3>My hostname is <?php echo $_ENV["HOSTNAME"]; ?></h3><?php } ?>
  </body>
</html>
