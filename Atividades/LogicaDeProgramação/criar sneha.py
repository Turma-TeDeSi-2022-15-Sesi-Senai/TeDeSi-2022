senhaIn = ""

charMin = False
charMai = False
charNum = False
charSpec = False
i = 0
run = True


while run: 
    
    senhaIn = input("Digite uma senha: ")
     
    for x in senhaIn:
        if x == "a" or x == "b" or x == "c" or x == "d" or x == "e" or x == "f" or x == "g" or x == "h" or x == "i" or x == "j" or x == "k" or x == "l" or x == "m" or x == "n" or x == "o" or x == "p" or x == "q" or x == "r" or x == "s" or x == "t" or x == "u" or x == "v" or x == "w" or x == "x" or x == "y" or x == "z":
            charMin = True
            

    for x in senhaIn:
        if x == "A" or x == "B" or x == "C" or x == "D" or x == "E" or x == "F" or x == "G" or x == "H" or x == "I" or x == "J" or x == "K" or x == "L" or x == "M" or x == "N" or x == "O" or x == "P" or x == "Q" or x == "R" or x == "S" or x == "T" or x == "U" or x == "V" or x == "W" or x == "X" or x == "Y" or x == "Z":
            charMai = True
            

    for x in senhaIn:
        if x == "0" or x == "1" or x == "2" or x == "3" or x == "4" or x == "5" or x == "6" or x == "7" or x == "8" or x == "9":
            charNum = True
            

    for x in senhaIn:
        if x == "!" or x == "@" or x == "#" or x == "$" or x == "%" or x == "^" or x == "&" or x == "*" or x == "(" or x == ")" or x == "-" or x == "_" or x == "+" or x == "=" or x == "{" or x == "}" or x == "[" or x == "]" or x == "|" or x == ":" or x == ";" or x == "\"" or x == "'" or x == "," or x == "." or x == "<" or x == ">" or x == "/" or x == "?" or x == "`" or x == "~":
            charSpec = True
            

    for x in senhaIn:
        i = i + 1
        

    if charMin == True and charMai == True and charNum == True and charSpec == True and i >= 6 and i <= 12:
        print("Senha válida")
        run = False
        
        
    else:
        print("\n"*100)
        print("Senha inválida\nDigite uma senha válida\n")
        