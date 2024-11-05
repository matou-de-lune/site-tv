# Используем официальный образ Node.js
FROM node:16-alpine

# Устанавливаем рабочую директорию
WORKDIR /core

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем остальную часть приложения
COPY . .

# Собираем приложение
RUN npm run build

# Экспортируем приложение на порт 3000
EXPOSE 3000

# Запускаем приложение
CMD ["npm", "start"]
