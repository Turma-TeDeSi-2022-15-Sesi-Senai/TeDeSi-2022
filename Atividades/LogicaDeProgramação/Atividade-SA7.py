








def clear():
          print("\n" * 50)

numAcentoAviao = [      
          ["Boeing 747" , 410],
          ["Airbus A380", 615],
          ["Airbus A350", 410],
          ["Boeing 777-300ER", 379],
          ["Airbus A330", 335],
          ["Boeing 787" , 300]         
]

AcentoAviaoOcup = [[],[],[],[],[],[]]

def reservarPassagem(nome = "" , aviao = 0):

          if numAcentoAviao[aviao][1] == len(AcentoAviaoOcup[aviao]):
                    return "Não há aviões disponíveis"
          
          else:
                    AcentoAviaoOcup[aviao].append(nome)
                    return "Passagem reservada"
          

def consultarAviao(aviao = 0):
          tmp1 = ""
          
          for i in AcentoAviaoOcup[aviao]:
                    tmp1 = f"{tmp1} {i}\n"
                    
          tmp2 = f"o avião de numero {aviao} com o nome {numAcentoAviao[aviao][0]} suporta {numAcentoAviao[aviao][1]} passageiros. \n ele esta trazendo os pasageiros: \n  {tmp1}"
                    
          
          return tmp2


def consultarPassageiro(nome = ""):
          
          achado = False
          for i in range (len(AcentoAviaoOcup)):
                    for x in range (len(AcentoAviaoOcup[i])):
                              if AcentoAviaoOcup[i][x] == nome:
                                        achado = True
          
          if achado:
                    return f"encontrado no avião {i} posição {x}"
          else:
                    return "passageiro não encontrado"
          
def Main(args):
          
          if args == "--test-run":
                    print("Teste de execução")
          
          while True:
                    
                    
                    print("""
1 - registrar avião
2 - reservar passagem
3 - consultar avião
4 - consultar passageiro
5 - sair    
                          """)
                    ops = input("Digite a opção desejada: ")
                    
                    clear()
                    
                    
                    
                    if ops == "1":
                              tmp1 = input("Digite o nome do avião: ")
                              tmp2 = int(input("Digite a capacidade do avião: "))
                              
                              numAcentoAviao.append([tmp1 , tmp2])
                              AcentoAviaoOcup.append([])
                              
                              clear()
                              
                    elif ops == "2":
                              tmp1 = input("Digite o nome do passageiro: ")
                              tmp2 = int(input("Digite o número do avião: "))
                              
                              clear()
                              
                              print(reservarPassagem(tmp1 , tmp2))
                    
                    elif ops == "3":
                              tmp1 = int(input("Digite o número do avião: "))
                              clear()
                              
                              print(consultarAviao(tmp1))
                              
                              input("pressione enter para continuar ...")
                              
                              clear()

                    elif ops == "4":
                              tmp1 = input("Digite o nome do passageiro: ")
                              
                              print(consultarPassageiro(tmp1))
                              
                              input("pressione enter para continuar ...")
                              clear()
                              
                    
                    elif ops == "5":
                              print("enserando o sistema")
                              break
                    else:
                              print("porfavor digite uma opção valida")
          
clear()
Main(None)