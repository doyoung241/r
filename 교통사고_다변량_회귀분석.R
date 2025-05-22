
# 필요한 패키지 로드
library(tidyverse)

# 데이터 불러오기
data <- read.csv("성별_연령대별_교통사고_4대1분할.csv")

# 예시: 자치구별 21~30세 남성 사고 발생건수와 사망자수 관계 분석
model1 <- lm(사망_합계 ~ `21~30세_남성_발생`, data = data)
summary(model1)

# 예시: 전체 연령대별 남성 사고 발생건수로 사망자수 예측하는 다중회귀
model2 <- lm(사망_합계 ~ `20세이하_남성_발생` + `21~30세_남성_발생` +
                         `31~40세_남성_발생` + `41~50세_남성_발생` +
                         `51~60세_남성_발생` + `61~64세_남성_발생` +
                         `65세이상_남성_발생`, data = data)
summary(model2)

# 시각화 예시
library(ggplot2)
ggplot(data, aes(x=`21~30세_남성_발생`, y=사망_합계)) +
  geom_point(color='steelblue') +
  geom_smooth(method='lm', se=FALSE, color='red') +
  ggtitle("21~30세 남성 사고 발생 vs 사망자수") +
  xlab("21~30세 남성 사고 발생건수") + ylab("사망자수")
