"""-------------------------------------------------------------

Primeira parte: Daylon Airton Kern (Tião Gavião Caoio)

----------------------------------------------------------------

Segunda parte:  Robson Luis Amaral

----------------------------------------------------------------

Terceira parte (Interface ou "GUI"): Gabriel Freitas dos Santos

-------------------------------------------------------------"""






import easygui as gui

def character_count(string):
    s = 0
    for i in string:
        s += 1
    return s

def listUser(t , n = 40):
    tmpI = n - character_count(t)
    tmpI2 = " " * tmpI
    return tmpI2



def empilhar(x , y=[]):
    y.append(x)

def desempilhar(x=[]):
    x.pop() 

def limparPilha(x=[]):
    x.clear()

def listarPilha(x=[]):
    p = ""
    for i in x :
        p = (p ,"\n", i)
    return p

def pilhaVazia(x=[]):
    if x == []:
        ret = True
    else:
        ret = False
    return ret



lista = []
pilha = []
fila = []

ops = ""
while True:

    

#---------------------------------------------------------------------#
#                           --Selecionar opção--  
                    
    ops = gui.choicebox(
        "o que você gostaria de fazer ?", 
        title="Sistema de Pilha" , 
        choices=[
            "(1). Adicionar a pilha",
            "(2). Remover topo da pilha", 
            "(3). Limpar a pilha", 
            "(4). Listar o que tem na pilha", 
            "(5). Checar se a pilha esta vazia",
            "(6). Segunda etapa da S A 5 Fila", 
            "(7). Sair do sistema"])   

#---------------------------------------------------------------------#
#                          --Adicionar a pilha--
    if "(1)" in ops:
        empilhar(
            gui.enterbox( 
                msg="Escreva", 
                title="Sistema de Pilha"), 
            lista)

#---------------------------------------------------------------------#
#                        --Remover topo da pilha--
    elif "(2)" in ops:
        gui.msgbox(
            msg="O Topo da Pilha foi Apagado com Secesso!", 
            title="Sistema de Pilha")
        desempilhar(lista)

#---------------------------------------------------------------------#
#                           --Limpar a pilha--
    elif "(3)" in ops:
        gui.msgbox(
            msg="A Pilha foi Apagada com Secesso!", 
            title="Sistema de Pilha")        
        limparPilha(lista)
        

#---------------------------------------------------------------------#
#                      --Listar o que tem na pilha--
    elif "(4)" in ops:
        gui.msgbox(
            msg=listarPilha(lista), 
            title="Sistema de Pilha") 

#---------------------------------------------------------------------#
#                     --Checar se a pilha esta vazia--
    elif "(5)" in ops:
        print("\n" * 100)
        if pilhaVazia(lista):
            gui.msgbox(
                msg="A Pilha Esta Vazia", 
                title="Sistema de Pilha")

        else:
            gui.msgbox(
                msg="A Pilha não Esta vazia", 
                title="Sistema de Pilha")


#---------------------------------------------------------------------#
#                  --Segunda etapa da S A 5 Fila--

    elif "6" in ops:
        def empilhar(numero):
            gui.msgbox(
                msg="Empilhando", 
                title="Sistema de Pilha")
            
            for i in range(numero):
                pilha.append(i)
            
            gui.msgbox(
                msg=(pilha,"\n",(f"Elemento do topo da fila é:{pilha[-1]}")), 
                title="Sistema de Pilha")
            
        def enfileirar(numero):
            gui.msgbox(
                msg="Enfileirando", 
                title="Sistema de Pilha")
            
            for i in range (numero):
                fila.append(i)
            
            gui.msgbox(
                msg=(
                    fila,
                    "\n", (f"O primeiro elemento da fila é:{fila[0]}"), 
                    "\n", (f"O ultimo elemento da fila é:{fila[-1]}")), 
                title="Sistema de Pilha")


        enfileirar(25)

        def retirar_da_fila():
            gui.msgbox(
                msg="Removendo o Primeiro da Fila", 
                title="Sistema de Pilha")

            primeiro_da_fila= fila.pop(0)

            gui.msgbox(
                msg=(
                    "\n", (f"Excluído o primeiro elemento da fila foi : {primeiro_da_fila}"), 
                    fila,
                    "\n", (f"O primeiro elemento da fila agora  é:{fila[0]}")), 
                title="Sistema de Pilha")
            

        retirar_da_fila()

        def fila_vazia():
            gui.msgbox(
                    msg=("Fila Vazia", 
                    (len(fila)==0)),
                title="Sistema de Pilha")

        fila_vazia()
        def excluir_fila():
            gui.msgbox(
                msg="Excluir a Fila", 
                title="Sistema de Pilha")
            while(len(fila) >0): 
                primeiro_da_fila= fila.pop(0)
                gui.msgbox(
                    msg=(
                        (f"Excluindo o primeiro da fila :{primeiro_da_fila}"),
                        (f"Seguindo a lista:{fila}")), 
                title="Sistema de Pilha")
                
                

        excluir_fila() 

        fila_vazia()

#---------------------------------------------------------------------#
#                           --Sair do sistema--
    elif "(7)" in ops:
        gui.msgbox(
            msg="Saindo do Sistema", 
            title="Sistema de Pilha")
        print("\n" * 100)
        print("Saindo do sistema")
        break

#---------------------------------------------------------------------#
#                                --Erro--
    else:
        print("\n" * 100)
        print(" ERRO \n valor invalido!")

