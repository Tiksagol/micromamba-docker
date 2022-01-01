FROM micromamba:test
RUN micromamba install -y -n base -c conda-forge \
       python=3.9.1  && \
    micromamba clean --all --yes

ARG MAMBA_DOCKERFILE_ACTIVATE=1

RUN python -c "import os; os.system('touch foobar')"
