FROM python:3.8
RUN mkdir -p /fastapi-admin && mkdir -p /root/.pip
WORKDIR /fastapi-admin
COPY pyproject.toml poetry.lock /fastapi-admin/
COPY pip.conf /root/.pip
RUN pip3 install poetry
ENV POETRY_VIRTUALENVS_CREATE false
RUN poetry install --no-root
COPY . /fastapi-admin
RUN poetry install
