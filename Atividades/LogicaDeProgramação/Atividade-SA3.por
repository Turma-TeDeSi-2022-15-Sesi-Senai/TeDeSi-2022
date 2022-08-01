programa {
    
inclua biblioteca Texto --> t
    
	
funcao inicio() {
	    
			
	
	inteiro Lidade[50] 
	cadeia Lnome[50] 
	inteiro i = 0
    inteiro opcao = 0
    
    
    limpa()
	
    escreva("Bem vindo ao sistema de cadastro de usuarios \n\n")
	
    
    enquanto (opcao != 3) {
		
		enquanto (opcao < 1 ou opcao > 3){ 
			escreva("o Que deseja fazer?\n 1. Cadastrar Novo Usuario\n 2. Listar Usuarios\n 3. Sair\n") 
			leia(opcao) 
		}
		escolha (opcao){


		caso 1:
			limpa()
			escreva("Cadastrar Novo Usuario \n\n")
			se (i > 50){
				limpa()
				escreva("Não há mais espaço para cadastrar usuarios !\n\n\n")
			}senao{
				cadeia nome = ""
				inteiro idade = 0
				escreva("Digite o nome do usuario: ")
				leia(nome)
				escreva("Digite a idade do usuario: ")
				leia(idade)
				Lnome[i] = nome
				Lidade[i] = idade
				i = i + 1
				limpa()
				escreva( Lnome[i-1], " foi cadastrado com sucesso \n")
				escreva( i , " usuarios cadastrados \n\n")
			}
			opcao = 0
		pare


		caso 2:
			limpa()
			se (i == 0){
				escreva("Nao ha usuarios cadastrados \n")
			}senao{
				escreva("total de usuarios cadastrados: ", i)
				escreva("\n\nLista de Usuarios\n\n")
				escreva("Nomes:                    -                     Idades: \n")


				para (inteiro p = 0 ; p < i ; p++){
				    escreva(Lnome[p])
				    inteiro quant = 25 - t.numero_caracteres(Lnome[p])
				    para (inteiro q = 0 ; q < quant ; q++){
				    	escreva(" ")
				    }
				    escreva(" - ")
				    cadceia idade = Lidade[p] + " anos"
				    quant = 27 - t.numero_caracteres(idade)
				    para (inteiro q = 0 ; q < quant ; q++){
				    	escreva(" ")
				    }
				    escreva(idade , "\n")
                    
				}
			}
			cadeia enter = ""
			
            escreva("\n Pressione Enter para continuar...")
			leia(enter)
			
            limpa()
			opcao = 0
		
        pare


		caso 3:
			limpa()
			escreva("\n\n Saindo do sistema \n")
				
	}
}
}