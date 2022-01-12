def getkey(obj, key):
    elements = key.split("/")
    found = True
    print ("object = " , obj )
    print ("key = " , key)
    for ele in elements:
        if ele in obj:
            obj = obj[ele]
        else:

            found = False
            break
    if found and isinstance(obj, str) :
        print ("value = " , obj)
    else:
        print("key not found")

obj = {"a" : {"b" : { "c" : "d"} }}
getkey(obj, "a/b/c")
obj = {"a" : {"b" : { "x" : "d", "z" : "r"} }}
getkey(obj, "a/b/z")
obj = {"a" : {"b" : { "x" : "d"} }}
getkey(obj, "a/b/c")
obj = {"a" : {"b" : { "x" : "d"} }}
getkey(obj, "a/b")
obj = {"a" : {"b" : { "x" : "d", "z" : "r"} }}
getkey(obj, "a/b/")
obj = {"a" : {"b" : { "x" : "d", "z" : "r"} }}
getkey(obj, "a/b/z")
obj = {}
getkey(obj, "a/b/z")
