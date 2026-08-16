from pathlib import Path 



file = Path("vectors.txt")

#Checks whether the path exists 
print(file.exists())
#checks whether the path is a regular file 
print(file.is_file)
#Print the name of the file
print(file.name)
#print the suffix of the file 
print(file.suffix)
# print the parent of the file 
print(file.parent)




text = file.read_text()
file.write_text("hello")