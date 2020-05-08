import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Window 2.2

Rectangle
{
  width: 1000
  height: 600
  color: "blue"

  Button
  {
    id: button1
    text: "Quick Red Fox"
    font.family: "Roboto"
    anchors.centerIn: parent

    onClicked: { calc.add(1) }
  }

  Connections
  {
    target: calc

    onTotalChanged: {
      console.log("New total " + calc.total)
    }
  }

  Component.onCompleted: {
    var screens = Qt.application.screens;
      for (var i = 0; i < screens.length; ++i)
        console.log("screen " + i + " \"" + screens[i].name + "\" has geometry " +
                     screens[i].virtualX + ", " + screens[i].virtualY + " " +
                     screens[i].width + "x" + screens[i].height)
  }

}

