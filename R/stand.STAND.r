#' Calculates the mean quadratic diameter, basal area or number of trees.
#' 
#' \code{stand.STAND} Calculates the mean quadratic diameter, basal area or number of trees based on stand-level information 
#' of the plot. At least two parameters are required to calculate the third missing parameter.   
#' 
#' @export
#' @author Priscila Someda-Dias, Salvador A. Gezan
#' 
#' @param BA  Numeric value of basal area of the plot (m2/ha).
#' @param N   Numeric value of number of trees per hectare. 
#' @param QD  Numeric value of mean quadratic diameter (cm). 
#'
#' @return A list containing the parameters: 
#' \itemize{
#' \item \code{BA} Basal Area (m2/ha).
#' \item \code{N}  Number of trees per hectare.
#' \item \code{QD} Mean Quadratic Diameter (cm).
#' }
#' 
#' @examples
#' stand.STAND(QD=18, N=1660)$BA   # Missing BA 
#' stand.STAND(BA=42, QD=18)$N     # Missing N 
#' stand.STAND(BA=42, N=1660)$QD   # Missing QD


stand.STAND  <-  function(BA=NA, N=NA, QD=NA){
                      
                      # QD = sqrt((4/pi)*(BA/N))*100
                    
                      # 1. If all informations are provided
                      if(is.na(BA)==F && is.na(N)==F && is.na(QD)==F){
                        print("Warning - No values esimated. You already have all information.")
                      } 
  
                      # 2. If QD is missing
                      if(is.na(BA)==F && is.na(N)==F && is.na(QD)==T){
                        QD <- (sqrt((4/pi)*(BA/N))*100) 
                      } 
                      
                      # 3. If BA is missing
                      if(is.na(BA)==T && is.na(N)==F && is.na(QD)==F){
                        BA <- ((pi/4)*((QD/100)^2)*N)
                      } 
                      
                      # 4. If N is missing
                      if(is.na(BA)==F && is.na(N)==T && is.na(QD)==F){
                        N <- (BA/((pi/4)*((QD/100)^2)))
                      } 
                    
                      # 5. If the minimum informations are provided
                      if(is.na(BA)==T && is.na(N)==T && is.na(QD)==T | 
                         is.na(BA)==F && is.na(N)==T && is.na(QD)==T |
                         is.na(BA)==T && is.na(N)==F && is.na(QD)==T |
                         is.na(BA)==T && is.na(N)==T && is.na(QD)==F){
                         stop("Warning - Please provide information required.")
                      } 
  
                      return(list(BA=BA,N=N,QD=QD))
               } 
