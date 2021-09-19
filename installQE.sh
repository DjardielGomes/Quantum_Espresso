#!/bin/bash
#Instalar o Quantum espresso Via Site
######################################
#Atualizar o sistema
echo "Atualizar o sistema"
sudo apt-get update
sudo apt-get upgrade -y
######################################
#Instalar pacotes de compiladores - visualizadores e bibliotecas
echo "Instalar pacotes de compiladores - visualizadores e bibliotecas"
sudo apt-get install gfortran -y
sudo apt install make -y
sudo apt-get install libfftw3-dev -y
sudo apt-get install libblas3 -y
sudo apt-get install libblas-dev -y
sudo apt-get install jmol -y
sudo apt-get install xcrysden -y
######################################
#MPI
sudo apt install mpich -y
sudo apt install mpi-default-dev -y
sudo apt-get install mpi -y
sudo apt-get install libmpich-dev -y
######################################
#Entrar na pasta de instalação
cd /home/physics
#sudo chmod u+x .
# Instalar o QE
echo "Baixar e instalar o QE"
#Baixar a versão desejada
sudo apt install wget -y
wget  https://github.com/QEF/q-e/archive/refs/tags/qe-6.5.zip
unzip qe-6.5.zip
cd q-e-qe-6.5
./configure
make all
######################################

echo "instalar o PW-GUI"
wget http://www-k3.ijs.si/kokalj/pwgui/download/pwgui-6.1-linux-x86_64.zip
unzip pwgui-6.1-linux-x86_64.zip

cd
# https://sairajdreams.blogspot.com/


#BURAI installation in Ubuntu 18.04 and 20.04

#Step-1: Download the latest version of java development kit (jdk) and BURAI
    
 # Note: to download java you have to create an account at oracle first. 

         # For java go to this link:   https://www.oracle.com/in/java/technologies/javase/javase-jdk8-downloads.html

         # For BURAI go to this link  https://burai.readthedocs.io/en/latest/install/download.html




#Step-2: Remove the existing version of java 

sudo apt-get purge openjdk*
sudo apt-get purge 
sudo update-alternatives --remove "java" "/opt/jdk/jdk1.8.0_261/bin/java" 
sudo update-alternatives --remove "javac" "/opt/jdk/jdk1.8.0_261/bin/javac"
sudo apt autoremove
sudo apt-get update





#Step-3: Installation of Java 
sudo mkdir -p /opt/jdk
sudo cp ~/Downloads/jdk-8u301-linux-x64.tar.gz  /opt/jdk/              # your java file should be in "Download" directory
cd /opt/jdk
sudo tar zxvf jdk-8u261-linux-x64.tar.gz
sudo update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.8.0_301/bin/java 100
sudo update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.8.0_301/bin/javac 100 
java -version


#Step-4: Package required for Quantum Espresso compilation

sudo apt-get install -y gfortran
sudo apt-get install -y openmpi-bin libopenmpi-dev


# Step-5: Installation of BURAI in /usr/local/bin 

sudo cp ~/Downloads/BURAI1.3_Linux.tgz /usr/local/bin/
cd /usr/local/bin
sudo tar zxvf BURAI1.3_Linux.tgz
cd BURAI1.3
sudo ./makeLauncher.sh
sudo cp BURAI.desktop ~/Desktop/
sudo chown $USER BURAI.desktop


