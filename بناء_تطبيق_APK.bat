@echo off
chcp 65001 >nul
title Mustamskat Android APK Builder
cd /d "%~dp0"
where npm >nul 2>nul
if %errorlevel% neq 0 (
    echo [تنبيه] لبناء ملف APK عبر Capacitor و Gradle، يرجى تثبيت Node.js و Android Studio.
    echo يمكنك أيضاً نقل ملف www\index.html إلى هاتفك الأندرويد وفتحه مباشرة ليعمل كتطبيق مستقل!
    start "" "%~dp0www\index.html"
    pause
    exit /b
)
call npm install
if not exist "android\gradlew.bat" (
    call npx cap add android
)
call npx cap sync android
cd android
call gradlew.bat assembleDebug
pause
