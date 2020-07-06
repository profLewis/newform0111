FROM continuumio/miniconda3

LABEL maintainer="p.lewis@ucl.ac.uk"
LABEL coursename="GEOG0111"
LABEL department="Geography"
LABEL university="UCL"
LABEL version="1.0"

#
WORKDIR /home/${USER}

# add notebooks to <WORKDIR>
ADD *.ipynb newform0111/
ADD images newform0111/
ADD data newform0111/
ADD dockerfile newform0111/

# Create the environment:
COPY environment.yml .
COPY postBuild .

# create env newform0111
RUN conda update -n base -c defaults conda
RUN conda env create -f environment.yml

SHELL ["conda", "run", "-n", "newform0111", "/bin/bash", "-c"]
RUN conda install jupyter

# Make RUN commands use the new environment:
SHELL ["conda", "run", "-n", "newform0111", "/bin/bash"]
RUN postBuild

# The code to run when container is started:
ENTRYPOINT ["conda", "run", "-n", "newform0111", "jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

