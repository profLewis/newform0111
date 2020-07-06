FROM jupyter/datascience-notebook:9f9e5ca8fe5a
# Install in the default python3 environment
RUN pip install --upgrade pip
RUN pip install 'ggplot==0.6.8'

RUN git clone https://github.com/profLewis/newform0111.git
RUN cd newform0111 && python setup.py install && bash postBuild
RUN conda install --yes newform0111 &&
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
RUN conda install -c damianavila82 rise

RUN python -c "import newform0111;help(newform0111)"

USER $NB_UID
