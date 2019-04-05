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
        for($i = 0; $i < 500000000; $i++) {
	        ob_start();	
		echo 'Texto que não será exibido';
		ob_end_clean();
	}
    ?>
    <?php if($_ENV["HOSTNAME"]) {?><h3>My hostname is <?php echo $_ENV["HOSTNAME"]; ?></h3><?php } ?>
  </body>
</html>
