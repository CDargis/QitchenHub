# Add more folders to ship with the application, here
folder_01.source = qml/KitchenApp
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# If your application uses the Qt Mobility libraries, uncomment the following
# lines and add the respective components to the MOBILITY variable.
# CONFIG += mobility
# MOBILITY +=

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    voice.cpp \
    translationhandler.cpp

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

OTHER_FILES += \
    qml/KitchenApp/AppInterface.qml \
    qml/KitchenApp/WidgetInterface.qml \
    qml/KitchenApp/Indicator/Indicator.qml \
    qml/KitchenApp/Indicator/AppHint.qml \
    qml/KitchenApp/Organizer/DayItem.qml \
    qml/KitchenApp/Settings/UserSettings.qml \
    qml/KitchenApp/VirtualKeyboard/UniqueKey.qml \
    qml/KitchenApp/Traffic/TrafficWidget.qml \
    qml/KitchenApp/MusicApp/ListItem.qml


RESOURCES += \
    Resources.qrc \
    Languages.qrc

TRANSLATIONS = lang_pl.ts

HEADERS += \
    voice.h \
    translationhandler.h

QT += qml quick

SUBDIRS += qml/KitchenApp/Indicator \
           qml/KitchenApp/Settings
