import QtQuick 2.0
import MuseScore 3.0
import QtQuick.Dialogs 1.1
import Qt.labs.settings 1.0

MuseScore {
      menuPath: "Plugins.ChordSymbolsStyler"
      description: "This plugin replaces extensions in chord symbols with other extensions of your choice."
      version: "1.1"
      requiresScore: true
      onRun: {
            if (!curScore)
                  Qt.quit();
            
            if ((mscoreMajorVersion < 3) || (mscoreMinorVersion < 3)) {
                  versionError.open();
                  Qt.quit();
            } else if (curScore.selection.elements.length == 0) {
                  selectionError.open();
                  Qt.quit();
            } else if (curScore.selection.elements[0].type != Element.HARMONY){
                  selectionError.open();
                  Qt.quit();
            }else {
                  curScore.startCmd();
                  cmd("select-similar");
                  
                  var elements = curScore.selection.elements;
                  
                  var cursor = curScore.newCursor();
                  cursor.track = 0;
                  
                  console.log(Element.HARMONY, " :Element.HARMONY")
                  var mark = newElement(Element.HARMONY);
                  if (elements.length > 0) {  // We have a selection list to work with...
                        console.log(elements.length, "selections")
                        for (var idx = 0; idx < elements.length; idx++) {
                              var element = elements[idx];
                              if (element.type == Element.HARMONY) {
                                    console.log("Found a chord symbol: ", element.text);
                                    var txt = element.text;
                                    txt = txt.replace("m6", "-6")
                                    txt = txt.replace("m7", "-7")
                                    txt = txt.replace("m9", "-9")
                                    txt = txt.replace("m11", "-11")
                                    txt = txt.replace("Maj7", "maj7")
                                    txt = txt.replace("Maj9", "maj9")
                                    txt = txt.replace("7(b9)", "7b9")
                                    txt = txt.replace("7(#5)", "7#5")
                                    txt = txt.replace("7(b5)", "7b5")
                                    
                                    element.text = txt;
                                    console.log("text replaced with: ", txt);
                              }
                        }
                  }
                  
                  curScore.endCmd();
                  Qt.quit();
            }
      }
            
      MessageDialog {
            id: versionError
            visible: false
            title: qsTr("Unsupported MuseScore version")
            text: qsTr("This plugin needs MuseScore 3.3 or later.")
            onAccepted: {
                  Qt.quit()
            }
      }
      MessageDialog {
            id: selectionError
            visible: false
            title: qsTr("Plugin selection error")
            text: qsTr("Please select a chord symbol before running this plugin.")
            onAccepted: {
                  Qt.quit()
            }
      }
}