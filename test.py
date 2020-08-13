import subprocess

primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]

def testfile(f_name,f_no):
  list_of_errors = []
  for no in range (1,5):
    out = subprocess.Popen(["./"+f_name, str(no)], 
             stdout=subprocess.PIPE, 
             stderr=subprocess.STDOUT)
    stdout,stderr = out.communicate()
    if b"not" in stdout:
      if no in primes:
        list_of_errors.append(no)
    else:
      if no not in primes:
        list_of_errors.append(no)
    if stderr:
      print(stderr,"\n")

  with open("input."+str(f_no),'w') as inp:
    for el in list_of_errors:
      inp.write(str(el)+" ")

testfile("main",1)