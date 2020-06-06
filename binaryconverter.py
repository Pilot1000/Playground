def binaryToDecimal(string):
	length = len(string)

	decimal = 0
	for n in reversed(range(0, length)):
		bit = int(string[n])
		decimal += bit*(2**n)

	return decimal

def decimalToBinary(decimal):
	binary = ''
	while decimal != 0:
		remainder = decimal % 2
		decimal = decimal // 2
		binary += str(remainder)

	return binary