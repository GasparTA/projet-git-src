print ("Bienvenue dans notre script")
print ("Ce script va nous permettre d'avoir la liste des nombres premier entre 1 et 1 000 000")
premier =[]

for n in range(1,1000000 + 1):
   if n > 1:
       for i in range(2,n):
           if (n % i) == 0:
               break
       else:
           print(n)
           premier.append(n)
print ("Voici la liste des chiffres premier")
print (premier)
