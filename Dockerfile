FROM ghcr.io/osgeo/gdal:ubuntu-full-latest

LABEL org.opencontainers.image.description "This is a docker image for AGMS script"

RUN apt-get update \
	&& apt-get install python3-pip netcdf-bin -y

RUN pip3 install requests

RUN pip3 install Pillow

RUN pip3 install htmllistparse

# RUN pip3 install pillow

# RUN pip3 install timeloop


# RUN pip3 install GDAL
#COPY ./OptimizeRasters ./OptimizeRasters

RUN groupadd -r worker && useradd -m -r -g worker worker
# COPY .netrc /home/worker/.netrc
# COPY .netrc /home/worker/.urs_cookie

# RUN chmod 0600 /home/worker/.netrc

WORKDIR /app

RUN chown -R worker:worker /app

USER worker
CMD ["python3", "app.py"]