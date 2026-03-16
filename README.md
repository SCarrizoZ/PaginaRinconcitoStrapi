# 🎸 Rinconcito Musical API - E-commerce Backend (Headless CMS)

![NodeJS](https://img.shields.io/badge/Node.js-18+-339933.svg?logo=nodedotjs&logoColor=white)
![Strapi](https://img.shields.io/badge/Strapi-Headless_CMS-2E7EEA.svg?logo=strapi&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Data_Tier-316192.svg?logo=postgresql&logoColor=white)
![Render](https://img.shields.io/badge/Render-Cloud_Deployment-46E3B7.svg?logo=render&logoColor=white)
![Cloudinary](https://img.shields.io/badge/Cloudinary-Asset_Management-3448C5.svg?logo=cloudinary&logoColor=white)

Prototipo funcional (TRL-3) de un backend centralizado y escalable para una plataforma de comercio electrónico especializada en instrumentos musicales y vinilos. Diseñado bajo una arquitectura Headless, este sistema expone una API RESTful robusta consumible simultáneamente por interfaces web (React) y aplicaciones móviles (React Native).

## 🚀 Arquitectura y Decisiones Técnicas

Este proyecto trasciende el uso básico de un CMS, implementando una arquitectura de datos relacional profunda y lógica de negocio inyectada a medida:

* **Orquestación Headless & Omnicanalidad:** Desacoplamiento total del backend y frontend mediante Strapi, centralizando la lógica del negocio en una única API REST que sirve a múltiples clientes sin duplicación de código.
* **Modelado Relacional Profundo (Taxonomía):** Diseño de una estructura de inventario de 4 niveles (`Macrocategoría` -> `Categoría` -> `Subcategoría` -> `Marca`). Esto optimiza radicalmente el rendimiento de las consultas SQL subyacentes (PostgreSQL) para el filtrado dinámico del catálogo.
* **Lógica Transaccional Extendida:** Intervención de los controladores nativos de Strapi para inyectar reglas de negocio personalizadas en entidades críticas (gestión de `Pedidos`, control de stock y `Listas de Deseos`), garantizando la integridad de las transacciones.
* **Personalización del Esquema de Usuarios:** Sobrescritura del plugin nativo `users-permissions` para relacionar directamente a los clientes con su historial transaccional y preferencias, manteniendo un estricto control de seguridad.
* **Gestión Multimedia en la Nube:** Integración mediante plugins personalizados con **Cloudinary** para el almacenamiento, compresión automática y entrega en el borde (CDN) de todos los activos multimedia de la tienda.

## 🗂️ Estructura del Core API

El núcleo del negocio se encuentra estructurado en el directorio `src/`:
- `api/`: Contiene la definición de los esquemas (Content-Types), rutas, controladores y servicios extendidos para el catálogo (`producto`, taxonomías) y la interacción del usuario (`pedido`, `lista-deseo`).
- `extensions/users-permissions/`: Lógica sobrescrita para la gestión segura de identidades y relaciones del cliente.
- `config/`: Orquestación de middlewares, configuración de base de datos (PostgreSQL) y conexión con proveedores externos (Cloudinary).

## 🛠️ Instalación y Despliegue Local

Sigue estos pasos para levantar el entorno de desarrollo de la API:

1. **Clonar el repositorio:**
   git clone https://github.com/SCarrizoZ/PaginaRinconcitoStrapi.git
   cd PaginaRinconcitoStrapi

2. **Instalar dependencias:**
   npm install
   o usando yarn:
   yarn install

3. **Configurar variables de entorno:**
   Crea un archivo `.env` en el directorio raíz basándote en un archivo de ejemplo. Asegúrate de incluir las credenciales de PostgreSQL, los secretos de JWT (APP_KEYS, API_TOKEN_SALT) y las claves de Cloudinary.

4. **Compilar el panel de administración (opcional pero recomendado):**
   npm run build

5. **Iniciar el servidor en modo desarrollo:**
   npm run develop
   
   El panel de administración estará disponible en http://localhost:1337/admin.

## ☁️ Infraestructura de Producción
El ecosistema fue diseñado para despliegues ágiles en entornos PaaS. La aplicación Node.js/Strapi se orquestó para ser desplegada en **Render**, conectada a una base de datos gestionada de **PostgreSQL**, delegando la persistencia de archivos estáticos a la nube de **Cloudinary** para evitar la pérdida de activos durante los reinicios del servidor.

---
**Arquitectura y Liderazgo Técnico por:** [Sebastián Carrizo Zuleta](https://github.com/SCarrizoZ) | Backend Developer & Cloud Ops Junior
