FROM cyversevice/rstudio-verse:latest

# Change to root user to install linux system dependencies
#USER root
#install some linux packages
#RUN apt-get update && apt-get install -y cowsay fortune

# Reset the username to RStudio user `rstudio` if you ran as root
#USER rstudio

# install some R packages
RUN R "install.packages(c('viridis','cowplot','ggnewscale','gggenes'), dependencies=TRUE)"

