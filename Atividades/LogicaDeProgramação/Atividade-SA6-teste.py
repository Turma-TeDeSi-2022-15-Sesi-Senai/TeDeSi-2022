import random
import easygui

def sort(listIn = []):
    for i in range(len(listIn)):
        for j in range(len(listIn)):
            if listIn[i] < listIn[j]:
                listIn[i], listIn[j] = listIn[j], listIn[i]
    return listIn

def printList(listIn = []):
    tmp =""
    for i in range(len(listIn)):
        tmp = tmp + str(listIn[i]) + "  "
    return tmp


def testRun():
    test = []
    for i in range(43):
        test.append(random.randint(0, 9))
    easygui.msgbox(printList(test))
    aux = printList(test)
    sort(test)
    easygui.msgbox(printList(test))

    easygui.msgbox(aux + "\n\n" + printList(test))


testRun()

