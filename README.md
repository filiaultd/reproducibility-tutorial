# reproducibility-tutorial
# https://learning.cyverse.org/projects/cyverse-cyverse-reproducbility-tutorial/en/latest/step2.html

##Computer Setup

# clone git
git clone https://github.com/filiaultd/reproducibility-tutorial.git
    
# get miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
   
# install miniconda
bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda

#make sure all conda packages will be in path by symbolic links to /bin
#this step is a bit of a hack and you may get some warnings about
#symbolic links that cannot be created - it's ok.
ln -s /opt/conda/pkgs/*/bin/* /bin
#ln -s /opt/conda/bin/* /bin?
ln -s /opt/conda/pkgs/*/lib/* /usr/lib
   
#Install Jupyter lab version 1.2.3
/opt/conda/bin/conda install -c conda-forge -y jupyterlab=1.2.3
/opt/conda/bin/conda install -c conda-forge -y nodejs=10.13.0
/opt/conda/bin/pip install bash_kernel
/opt/conda/bin/pip install ipykernel
/opt/conda/bin/python3 -m bash_kernel.install

#Test Jupyter
/opt/conda/bin/jupyter lab --no-browser --allow-root --ip=0.0.0.0 --NotebookApp.token='' --NotebookApp.password='' --notebook-dir='/scratch/reproducibility-tutorial/'
   
#Install Snakemake 5.8.1
/opt/conda/bin/conda install -c bioconda -c conda-forge -y snakemake=5.8.1
# hack conda again
ln -s /opt/conda/bin/* /bin
ln -s /opt/conda/lib/* /usr/lib

#Verify snakemake installation
snakemake --version

#install docker
#update ubuntu apt-get package manager
sudo apt-get update
#install needed packages
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
# add docker key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# add repository
sudo add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
 $(lsb_release -cs) \
 stable"
#update apt-get with new repository info
sudo apt-get update
#install docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
#test docker
docker run hello-world

#append history to README.MD file
cd /scratch/reproducibility-tutorial/ #working from scratch 
# append your bash history to the README.MD file
history >>README.md
