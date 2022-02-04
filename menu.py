#!/usr/bin/python
from colorama import Fore,Style

FG = Fore.GREEN
SRE = Style.RESET_ALL

print(FG+ "*"*25 + SRE)
print(FG+" "*9 + "MENU" + SRE)
print(FG +"*"*25 + SRE)
print("1.Chapati" + "-"*10 + ">20 RS")
print("2.Dal" + "-"*14 + ">50 RS")
print("3.Salad" + "-"*12 + ">10 RS")
CR=20
DR=50
SR=10
print("*"*25)
print("\n")

#ORDER
print(FG + "*"*25 + SRE)
print(FG + " "*9 + "ORDER" + SRE)
print(FG + "*"*25 + SRE)
C=input("Please order nos of Chapati: ")
D=input("Please order nos of Dal: ")
S=input("Please order nos of Salad: ")
TC=int(C) * int(CR)
TD=int(D) * int(DR)
TS=int(S) * int(SR)
TB=TC+TD+TS
print("*"*25)
print("\n")

#ITEM
print(FG + "*"*25 + SRE)
print(FG + " "*7 + "ITEMS LIST" + SRE)
print(FG + "*"*25 + SRE)
print("1.Chapati" + "-"*10 + str(C)+" NOS")
print("2.Dal" + "-"*14 + str(D)+ " NOS")
print("3.Salad" + "-"*12 + str(S)+ " NOS")
print("*"*25)
print("\n")

#BILL
print(FG + "*"*25 + SRE)
print(FG + " "*10 + "BILL" + SRE)
print(FG + "*"*25 + SRE)
print("1.Chapati" + "-"*10 + ">{} RS".format(TC))
print("2.Dal" + "-"*14 + ">{} RS".format(TD))
print("3.Salad" + "-"*12 + ">{} RS".format(TS))
print("*"*25)
print("\n")

#TOTAL
print(FG + "*"*25 + SRE)
print(FG + " "*7 + "TORAL BILL" + SRE)
print(FG + "*"*25 + SRE)
print("Total bill is:{}".format(TB))
print("*"*25)
print("\n")

