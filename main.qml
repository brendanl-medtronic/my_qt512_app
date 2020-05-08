import QtQuick 2.0
import QtQuick.Controls 2.0

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
}
