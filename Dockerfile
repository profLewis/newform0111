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
RUN cd ${HOME}/newform0111 && conda env update -n newform0111 -f environment.yml --yes

USER $NB_UID
