tests = [
    (10,20),
    (5,7),
    (100, 50)
]


with open("vectors.txt" , "w") as file:
    for a,b in tests:
        expected = a + b

        file.write(f"{a} {b} {expected}\n")


        