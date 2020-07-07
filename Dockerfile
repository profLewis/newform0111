FROM jupyter/datascience-notebook:9f9e5ca8fe5a
# Install in the default python3 environment
RUN pip install --upgrade pip
RUN pip install jupyter_contrib_nbextensions

RUN git clone https://github.com/profLewis/newform0111.git
RUN cd newform0111 && python setup.py install && export PATH="${HOME}/.local/bin/:${PATH}" && bash postBuild
RUN conda env create -f environment.yml
RUN conda activate newform0111
RUN python -c "import newform0111;help(newform0111)"

USER $NB_UID
