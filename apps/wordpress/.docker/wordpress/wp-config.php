<?php
define('DB_NAME', 'wordpress');
define('DB_USER', 'wordpress');
define('DB_PASSWORD', '123456');
define('DB_HOST', 'web-stack-mysql-db-1');
define('DB_CHARSET', 'utf8mb4');
define('DB_COLLATE', '');

define('AUTH_KEY',         'G-WvKo[+rH/gzm6kNYXnkQ}urE,L@p[^n+?5ayUCTRySF4rR})ct{)__(7W7W3a8');
define('SECURE_AUTH_KEY',  'XoJu`UALY7(tE 3bk`/gItUFcfB)4PMI?A4_a|/@fB?+HSxfk=|.a~AUOTOOj9T}');
define('LOGGED_IN_KEY',    'lu#4RD|Z!Jf8SxePA46+8pL|X^8=3K=C</Uz I}0@woI v05^&XKzxsMGQ|$:tt}');
define('NONCE_KEY',        'y+rb_Ogcs/vr<BC F&5>W.Tk#FyTzDY[hOdaIsLk;4Bb$i!wH)i!ZW8fRFWPAr<e');
define('AUTH_SALT',        '9|B0{@n! L8L<A7qw;^dg2=fKnLg?APcF0-gP$5?lwq EkKBrIV0}5>ugAFUc=7+');
define('SECURE_AUTH_SALT', 'TXPk2TbiSE]F&>!y|2L>2 )BU_YTqLx[$53eg/5f5XBGD}ns@_pvPm@Liv=8b*y8');
define('LOGGED_IN_SALT',   '[Lr]K:Z`(G8nlk:T-|GxpldJg,6 ]5TuFe-]MM<jq6r/6k%$8~^T`tLsa<q``dqG');
define('NONCE_SALT',       'D(VW3Q:hR^_$[21vOc(Vhn!]IrO+8nPZuJ!~fw6A1JV N Ip>a~^&IH c5ICqb`q');

$table_prefix  = 'wp_';

define('WP_DEBUG', false);

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
