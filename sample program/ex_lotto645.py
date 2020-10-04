# python ex_custom_lotto_generator
import random

def myLottoGen():
    temp = 0
    # result = [0 for _ in range(6)]
    result = []
    for i in range(6):
        result.append(0)

    # for i in range(1, 7):
    #     temp = random.randint(1, 45)
    #     if i == 1:
    #         result[i-1] = temp

    i = 0
    while i < 7:
        temp = random.randint(1, 45)
        if i > 1:
            j = 0
            while j < i:
                if temp == result[j]:
                    temp = random.randint(1, 45)
                j += 1

        result[i-1] = temp
        i += 1

    i = 0
    while i < 6:
        print(result[i-1])
        i += 1
    
    # a = len(result)   # 배열의 길이 구하는 방법 : len() 메소드 이용

print(myLottoGen())
# print(random.randint(1,7))


