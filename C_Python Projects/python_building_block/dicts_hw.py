tests = [ 

{


    "operation": "ADD" ,
    "a" : 10,
    "b" : 20

},

{

    "operation": "SUB" ,
    "a": 100,
    "b" : 30


}


]

for test in tests:

    print (test["operation"])
    print (test["a"])
    print (test["b"])

