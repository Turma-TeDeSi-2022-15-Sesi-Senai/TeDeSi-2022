avioes = [['Boeing', 400], ['Airbus', 250], ['Cruzader', 150], ['TelTubes', 2]]
passageiros = [[], [], [], []]

#####################################################################
def clear():                                                        #   Código fornecido por Gabriel-fresan 
    print('\n' * 50)                                                #
                                                                    #
def reservarPassagem(nome = "" , aviaonum = 0):                     #
          if avioes[aviaonum][1] == len(passageiros[aviaonum]):     #
                    return "Não há aviões disponíveis"              #
                                                                    #
          else:                                                     #
                    passageiros[aviaonum].append(nome)              #
                    return "Passagem reservada"                     #
                                                                    #
def consultarAviao(aviao = 0):                                      #
          tmp1 = ""                                                 #
                                                                    #
          for i in passageiros[aviao]:                              #
                    tmp1 = f"{tmp1} {i}\n"                          #
                                                                    #################################################################################################################
          tmp2 = (f"o avião de numero {aviao} com o nome {avioes[aviao][0]} suporta {avioes[aviao][1]} passageiros. \n ele esta trazendo os pasageiros: \n  {tmp1}")#
                                                                    #################################################################################################################
                                                                    #
          return tmp2                                               #
                                                                    #
def consultarPassageiro(nome = ""):                                 #
          achado = False                                            #
          for i in range (len(passageiros)):                        #
                    for x in range (len(passageiros[i])):           #
                              if passageiros[i][x] == nome:         #
                                        achado = True               #
          if achado:                                                #
                    return f"encontrado no avião {i} posição {x}"   #
          else:                                                     #
                    return "passageiro não encontrado"              #
                                                                    #
#####################################################################


def a_avioes():
    tmp1 = ""
    for i in range(len(avioes)):
        tmp1 = tmp1 + f"[{i}] - {avioes[i][0]} \n"

    print(tmp1)


def wellcome():
    print('.: Bem vindo a Sweet Flight :.'.center(65))
    print(' -- Viagens e Turismo --'.center(65))
    print('O Melhor Destino Você Encontrar Aqui!'.center(65))


def ponto():
    print('.' * 70)


def linha():
    print('-' * 70)





def menu():
    op = 0
    while op != 5:
        
        print('Sweet Flight - Agência de Viagem e Turismo'.center(70))
        print("""
[1] - Registrar Aviões Sweet Flight -
[2] - Reservar passagem aérea -
[3] - Realizar consulta por avião -
[4] - Realizar consulta por passageiro -
[5] - Encerrar -
        """)

        op = int(input('Escolha uma opção do Menu: '))
        linha()

        if op == 1:  # Registrar Aviões Sweet Flight
            print('Registrar avião:')
            a_avioes()
            linha()
            print("qual o nome do novo avião ?\n")
            nomeAviao = input(":")
            linha()
            print("quantos passageiros ele suporta ?\n")
            numPassageiros = input(":")
            avioes.append([nomeAviao, numPassageiros])
            linha()

        elif op == 2:
            nomePassageiros = input('Nome do Passageiro: ')
            numeroAviao = int(input('Número do assento: '))

            clear()
            print(reservarPassagem(nomePassageiros , numeroAviao))

        elif op == 3:
            nomeAviao = int(input('Digitar o numero do Avião: '))

            clear()

            print('Conslutar Avião: ')

            
            print(consultarAviao(nomeAviao))
            
            input('Pressione enter para continuar')

            clear()

        elif op == 4:
            numPassageiro = input('Digite o nome do Passageiro: ')
            print(consultarPassageiro(numPassageiro))

            input('Pressione enter para continuar')

            clear()

        elif op == 5:
            print("Programa Finalizado com Sucesso!")
            break

        else:
            print('Digite uma opção válida!')


linha()
ponto()
wellcome()
ponto()
linha()
linha()
menu()