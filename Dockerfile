FROM continuumio/miniconda3

ADD environment.yml /tmp/environment.yml
ADD docker/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN conda env create -f /tmp/environment.yml

ENV PATH /opt/conda/envs/env/bin:$PATH

RUN mkdir -p /workdir
WORKDIR /workdir

ENV PYTHONPATH "${PYTHONPATH}:/workdir/qa4mbes"

# Force the use of the conda environment
ENTRYPOINT ["docker-entrypoint.sh"]
CMD jupyter notebook --ip=0.0.0.0  --allow-root
