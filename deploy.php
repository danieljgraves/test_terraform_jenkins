<?php
	/**
	 * GIT DEPLOYMENT SCRIPT
	 *
	 * Used for automatically deploying websites via github securely, more deets here:
	 *
	 *		https://gist.github.com/limzykenneth/baef1b190c68970d50e1
	 */
	// The header information which will be verified
	$agent=$_SERVER['HTTP_USER_AGENT'];
	$signature=$_SERVER['HTTP_X_HUB_SIGNATURE'];
	$body=@file_get_contents('php://input');
	// The commands
	$commands = array(
		'git pull origin master',
		'git submodule sync',
		'git submodule update'
	);
	base64_encode($agent);
	base64_encode($signature);
	
	if (strpos($agent,'GitHub-Hookshot') !== false){
		if (hash_equals($signature, verify_request())){
			// Run the commands
			foreach($commands AS $command){
				// Run it
				$tmp = shell_exec($command);
			}
		}else{
			header('HTTP/1.1 403 Forbidden');
			echo "Invalid request.";
		}
	}else{
		header('HTTP/1.1 403 Forbidden');
		echo "Invalid request.";
	}
	// Generate the hash verification with the request body and the key stored in your .htaccess file
	function verify_request(){
		$message = $GLOBALS['body'];
		$key     = $_ENV['GIT_TOKEN'];
	    	$hash    = hash_hmac("sha1", $message, $key);
	    	$hash = "sha1=".$hash;
	    	return $hash;
	}
	// Compares the hash given in the header and the one generated by verify_request()
	// "==" is not recommended as it is prone to timing attacks
	// This function is built into PHP 5.6++ so if you have it you can ommit the following function
	function hash_equals( $a, $b ) {
	    $a_length = strlen( $a );
	    if ( $a_length !== strlen( $b ) ) {
	        return false;
	    }
	    $result = 0; 
	    // Do not attempt to "optimize" this.
	    for ( $i = 0; $i < $a_length; $i++ ) {
	        $result |= ord( $a[ $i ] ) ^ ord( $b[ $i ] );
	    } 
	    return $result === 0;
	}
	echo "Deploy successful."
?>
