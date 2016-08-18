import QtQuick 2.0
import VPlayApps 1.0
//import QtWebView 1.1
import "../components"

PageBase {
  id: webPage
  title: ""

  property string selectedUrl: "http://www.lamayeshe.com/article/meditation-tibetan-buddhism/"
/*
  WebView {
    url: Qt.resolvedUrl(selectedUrl)
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: smallFooter.top
  }
  */
}

