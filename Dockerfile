FROM node:10

# アプリケーションディレクトリを作成する
WORKDIR /usr/src/app

# アプリケーションの依存関係をインストールする
# ワイルドカードを使用して、package.json と package-lock.json の両方が確実にコピーされるようにします。
COPY package*.json ./

RUN npm install
RUN npm install swagger -g

# アプリケーションのソースをバンドルする
COPY . .

EXPOSE 10010
CMD [ "swagger", "project", "start", "-m" ]