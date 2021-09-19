#!/bin/bash
######################################################################################
#Instalação no Ubuntu 18.04.05 do Quantum-Espresso 6.5
#Atualizar o sistema
echo "Atualizar o sistema"
sudo apt-get update
sudo apt-get upgrade -y
######################################################################################
#Instalar pacotes de compiladores - visualizadores e bibliotecas
echo "Instalar pacotes de compiladores - visualizadores e bibliotecas"
sudo apt-get install gfortran -y
sudo apt-get install libfftw3-dev libblas3 -y
sudo apt-get install libblas-dev openmpi-bin libopenmpi-dev -y
sudo apt-get install jmol xcrysden avogadro -y
sudo apt install wget -y
sudo apt install make -y
######################################################################################
#MPI
sudo apt install mpich -y
sudo apt install mpi-default-dev -y
sudo apt-get install mpi -y
sudo apt-get install libmpich-dev -y
######################################################################################
#Criar diretório e instalar o QE
echo "Baixar e instalar o QE"
sudo mkdir -p /opt/QE
cd /opt/QE
sudo wget  https://github.com/QEF/q-e/archive/refs/tags/qe-6.5.zip
sudo unzip qe-6.5.zip
cd q-e-qe-6.5
sudo ./configure
sudo make all
######################################################################################
#Mudar o local dos execultáveis
cd /opt/QE/q-e-qe-6.5/bin
sudo cp * -f /usr/local/bin
######################################################################################
#Remover versões antigas do JAVA
sudo apt-get purge openjdk*
sudo apt-get purge 
sudo update-alternatives --remove "java" "/opt/jdk/jdk1.8.0_261/bin/java" 
sudo update-alternatives --remove "javac" "/opt/jdk/jdk1.8.0_261/bin/javac"
sudo apt autoremove
sudo apt-get update
######################################################################################
#instalar o JAVA
#Criar e entrar no diretório de instalação
sudo mkdir -p /opt/java/jdk
cd /opt/java/jdk
#Para encontrar um JDK mais recente basta entar no site da Oracle e copiar o link do Jdk.deb e substituir na linha abaixo.
sudo wget https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.deb
#Intalando
sudo dpkg -i jdk-17_linux-x64_bin.deb
#Verificando a versão instalada
java -version
######################################################################################
#Instalar o BURAI
echo "Instalar o BURAI"
cd /opt/QE
sudo wget https://github.com/BURAI-team/burai/releases/download/ver.1.3-linux/BURAI1.3_Linux.tgz
sudo tar zxvf BURAI1.3_Linux.tgz
cd BURAI1.3
sudo ./makeLauncher.sh
sudo cp BURAI.desktop /usr/share/applications
cd /usr/share/applications
sudo chown $USER BURAI.desktop
cp BURAI.desktop ~/Desktop/
#Instalar o PWGui
echo "instalar o PW-GUI"
cd /opt/QE
sudo wget http://www-k3.ijs.si/kokalj/pwgui/download/pwgui-6.1-linux-x86_64.zip
sudo unzip pwgui-6.1-linux-x86_64.zip
sudo cp pwgui /usr/share/applications
sudo cp pwgui /usr/local/bin
cd
######################################################################################
#Criar pasta QE_Calculations
sudo mkdir -p /home/QE_Calculations
cd /opt/QE/q-e-qe-6.5
sudo cp -r pseudo /home/QE_Calculations

