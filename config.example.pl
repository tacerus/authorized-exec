# the patterns are read as regular expressions and anchored with ^ and $ by default
(
	'georg2:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFY7Pvf4Rzn7C8Ioi1ZvY/O7tJsMCv27URdQE5o1daDK' => [
		'echo hi',
		'true',
		'printf %s [a-z0-9 ]+',
	],
	'georg2' => [
		'echo bye',
	],
	'root' => [
		'ls -a /root',
	],
)
