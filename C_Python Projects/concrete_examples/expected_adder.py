def expected_adder(a,b):
    # Add a and b, then keep only the lowest 8 bits of the result.
    return (a+b) & 0xFF

#check if the adder outputs 12, if true nothing happens
assert expected_adder(5,7) == 12 