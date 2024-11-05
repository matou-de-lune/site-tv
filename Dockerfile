# Используем официальный образ Node.js
FROM node:20-alpine

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем package.json и package-lock.json
COPY ./core/package*.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем остальную часть приложения
COPY ./core ./

# Собираем приложение
RUN npm run build

# Экспортируем приложение на порт 3000
EXPOSE 3000

# Запускаем приложение
CMD ["npm", "start"]
