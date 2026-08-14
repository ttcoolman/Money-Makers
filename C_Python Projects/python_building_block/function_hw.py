

#Python calculates the expected answer, while your systemverilog alu calculate the actual answer 


def expected_add (a,b):
    return a + b


a = 15 
b = 7 



expected = expected_add(a,b)

print("Expected:", expected)