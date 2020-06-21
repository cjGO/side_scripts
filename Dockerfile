FROM python:3.7
FROM jupyter/minimal-notebook
WORKDIR $HOME
RUN python -m pip install --upgrade pip
COPY requirements.txt ./requirements.txt
RUN python -m pip  install -r requirements.txt
RUN python -m pip install --upgrade --no-deps --force-reinstall notebook
RUN python -m pip install jupyterthemes
RUN python -m pip install --upgrade jupyterthemes
RUN pip install dash==1.13.2
RUN pip install jupyterthemes
RUN pip install --upgrade jupyterthemes
RUN pip install jupyter_contrib_nbextensions
RUN pip install xeus-python
RUN python -m pip install jupyter_contrib_nbextensions
# enable the Nbextensions
RUN jupyter nbextension enable --py widgetsnbextension --sys-prefix
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager@^2.0.0 --no-build
RUN jupyter labextension install jupyterlab-dash
RUN jupyter labextension install jupyter-matplotlib@^0.7.2 --no-build
RUN jupyter labextension install @jupyterlab/debugger
RUN jupyter labextension install jupyterlab-drawio
RUN jupyter lab build -y
RUN jupyter lab clean -y
RUN npm cache clean --force

ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--no-browser"]
