import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle
{
  width: 1000
  height: 600
  color: "blue"

  Button
  {
    id: button1
    text: "Quick Red Fox"
    anchors.centerIn: parent

    onClicked: { calc.add(1) }

    contentItem: Label {
      id: label1
      text: button1.text
      font.family: "Androido"
    }
  }

  DelayButton
  {
    id: delayButton
    text: "DelayButton"
    anchors.top: button1.bottom
    anchors.topMargin: 5
    anchors.horizontalCenter: parent.horizontalCenter

    delay: 3000

    onActivated: {
      console.log("Delay button activated")
    }
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

    var font_family = label1.font.family
    var fi_family = label1.fontInfo.family
    console.log("button1 requested font family " + font_family + "; actual " + fi_family)
  }

}

