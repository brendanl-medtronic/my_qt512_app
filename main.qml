import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Shapes 1.12

Rectangle
{
  width: 1000
  height: 600
  color: "blue"

  Shape
  {
    id: shapeSet
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top: parent.top
    anchors.topMargin: 10
    ShapePath {
      id: pauseAudioPath
      strokeWidth: 1
      strokeColor: "white"
      PathSvg {
        path: "M11.85,9l-.7-.71,1.41-1.41.71.7ZM.55,18.92l.71.7,1.41-1.41L2,17.5Zm17-15.55-.71-.7L15.39,4.08l.7.71ZM6.91,12.56l.71.7L9,11.85l-.71-.71ZM19.63,1.25l-.71-.7L17.51,2l.7.71ZM4.06,4.72,4.77,4,3.36,2.6l-.71.71ZM2.65,1.89,1.24.48l-.71.71L1.94,2.6ZM17.49,18.14l1.41,1.42.71-.71-1.42-1.41ZM16.35,17H11.47a1.82,1.82,0,0,1,.41,1.14,1.85,1.85,0,0,1-3.7,0A1.82,1.82,0,0,1,8.59,17H3.87l-.49.49L2.88,17H1.37a1,1,0,0,1-.84-.46,1,1,0,0,1-.07-1c0-.06,2.88-6.27,3.85-8.53a5.54,5.54,0,0,1,.8-1.3l-.34-.33.71-.71L5.79,5A6.14,6.14,0,0,1,9,3.59V1a1,1,0,0,1,2,0V3.59a6.16,6.16,0,0,1,3.29,1.55l.36-.35.71.7-.4.4a5.5,5.5,0,0,1,.7,1.17c.92,2.14,3.76,8.47,3.79,8.54a1,1,0,0,1-.07,1,1,1,0,0,1-.84.46H17.22l-.44.43ZM2.93,15H5.12l-.33-.33L6.2,13.26l.71.71-1,1h8.48l-1.1-1.1L14,13.2l1.41,1.41L15,15H17c-.9-2-2.52-5.64-3.17-7.16A4.08,4.08,0,0,0,10,5.51h0A4.11,4.11,0,0,0,6.15,7.85C5.46,9.46,3.84,13,2.93,15ZM9,8.25,7.6,6.84l-.71.71L8.3,9Zm2.12,3.54,1.41,1.41.71-.71-1.41-1.41ZM9.4,10.06,9,10.44l.71.7.37-.37.31.31.71-.71-.31-.31.33-.33L10.44,9l-.33.33L9.72,9,9,9.67Z"
      }
    }

    ShapePath {
      id: trianglePath
      strokeWidth: 2
      strokeColor: "green"
      startX: -50; startY: 50
      PathLine { x: 130; y: 130 }
      PathLine { x: -50; y: 130 }
      PathLine { x: -50; y: 50 }
    }
  }

  Button
  {
    id: button1
    text: qsTr("quick red fox")
    anchors.centerIn: parent
    width: label1.contentWidth * 1.2

    onClicked: { calc.add(1) }

    contentItem: Rectangle {
      id: rect1
      color: "red"
      Label {
        id: label1
        text: button1.text
        font.family: "Androido"
        color: "white"
        anchors.centerIn: rect1
      }
    }
  }

  DelayButton
  {
    id: delayButton
    text: "DelayButton"
    anchors.top: button1.bottom
    anchors.topMargin: 5
    anchors.horizontalCenter: parent.horizontalCenter

    delay: 5000

    onActivated: {
      console.log("Delay button activated")
    }
  }

  Label
  {
    id: label_kernon
    font.family: "Roboto"
    font.pointSize: 36
    font.weight: Font.Bold
    text: "OpenType kerning ON"
    color: "white"
    anchors.top: delayButton.bottom
    anchors.topMargin: 25
    anchors.horizontalCenter: parent.horizontalCenter
  }

  Label
  {
    id: label_kernoff
    font.family: "Roboto"
    font.kerning: false
    font.pointSize: 36
    font.weight: Font.Bold
    text: "OpenType kerning OFF"
    color: "white"
    anchors.top: label_kernon.bottom
    anchors.left: label_kernon.left
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

