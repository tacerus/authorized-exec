# the patterns are read as regular expressions and anchored with ^ and $ by default
(
	'georg:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP9tSdeqfI9YCm0mHll2lXXgf/kvQQJUMg7QVIMTZ/7P' => [
#	'georg' => [
		'echo hi',
		'true',
		'printf %s [a-z0-9 ]+',
	],
	'root' => [
		'ls -a /root',
	],
)
