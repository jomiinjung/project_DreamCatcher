
calcLifeSat <- function(user_id2){
  library(Rserve)
  Rserve()
  library(RJDBC)
  jdbcDriver <- JDBC(driverClass = "oracle.jdbc.driver.OracleDriver",classPath = "C:/oraclexe/app/oracle/product/11.2.0/server/jdbc/lib/ojdbc6.jar")
  con <- dbConnect(jdbcDriver,"jdbc:oracle:thin:@localhost:1521:xe","scott","tiger")
  
  findQuery <- paste0("select * from lifecondition where id='",user_id2,"'")
  findResult <- dbGetQuery(con, findQuery)
  
  age <- as.numeric(format(Sys.Date(), "%Y")) - as.numeric(findResult[1,4]) +1
  
  satLife <- lifeSat(age,findResult[1,]$GENDER,findResult[1,]$WORKING,findResult[1,]$MARRIAGE,findResult[1,]$EDU,findResult[1,]$SATLEISURE,findResult[1,]$SATJOB,findResult[1,]$RELFAMILY,findResult[1,]$RELSOCIAL,findResult[1,]$OWNHOUSE)
  updateQuery <- paste0("update lifecondition set calsatlife = ",satLife," where id='",user_id2,"'")
  dbSendUpdate(con, updateQuery)
}
lifeSat <- function (user_age,user_sex,user_hire,user_marriage,user_edu,user_sat_leisure,user_sat_job,user_rel_family,user_rel_social,user_own_house){
  df <- read.csv("E:/TeamProject/data/treatedData_total_main.csv",na.strings=c(""), encoding = "UTF-8", fileEncoding = "UTF-8")
  
  train <- sample(1:12962,9712)
  train.set <- df[train,]
  
  library(nnet)
  
  if(20<=user_age & user_age<=22){
    user_age <- 1
  }else if(23<=user_age & user_age<=26){
    user_age <- 2
  }else if(27<=user_age & user_age<=29){
    user_age <- 3
  }else if(30<=user_age & user_age<=32){
    user_age <- 4
  }else if(33<=user_age & user_age<=36){
    user_age <- 5
  }else if(37<=user_age & user_age<=39){
    user_age <- 6
  }
  
  life <- multinom(sat_lifeTotal ~ age + sex + hire + marriage + edu + sat_leisure + sat_job + rel_family + rel_social + own_house ,data=train.set)
  summary(life)
  test_x <- data.frame(age=user_age,marriage=user_marriage,sex=user_sex,edu=user_edu,hire=user_hire, sat_leisure=user_sat_leisure,sat_job=user_sat_job, rel_family=user_rel_family, rel_social=user_rel_social, own_house=user_own_house)
  
  #predict -> 조건 대입했을 때 만족도 산출
  predicted.life <- predict(life, newdata=test_x)
  predicted.life
  return(predicted.life)
}



