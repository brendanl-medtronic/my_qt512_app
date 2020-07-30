project(my_qt512_app)

list(APPEND CMAKE_PREFIX_PATH /opt/qt/5.12.8/5.12.8/gcc_64/lib/cmake)
find_package(Qt5 COMPONENTS Core LinguistTools REQUIRED)
find_package(Qt5QuickCompiler)

set(CMAKE_AUTOMOC ON)
set(SOURCES main.cpp main.qml Calculator.h Calculator.cpp)

qtquick_compiler_add_resources(QRC_FILES main.qrc)
qt5_create_translation(QM_FILES ${SOURCES} english.ts french.ts)

add_executable(${PROJECT_NAME} ${SOURCES} ${QRC_FILES} ${QM_FILES})

qt5_use_modules(${PROJECT_NAME} LINK_PUBLIC Core)
qt5_use_modules(${PROJECT_NAME} LINK_PUBLIC Gui)
qt5_use_modules(${PROJECT_NAME} LINK_PUBLIC Quick)

