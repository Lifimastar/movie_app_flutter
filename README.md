# MovieApp - Proyecto de Portafolio en Flutter

¡Una aplicación móvil fluida y bien diseñada para descubrir películas populares, construida con Flutter y una arquitectura profesional!

## 🎬 Demo de la Aplicación

![App Demo](assets/movieapp.gif)

## 🌟 Sobre el Proyecto

Este proyecto es una demostración de mis habilidades en el desarrollo de aplicaciones móviles con Flutter. El objetivo era construir una aplicación funcional desde cero, consumiendo una API pública (TMDB) y siguiendo las mejores prácticas de la industria en cuanto a arquitectura de software y gestión de estado.

## ✨ Características Principales

-   Visualización de las películas más populares del momento.
-   Navegación a una pantalla de detalles para cada película.
-   Interfaz de usuario atractiva con animaciones, incluyendo un `SliverAppBar` colapsable.
-   Manejo de estados de carga, error y datos de forma elegante.
-   Diseño responsive básico para diferentes tamaños de pantalla.

## 🛠️ Stack Tecnológico

-   **Framework:** Flutter 3.x
-   **Lenguaje:** Dart
-   **Arquitectura:** Arquitectura Limpia (simplificada)
-   **Gestión de Estado:** Riverpod
-   **Networking:** Dio (para llamadas a la API REST)
-   **API:** The Movie Database (TMDB)
-   **Seguridad:** flutter_dotenv para la gestión de API Keys.

## 🚀 Cómo Ejecutar el Proyecto

Para clonar y ejecutar este proyecto en tu máquina local, sigue estos pasos:

1.  **Clona el repositorio:**
    ```sh
    git clone https://github.com/Lifimastar/movie_app_flutter.git
    ```
2.  **Navega al directorio del proyecto:**
    ```sh
    cd movie_app_flutter
    ```
3.  **Instala las dependencias:**
    ```sh
    flutter pub get
    ```
4.  **Configura tus variables de entorno:**
    -   Crea un archivo llamado `.env` en la raíz del proyecto.
    -   Añade tu API Key de TMDB de la siguiente manera:
      ```
      TMDB_API_KEY=TU_PROPIA_API_KEY
      ```
5.  **¡Ejecuta la aplicación!**
    ```sh
    flutter run
    ```