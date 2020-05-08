import QtQuick 2.0
import QtQuick.Controls 2.0

Rectangle
{
  width: 600
  height: 350
  color: "blue"

  Button
  {
    id: button1
    text: "OOOOO"
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
