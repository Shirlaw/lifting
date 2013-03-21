<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<!-- Set the viewport width to device width for mobile -->
		<meta name="viewport" content="width=device-width, user-scalable=no" />
		
		<title>
			Lifting
		</title>

		<?php $serverUrl = "http://". $_SERVER['HTTP_HOST'] . "/"; ?>

		<script data-main="<?php echo $serverUrl ?>js/main" src="<?php echo $serverUrl ?>js/require.js"></script>
		<!-- Included CSS Files (Compressed) -->
		<link rel="stylesheet" href="<?php echo $serverUrl ?>stylesheets/foundation.min.css">
		<link rel="stylesheet" href="<?php echo $serverUrl ?>stylesheets/app.css">

		<script src="<?php echo $serverUrl ?>foundationJS/vendor/custom.modernizr.js"></script>
 

	</head>
	<body>
		@yield('content')
	</body>
		<!-- Included JS Files (Compressed) -->

		<!--<script src="<?php echo $serverUrl ?>foundationJS/foundation.min.js"></script>-->
</html>