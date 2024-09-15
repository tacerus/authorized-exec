# the patterns are read as regular expressions and anchored with ^ and $ by default
(
	'georg' => [
		'echo hi',
		'true',
		'printf %s [a-z0-9 ]+',
	],
	'root' => [
		'ls -a /root',
	],
)
