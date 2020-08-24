
def sum(a, b):
    result = a + b
    return result

def say():
    return 'Hello!'

def sum2(a, b):
    print("%d, %d의 합은 %d 입니다." % (a, b, a+b))

# print(sum(1,3)) # 4
# print(say())    # Hello!
# print(sum2(4,8))# 4, 8의 합은 12 입니다.

myList = [1, 2, 3]
myList.append(4) #배열에 4를 추가시킴
# print(myList.pop()) #배열마지막 4 출력됨

def sum_many(*args):
    sum = 0
    for i in args:
        sum = sum + i
    return sum

print(sum_many(1,2,3)) # 1 ~ 3 의 합 6 출력됨

def print_kwargs(**kwargs):     #keyword argument # 여러개 값이 들어오는걸 처리할수있는 매개변수
    for k in kwargs.keys():
        if(k == "name"):
            print("당신의 이름은 : " + k)

print(print_kwargs(name="int 조수", b="2")) # None 출력됨

#여러개의 리턴값을 설정, 선택할수 있다.
def sum_and_mul(a,b):
    return a+b, a*b, a-b

print(sum_and_mul(1,2)[0])  # a+b 선택 3 출력


def say_myself(name, old, man=True):
    print("나의 이름은 %s 입니다." % name)
    print("나이는 %d살 입니다." % old)
    if man:
        print("남자입니다.")
    else:
        print("여자입니다.")
say_myself("라이유튜브", 20, False)    #파라미터 순서 맞춰야댐
#say_myself(old=25, name="정서율", man=False) #이렇게 순서안맞고 값지정해도 가능

#지역변수
a=1
def vartest(a):
    a = a + 1

vartest(a)
print(a) # 값은 1

#전역변수

def vartest2():
    global a
    a = a + 1

vartest2()
print(a) # 값은 2


#Lambda #함수를 간단하게
# def add(a,b):
#     return a+b
add = lambda a, b: a+b
print(add(1,2))

myList = [lambda a, b: a+b, lambda a, b: a*b]
print(myList[0](1,2)) #a+b를 사용 >> 3 출력

#입력함수
# print("값을 입력하세요>>>")
# a = input()

for i in range(10):
    print(i, end=" ")   # 줄바꿈 안하고 0 1 2 3 4 .. 출력

#파일입출력
#쓰기
f = open("새파일.txt", 'w', encoding="UTF-8")   #마지막 인코딩 설정해줘
for i in range(1, 111):
    data = "%d번째 라인입니다.\n" % i
    f.write(data)    
f.close()

#한줄읽기
# f = open("새파일.txt", 'r', encoding="UTF-8")
# line = f.readline()
# print(line)
# f.close()

#여러줄읽기
f = open("새파일.txt", 'r', encoding="UTF-8") 
while True:
    line = f.readline()
    if not line: break
    print(line)
f.close()

#여러줄읽기2
f = open("새파일.txt", 'r', encoding="UTF-8") 
lines = f.readlines()
for i in lines:
    print(i, end="")
    #print(i.strip())    #.strip() 양쪽끝에서 특정문자 제거
f.close()

with open("foo.txt", "w") as f:
    f.write("Life is too short, you need python")








