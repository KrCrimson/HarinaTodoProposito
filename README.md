
# HarinaTodoProposito

**HarinaTodoProposito** es un proyecto base en Flutter que integra múltiples servicios de Firebase utilizando las funcionalidades incluidas en la cuenta gratuita de Firebase. Este proyecto está diseñado para ser el punto de partida ideal para desarrolladores que buscan construir aplicaciones modernas y escalables.

---

## 🚀 Funcionalidades Principales

- **Autenticación de Usuarios:**
  - Registro, inicio de sesión y recuperación de contraseñas con email y contraseña.
  - Autenticación con Google y otros proveedores.
- **Base de Datos en Tiempo Real (Firestore):**
  - Lectura y escritura de datos en tiempo real.
  - Ejemplo de estructura de colecciones y documentos.
- **Almacenamiento de Archivos (Firebase Storage):**
  - Carga y visualización de imágenes o documentos.
- **Notificaciones Push (Firebase Cloud Messaging):**
  - Envío de notificaciones personalizadas a dispositivos.
- **Crashlytics:**
  - Monitoreo en tiempo real de errores y caídas de la aplicación.
- **Analytics:**
  - Rastreo de eventos personalizados para medir interacciones del usuario.
- **Hosting (opcional):**
  - Implementación de una versión web de la aplicación.

---

## 🛠️ Requisitos Previos

Antes de comenzar, asegúrate de tener instaladas las siguientes herramientas:

- **Flutter SDK:** Versión estable o beta más reciente.
- **Firebase CLI:** Configurada en tu máquina.
- **Android Studio** o **Visual Studio Code** como entorno de desarrollo.
- Una cuenta de Firebase con un proyecto configurado.

---

## 🔧 Configuración Inicial

1. **Clonar el repositorio:**
   ```bash
   git clone https://github.com/tu-usuario/HarinaTodoProposito.git
   cd HarinaTodoProposito
   ```

2. **Instalar dependencias:**
   ```bash
   flutter pub get
   ```

3. **Configurar Firebase:**
   - Ve al [Firebase Console](https://console.firebase.google.com/).
   - Crea un nuevo proyecto.
   - Agrega las aplicaciones correspondientes (Android, iOS y/o Web).
   - Descarga los archivos de configuración:
     - Para Android: `google-services.json` (colócalo en `android/app`).
     - Para iOS: `GoogleService-Info.plist` (colócalo en `ios/Runner`).

4. **Inicializar Firebase en Flutter:**
   Abre el archivo `main.dart` y verifica que Firebase se inicializa correctamente:
   ```dart
   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
   ```

5. **Habilitar servicios:**
   En la consola de Firebase, activa:
   - Authentication
   - Firestore Database
   - Storage
   - Cloud Messaging

6. **Configurar Android:**
   En el archivo `android/app/build.gradle`, verifica que estén habilitadas las dependencias necesarias:
   ```gradle
   implementation platform('com.google.firebase:firebase-bom:31.0.2')
   ```

---

## 📁 Estructura del Proyecto

```
HarinaTodoProposito/
├── android/                # Archivos nativos de Android
├── ios/                    # Archivos nativos de iOS
├── lib/                    # Código fuente principal de Flutter
│   ├── screens/            # Pantallas de la aplicación
│   ├── services/           # Servicios de Firebase y lógica de negocio
│   ├── widgets/            # Widgets personalizados reutilizables
│   └── main.dart           # Punto de entrada de la aplicación
├── assets/                 # Recursos como imágenes y fuentes
├── pubspec.yaml            # Dependencias y configuración de Flutter
└── README.md               # Documentación del proyecto
```

---

## 🌟 Dependencias Principales

Estas son las dependencias utilizadas en el proyecto. Todas están incluidas en el archivo `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^2.14.0
  firebase_auth: ^5.7.0
  cloud_firestore: ^4.11.0
  firebase_storage: ^12.3.0
  firebase_messaging: ^14.5.0
  flutter_local_notifications: ^13.0.0
```

Ejecuta el siguiente comando para instalar estas dependencias:
```bash
flutter pub get
```

---

## 📚 Guía de Uso

### 1. Autenticación
- **Flujo de registro e inicio de sesión:**
  - Implementado en `lib/screens/auth_screen.dart`.
  - Personaliza los métodos en `lib/services/auth_service.dart`.

### 2. Firestore
- **Ejemplo básico:**
  - Agregar un documento a una colección:
    ```dart
    FirebaseFirestore.instance.collection('usuarios').add({
      'nombre': 'Juan',
      'email': 'juan@ejemplo.com',
    });
    ```

### 3. Almacenamiento
- **Subir un archivo:**
  - Implementado en `lib/services/storage_service.dart`.

### 4. Notificaciones
- **Configurar token:**
  ```dart
  FirebaseMessaging.instance.getToken().then((token) {
    print("Token de notificación: $token");
  });
  ```

---

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Si tienes ideas para mejorar el proyecto, abre un *issue* o envía un *pull request*.

---

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más información.

---

¡Comienza a construir con **HarinaTodoProposito** y lleva tus ideas al siguiente nivel! 🎉
