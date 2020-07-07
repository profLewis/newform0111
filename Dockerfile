FROM jupyter/datascience-notebook
# Install in the default python3 environment
RUN pip install --upgrade pip
# update conda first of all
RUN conda update -n root conda --yes
# update conda packages before installing coursenotes
RUN conda update -n root --all --yes

# clone the course repo
RUN git clone https://github.com/profLewis/newform0111.git

# go into notes directory
# and update newform0111 env with environment.yml 
RUN cd ${HOME}/newform0111 && conda env create -n newform0111 -f environment.yml --yes
RUN conda activate newform0111
RUN conda update -n newform0111 --all --yes

RUN cd ${HOME}/newform0111 && python setup.py install && export PATH="${HOME}/.local/bin/:${PATH}" && bash postBuild

RUN python -c "import newform0111;help(newform0111)"

USER $NB_UID
