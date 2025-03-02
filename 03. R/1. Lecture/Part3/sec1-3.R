# [빅데이터를 활용한 스마트 데이터 전문가 양성과정]
# 2019-05-29(수) / 294page

#Stackoverflow에서 모르는 부분을 검색한다.
#R은 Interpret방식(ex:java는 Compile방식)
# 0) R을 사용하면서 주의할 점 
# 1) Indentation: 조건식, 반복문, 함수 등
# 2) Comment: 주석을 알기쉽게 필기.

#--------------------------------------------------------------#
#               코딩에서 가장 중요한 것 두 가지                #
#                                                              #
#                        1. Indentation                        #
#                                                              # 
#                        2. Comment                            #
#--------------------------------------------------------------#


#--------------------------------------------------------------#
#----------------  section 1 ~ 3 : R 기본설정 -----------------#
#--------------------------------------------------------------#


# 1.1 작업용 기본 디렉토리 설정 ---------------------------------------------------------

setwd("D:/dudwlsrla92/R_Data_Analysis/Part3/data") #
getwd() #current working directory

'test'


# 1.2 print와 cat -----------------------------------------------------------------------

print(1+2)
1+2
print('a')
"a"
'string'
print(pi)
print(3.1457,digit=3)              # digit 옵션으로 나타낼 자리수 지정 가능 (반올림)

print(3,4)                         # print는 한가지 타입만 출력
print(3,"a")                       # 두 가지 타입은 error 

cat(3,4)                           # cat 다양한 형태의 타입은 출력가능 단, 행렬이나 리스트는 출력 불가
cat(3,"a")
cat(1,':','a','\n,',2,':','b')     # \n은 줄 바꾸기 
cat(list(1,2,3,4,5))               # error
3; 4; 5;                           # 세미콜론으로 한 줄에 여러 작업을 동시에 할 수 있다
1+2; 3+4; pi*5+5


#---------------------------------------------------------------#
#--------------------- section 4 : Data Type -------------------#
#---------------------------------------------------------------#

# 4.1 숫자형(numeric)과 주요 산술연산자 ----------------------------------------------------

print(5/2)              # / 나누기
print(5%/%2)            # %/% 나눗셈의 몫을 구한다.
print(5%%2)             # %%  나눗셈의 나머지를 구한다. 
print(5^2)              # 2제곱 

100000+100000           # 2e+05 = 2*(10^5)
1 / 1000000             # 1e-06 = 1*(10^(-6))

'1'+'2'                          # Error: 문자형이라서 error 
as.numeric('1')+as.numeric('2')  # 문자형을 숫자형으로 변환 후 계산


# 4.2 문자형(character) --------------------------------------------------------------------

'First'
"Second"
first                   # Error: 문자형의 데이터가 아닌 변수 형태

first <- 1              # 변수 설정 후 변수를 호출하면 해당하는 값을 출력
first

class(1)
class('1')
class(first)

# 4.2.1 다양한 문자열 다루기 함수 *** ------------------------------------------------------

vec1 <- "lim"
vec2 <- "wonki"
nchar(vec1)                                              # 문자열 길이 추출
paste(vec1,"he is student",sep=", ")                     # 문자열 붙이기, sep(seprate) 옵션으로 구분 가능  
paste(c('첫','두','세'),rep('번째',3),collapse=", ")     # 결과값이 2개 이상일 때 collapse 옵션으로 연결 
paste0(vec1,vec2)                                        # 공백없이 문자열 붙이기
                                                         # paste 함수 참고 :https://m.blog.naver.com/coder1252/220985161855
substr("limwonki",1,3)                                   # 첫번째 ~ 세번째 문자열 추출
strsplit("lim-wonki",'-')                                # 구분자로 문자열 나누기 

data <-c('limwk',"limkk", "limqq")                       # 찾아바꾸기 sub (단일) gsub(전체) gsub(pattern, replacement, data)
gsub_data <- gsub("lim","kim",gsub_data); gsub_data      # 단 data frame 형태에서는 적용이 안됨, vector 형태에만 적용되는 듯(?)
grep("qq",data)                                          # grep(pattern, data) data내의 패턴의 위치를 알려줌

# 4.3 논리형(logical) - FALSE와 TRUE --------------------------------------------------------

3 & 0                   # 3 and 0의 의미로 T * F 이므로 출력값은 F
3 & 1                   # 3 and 1의 의미로 T * T 이므로 출력값은 T

3 | 0                   # 3 or 0 의 의미로 T + F 이므로 출력값은 T
3 : 1                   # 3 or 1 의 의미로 T + T 이므로 출력값은 T

!0                      # 0(FALSE, 거짓)이 아닌 것이므로 출력값은 T
!1                      # 1(TRUE, 참)이 아닌 것이므로 출력값은 F

class(!0)


# 4.4 NA형(logical) & NULL형(null) ----------------------------------------------------------

                        # NA : 잘못된 값이 들어올 경우 발생 (Not Applicable, Not Available)
                        # NULL : 값이 없을 경우 발생 

cat(1,NA,2)             # NA가 그대로 출력된다 
cat(1,NULL,2)           # NULL값이 제거되고 출력된다 

sum(1,NA,2)             # NA를 더하니까 결과가 NA로 출력된다 
sum(1,NULL,2)           # NULL값은 제외한 나머지 값만 더해서 결과가 출력된다 
sum(1,NA,2, na.rm=T)    # NA를 제거(옵션 na.rm=T) 한 후 함수를 수행한다 


# 4.5 요인(Factor) -----------------------------------------------------------------------

                                                # factor는 주로 범주형 변수와 집단분류에 사용된다
factor_test <- read.csv("factor_test.txt")      # vector와는 다르게 벡터에 있는 고유 값의 정보를 얻는다
                                                # 이 고유값들을 요인의 수준(Level)이라고 한다
View(factor_test)
factor1 <- factor(factor_test$blood); factor1   # factor_test의 blood 변수를 factor형으로 지정하고 factor1에 저장 
gender1 <- factor(factor_test$sex); gender1

summary(factor1)                                # factor를 요약해서 보여준다 
summary(gender1)

factor2 <- factor(factor_test$blood,stringAsFactor=F)



