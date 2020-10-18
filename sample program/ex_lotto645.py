# python ex_custom_lotto_generator
import random

class MyLottoGen:
    #생성자
    def __init__(self):
        self.win = set() #6개 당첨번호 중복없음
        self.bonus = set() #보너스번호


    def init(self):
        self.win.clear()
        self.bonus.clear() 
        while len(self.win) < 6:
            self.win.add(random.randrange(1, 46)) #집합 자료형이므로 중복 제외됨

        while True:
            n = random.randrange(1, 46)
            if not (n in self.win): #보너스 번호
                self.bonus.add(n)
                break

    # 출력
    def print(self):
        arr = list(self.win)
        arr.sort()

        print(arr, end="")
        print(" +", list(self.bonus))


print(">>>>>>>>>>로또 프로그램 실행<<<<<<<<<<")
myLottoGen = MyLottoGen()
myLottoGen.init()
myLottoGen.print()



    #     temp = random.randint(1, 6)
    #     # result = [0 for _ in range(6)]
    #     result = []
    #     for i in range(6):
    #         result.append(0)

    #     # for i in range(1, 7):
    #     #     temp = random.randint(1, 45)
    #     #     if i == 1:
    #     #         result[i-1] = temp

    #     i = 0
    #     while i < 7:
    #         if i > 0:
    #             j = 0
    #             while j < i:
    #                 if temp == result[j]:
    #                     temp = random.randint(1, 6)
    #                     if j > 0:
    #                         j -= 1
    #                     elif j == 0:
    #                         j = -1
    #                 j += 1
    #         if i > 0:
    #             result[i-1] = temp
    #         else:
    #             result[i] = temp
    #         i += 1

    #     i = 0
    #     while i < 6:
    #         print(result[i-1])
    #         i += 1
        
    #     # a = len(result)   # 배열의 길이 구하는 방법 : len() 메소드 이용

    # print(myLottoGen())
    # # print(random.randint(1,7))