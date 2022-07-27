Lidade = []
Lnome = []
i = 0

def clear():
    print("\n" *100)
def character_count(string):
    s = 0
    for i in string:
        s += 1
    return s
def nUser():
    clear()
    print("Cadastrar Novo Usuario")
    nome = input("Digite o nome do usuario: ")
    idade = input("Digite a idade do usuario: ")
    
    Lnome.append("Nome: " + nome)
    Lidade.append("Idade: " + idade) 
def listUser(t , n = 40):
        tmpI = n - character_count(t)
        tmpI2 = " " * tmpI
        return tmpI2
def deletUser():
    clear()
    print("Deletar Usuario")
    nome = input("Digite o nome do usuario: ")
    idade = input("Digite a idade do usuario: ")
    for i in range(len(Lnome)):
        if Lnome[i] == "Nome: " + nome and Lidade[i] == "Idade: " + idade:
            del Lnome[i]
            del Lidade[i]
            print("Usuario deletado")
            break
    else:
        print("Usuario não encontrado")
def listAllUser(pIn = "", lNIn = Lnome , lIIn = Lidade):
    encontrado = False
    for x in lNIn:
        if pIn in x:
            if encontrado == False:
                print("Foram encontrados os seguintes usuarios: \n|Nome--------------------------------------------------------------------------Idade|")
            print("|" + x + listUser(x,36) + lIIn[lNIn.index(x)] + listUser(lIIn[lNIn.index(x)],25) + listUser(str(lNIn.index(x)),3) +"Numero do Usuario: " + str(lNIn.index(x)) + "|")
            encontrado = True
    if encontrado == False:
        print("Nenhum usuario encontrado")
    print("|-----------------------------------------------------------------------------------|\n")
    input("Pressione Enter para continuar...")



while i != 5:
    clear()
    i = int(input("o Que deseja fazer?\n 1. Cadastrar Novo Usuario\n 2. Listar Usuarios\n 3. Buscar Usuario\n 4. Deletar Usuario\n 5. Sair\n"))
    if i == 1:
        nUser()
    elif i == 2:
        clear()
        print("Listar Usuarios")
        listAllUser()
    elif i == 3 :
        clear()
        pesquisaEntrada = input("Digite o nome do usuario que deseja buscar: ")
        clear()
        print("os usuarios que contenham " + pesquisaEntrada + " são: \n")
        listAllUser(pesquisaEntrada, Lnome, Lidade)
    elif i == 4:
        deletUser()
    elif i == 5:
        clear()
        print("Saindo...")
        print("\n")
    else:
        print("Opcao invalida")
        input("Pressione Enter para continuar...")
