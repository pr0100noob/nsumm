# nsum PWA — установка на телефон

## Что это
PWA (Progressive Web App) — сайт который устанавливается как нативное приложение.
Работает на Android и iPhone. Не нужен App Store или Play Store.

## Как запустить сервер (на твоём ПК)

### Python (самый простой способ)
```bash
cd nsum_pwa
python3 -m http.server 8080
```

Или с автоматической HTTPS (нужен для iOS):
```bash
pip install caddy
# или просто использовать nginx
```

### Nginx (рекомендуется для постоянной работы)
```nginx
server {
    listen 8080;
    server_name _;
    root /path/to/nsum_pwa;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }

    # CORS для Ollama
    location /api/ {
        proxy_pass http://localhost:11434;
        add_header Access-Control-Allow-Origin *;
    }
}
```

## Установка на телефон

### Android (Chrome)
1. Открой http://[твой_IP]:8080 в Chrome
2. Меню (три точки) → "Добавить на главный экран"
3. Подтверди → иконка появится как приложение

### iPhone (Safari)
1. Открой http://[твой_IP]:8080 в Safari
2. Кнопка "Поделиться" (квадрат со стрелкой вверх)
3. "На экран «Домой»" → Добавить

## Важно: Ollama должна слушать не только localhost
```bash
# В .bashrc или .zshrc добавь:
export OLLAMA_HOST=0.0.0.0:11434

# Перезапусти ollama
ollama serve
```

После этого в приложении вместо localhost укажи:
http://[твой_IP]:11434

## Структура файлов
```
nsum_pwa/
├── index.html        — основное приложение
├── manifest.json     — метаданные PWA
├── service-worker.js — кэширование
└── icons/
    ├── icon-192.svg
    └── icon-512.svg
```
