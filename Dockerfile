FROM python:3.13.5-alpine3.22

# Define o diretório de trabalho no contêiner
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# Copia todo o conteúdo do diretório atual para o diretório de trabalho no contêiner
COPY . .

# Expõe a porta 80 para permitir a comunicação com a aplicação
EXPOSE 8000

# Comando para executar a aplicação quando o contêiner iniciar
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
