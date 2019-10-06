'''Maxwell Slingerland
1001_primes.py'''

import num_check

is_prime = num_check.is_prime

primes = 0
num = 1
while primes != 10001:
    if is_prime(num):
        primes += 1
        print(num)
    num += 1
