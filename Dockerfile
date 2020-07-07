FROM continuumio/miniconda
LABEL maintainer="Philip Lewis <p.lewis@ucl.ac.uk>"
ARG NB_USER="jovyan"
ARG NB_UID="1000"
ARG NB_GID="100"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

# Install all OS dependencies for notebook server that starts but lacks all
# features (e.g., download as all possible file formats)
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
 && apt-get install -yq --no-install-recommends \
    wget \
    bzip2 \
    ca-certificates \
    sudo \
    locales \
    fonts-liberation \
    run-one \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

# Configure environment
ENV CONDA_DIR=/opt/conda \
    SHELL=/bin/bash \
    NB_USER=$NB_USER \
    NB_UID=$NB_UID \
    NB_GID=$NB_GID \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8
ENV PATH=$CONDA_DIR/bin:$PATH \
    HOME=/home/$NB_USER

# Copy a script that we will use to correct permissions after running certain commands
COPY fix-permissions /usr/local/bin/fix-permissions
RUN chmod a+rx /usr/local/bin/fix-permissions

# Enable prompt color in the skeleton .bashrc before creating the default NB_USER
RUN sed -i 's/^#force_color_prompt=yes/force_color_prompt=yes/' /etc/skel/.bashrc

# Create NB_USER wtih name jovyan user with UID=1000 and in the 'users' group
# and make sure these dirs are writable by the `users` group.
RUN echo "auth requisite pam_deny.so" >> /etc/pam.d/su && \
    sed -i.bak -e 's/^%admin/#%admin/' /etc/sudoers && \
    sed -i.bak -e 's/^%sudo/#%sudo/' /etc/sudoers && \
    useradd -m -s /bin/bash -N -u $NB_UID $NB_USER && \
    mkdir -p $CONDA_DIR && \
    chown $NB_USER:$NB_GID $CONDA_DIR && \
    chmod g+w /etc/passwd && \
    fix-permissions $HOME && \
    fix-permissions $CONDA_DIR

USER $NB_UID
WORKDIR $HOME
ARG PYTHON_VERSION=default

RUN mkdir /home/$NB_USER/work && \
    fix-permissions /home/$NB_USER


RUN conda update -n base conda --yes && \
    conda update -n base --all --yes && \
    conda clean --all -f -y && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER && \
    conda env list && \
    conda --version

# clone the course repo
RUN cd /home/$NB_USER && \
    git clone https://github.com/profLewis/newform0111.git && \
    fix-permissions /home/$NB_USER && \
    cd newform0111 && \
    conda env create -n newform0111 -f environment.yml && \
    conda clean --all -f -y && \
    npm cache clean --force && \
    jupyter notebook --generate-config && \
    rm -rf $CONDA_DIR/share/jupyter/lab/staging && \
    rm -rf /home/$NB_USER/.cache/yarn && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

EXPOSE 8888

USER root
RUN mkdir -p /etc/jupyter/ && fix-permissions /etc/jupyter/

USER $NB_UID
WORKDIR /home/$NB_USER/newform0111


# Install elasticsearch libs
USER root
RUN apt-get update \
 && curl -sL https://repo1.maven.org/maven2/org/elasticsearch/elasticsearch-hadoop/6.8.1/elasticsearch-hadoop-6.8.1.jar
RUN pip install --no-cache-dir elasticsearch==7.1.0

RUN pip install --no-cache-dir ipyleaflet plotly==4.8.* "ipywidgets>=7.5"

# Install important packages and Graphviz
RUN set -ex \
 && buildDeps=' \
    graphviz==0.11 \
' \
 && apt-get update \
 && apt-get -y install htop apt-utils graphviz libgraphviz-dev \
 && pip install --no-cache-dir $buildDeps

# Install various extensions
RUN fix-permissions $CONDA_DIR
RUN jupyter labextension install @jupyterlab/github
RUN jupyter labextension install jupyterlab-drawio
RUN jupyter labextension install jupyter-leaflet
RUN jupyter labextension install jupyterlab-plotly@4.8.1
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
RUN pip install --no-cache-dir jupyter-tabnine==1.0.2  && \
  jupyter nbextension install --py jupyter_tabnine && \
  jupyter nbextension enable --py jupyter_tabnine && \
  jupyter serverextension enable --py jupyter_tabnine
RUN pip install --no-cache-dir jupyter_contrib_nbextensions \
 jupyter_nbextensions_configurator rise && \
  jupyter nbextension enable codefolding/main
RUN jupyter labextension install @ijmbarr/jupyterlab_spellchecker

RUN fix-permissions /home/$NB_USER

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID

# Copy jupyter_notebook_config.json
COPY jupyter_notebook_config.json /etc/jupyter/


#RUN conda activate newform0111
# not really needed, but just in case ...
#RUN conda update -n newform0111 --all --yes

#ENV PATH ${HOME}/.local/bin/:$PATH
#RUN cd newform0111 && python setup.py install && export PATH="${HOME}/.local/bin/:${PATH}" && bash postBuild
#RUN python -c "import newform0111;help(newform0111)"

