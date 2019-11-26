<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', 'utf8_unicode_ci' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'MR^mA^Ak^;eXutU?)-SwZQ)fI|Uh.8|rMo6;-Dn~IMg^+eHKno)7wDT|VF.i8umX');                                      define('SECURE_AUTH_KEY',  '|&D5%PwQkt@|=g+f)pHlmNp+v]5F.ZM+6TZA2YBbx7xzysf,Ma!BpS3;D0&e_.o!');                                      define('LOGGED_IN_KEY',    'J)a%&9x{_Q=~5JA#h#/RZ<dw=[;_3Bhy15kG!w%&x<}2fNCK4xF/1mja1CL78s&t');                                      define('NONCE_KEY',        'Ujn2`S~w0BWsliI_|dS?XC<bdK$5lLfZ2SZ^ 9WBj@,8>z|uZ%@C5Uo~-M0bPf[?');                                      define('AUTH_SALT',        'Z*-(^+d`GTq. ;HW&s:r],l3nY.y4[UBq->c0O~#;^~lXf4QDyrd17e`S+zkbsnJ');                                      define('SECURE_AUTH_SALT', '+PPqmsJejThqX-. quSh<1E|5Ib--:6&{i^ H#(Aj,$!T~|%#x|F]ZfMHkG:a;j#');                                      define('LOGGED_IN_SALT',   'LnYX#tPOZkQtigdc(b*%4Y3QY/Om~!j+=q1jL4s,op* >4|ZSC-,#He|AUKy!T?k');                                      define('NONCE_SALT',       'oX+L5mW_By)!j=S8@];s.Dm#LDqhk<+ctHnI=nlMH/xD~r3+<LOlqS$|?nHc=geG');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
