print('.: : Iniciando Programa : :.')
print('.: [1] - Cadastrar Produto :.')
print('.: [2] - Lista Produtos Cadastrados :.')
print('.: [3] - Buscar Produtos :.')
print('.: [4] - Excluír Produto :.')
print('.: [5] - Sair do Programa :.')
op = 0
lista = []
while op != 5:

      op = int(input('Escolha uma opção: '))

      if op == 1:
            user_vol = int(input("Digite a quantidade de produtos que serão cadastrados: "))
            x = 0
            while x < user_vol:
                  n1 = input("Digite o nome do produto: ")
                  lista.append([n1])
                  x += 1


      elif op == 2:
            print(f'Produtos Cadastrados: ')
            for i in lista:
                  print ( i )


      elif op == 3:
            busca = input('Digite o nome do produto a ser pesquisado: ')
            
            tmp = True
            for i in lista:
                  if busca in i:
                        print(f'O produto foi localizado na base: {busca}')
                        tmp = False
            if tmp:
                  print('Produto não localizado.')
                  


      elif op == 4:
            lstr = input('Excluir ítem: ')
            tmp = True
            for i in lista:
                  if lstr in i:
                        pos = lista.index(i)
                        lista.remove(i)
                        tmp = False
                        print(f'Produto encontrado na posiçao: {pos} \n Produto Deletado com Sucesso!') 
            if tmp:
                  print ("Nenhum Produto Encontrado. ")


      elif op == 5:
            print('=' * 40)
            print("Programa Finalizado com Sucesso!")
            print('=' * 40)


      else:
            print("Escolha inválida")
