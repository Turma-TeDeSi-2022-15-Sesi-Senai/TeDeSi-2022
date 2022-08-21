

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
                    return("Não há aviões disponíveis")
          
          else:
                    AcentoAviaoOcup[aviao].append(nome)
                    return("Passagem reservada")
          

def consultarAviao(aviao = 0):
          
          return numAcentoAviao[aviao] , AcentoAviaoOcup[aviao]


def consultarPassageiro(nome = ""):
          for i in range (len(AcentoAviaoOcup)):
                    for x in range (len(AcentoAviaoOcup[i])):
                              if AcentoAviaoOcup[i][x] == nome:
                                        return ("encontrado no avião", i , "posição", x)
                              else:
                                        return ("não encontrado em nem um avião")
          
          
          
          
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
                    ops = int(input("Digite a opção desejada: "))
                    
                    
                    
                    
                    if ops == 1:
                              tmp1 = input("Digite o nome do avião: ")
                              tmp2 = int(input("Digite a capacidade do avião: "))
                              
                              numAcentoAviao.append([tmp1 , tmp2])
                              
                    elif ops == 2:
                              tmp1 = input("Digite o nome do passageiro: ")
                              tmp2 = int(input("Digite o número do avião: "))
                              
                              print(reservarPassagem(tmp1 , tmp2))
                    
                    elif ops == 3:
                              tmp1 = int(input("Digite o número do avião: "))
                              
                              print(consultarAviao(tmp1))

                    elif ops == 4:
                              tmp1 = input("Digite o nome do passageiro: ")
                              
                              print(consultarPassageiro(tmp1))
                    
                    elif ops == 5:
                              break
          

Main(None)