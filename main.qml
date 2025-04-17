import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import io.qt.Backend 1.0

Window {
    visible: true
    width: 900
    minimumWidth: 900
    height: 550
    minimumHeight: 550
    maximumHeight: 550
    maximumWidth: 900
    title: "WAFL WINDOWS"
    color: "white"
    flags: Qt.Window | Qt.WindowMinimizeButtonHint | Qt.WindowMaximizeButtonHint
    property var color_b:"#28B463"
    property var color_b_pressed:"#a6a6a6"
    property var color_b_bounder:"black"


    property string stat: "3"

        Image {
            x:700
            y:15
            id:i_asu
           source: "fesla/iti-logo-clipart-6.jpg"
           width:140; height:100

        }

    // //     //------------------------------------------------------------------------------------------//
        Column {
               spacing: 10
               x:70
               y:460
               id:numbersend
               visible:false

               TextField {
                   id: numberInput
                   placeholderText: "Enter a number"
                   inputMethodHints: Qt.ImhDigitsOnly
                   validator: IntValidator { bottom: 0 }
               }

               Button {
                   text: "Mannual Send    "
                   onClicked: {
                       var number = parseInt(numberInput.text)
                       if (!isNaN(number)) {
                           backend.sendClicked("s" + number.toString())
                       }
                   }
               }
               Button {
                   text: "Automatic Send"
                   onClicked: {
                       var number = parseInt(numberInput.text)
                       if (!isNaN(number)) {
                           backend.sendClicked("t" + number.toString())
                       }
                   }
               }
           }
    // //     /////////////////////////////////////////*exit program(2)//////////////////////////////////////

        Row{
            x:660
            y:460
            Rectangle{
                id:exitprogram
                width:  140
                height: 50
                color: "Red"
                border.color: color_b_bounder
                border.width: 3
                radius: 10

                Image {
                    id:i_exitprogram
                    source: "fesla/exit"

                    anchors.centerIn:exitprogram
                    width: 70
                    height:70
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                    backend.sendClicked(20);
                    ////////////////////////client/////////////////////
                    backend.disconnectClicked();
                    Qt.quit()


                    }

                }
            }
        }

    // //     /////////////////////*selected buttons/////////////////////////////////////////////////////////////////
    // //     ///////////////////////////////////////////////////////////////////////////////////////////////////

        Row {
            id:selected
            x:310
            y:100
            spacing:10
            visible:(receivedMsg=="13" ? true : false);

            Rectangle{
                id: b_autocontrol
                width: 80
                height: 80
                color: color_b
                border.color: color_b_bounder
                border.width: 3
                radius: 5
                Image {
                    id:i_autocontrol
                    source: "fesla/control.png"
                    anchors.centerIn:b_autocontrol
                    width: 60
                    height:60
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {        
                        backend.sendClicked(66);
                        opeartion.visible=true
                        columnlocation.visible=false
                        b_exit1.visible=true
                        b_autocontrol.color=color_b_pressed
                        b_auto_status.color=color_b
                        b_autosetting.color=color_b
                        statuspage.visible=false
                        autosys.visible=true
                        locationsystem.visible=false
                        iuserguide1.visible=false
                        i_location100.visible=false
                        }
                    }
            }
            Rectangle{
                id: b_location
                width: 80
                height: 80
                color: color_b
                border.color: color_b_bounder
                border.width: 3
                radius: 5
                Image {
                    id:i_location
                    source: "fesla/route.png"
                    anchors.centerIn:b_location
                    width: 60
                    height:60
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        opeartion.visible=false
                        b_autocontrol.visible=false
                        columnlocation.visible=true
                        b_exit1.visible=true
                        b_location.color=color_b_pressed
                        b_autocontrol.color=color_b
                        b_auto_status.color=color_b
                        b_autosetting.color=color_b
                        b_location1.visible=true
                        b_location2.visible=true
                        b_location1.color=color_b
                        b_location2.color=color_b
                        statuspage.visible=false
                        autosys.visible=false
                        locationsystem.visible=true
                        i_location100.visible=false
                        i_location100.visible=true
                        backend.sendClicked(64);
                        }
                    }
            }

            Rectangle{
                id: b_auto_status
                width: 80
                height: 80
                color: color_b
                border.color: color_b_bounder
                border.width: 3
                radius: 5
                Image {
                    id:i_auto_status
                    source: "fesla/project-status.png"
                    anchors.centerIn:b_auto_status
                    width: 60
                    height:60
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                         backend.sendClicked(62);
                        animationr2.visible=false
                        b_exit1.visible=false
                        b_auto_status.color=color_b_pressed
                        b_autocontrol.color=color_b
                        b_autosetting.color=color_b
                        statuspage.visible=true
                        autosys.visible=false
                        locationsystem.visible=false
                        i_location100.visible=false
                        }
                    }
            }
            Rectangle{
                visible:false
                id: b_autosetting
                width: 80
                height: 100
                color: color_b
                border.color: color_b_bounder
                border.width: 3
                radius: 5
                Image {
                    id:i_autosetting
                    source: "fesla/settings.png"
                    anchors.centerIn:b_autosetting
                    width: 60
                    height:60
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        statuspage.visible=false
                        autosys.visible=false
                        }
                    }
            }
          }

        Rectangle {
            width: animation.width; height: animation.height + 8
            x:310
            y:350
            id:animationr
            visible:false

            AnimatedImage { id: animation; source: "fesla/Animation - 1714293498656.gif" }

            Rectangle {
                property int frames: animation.frameCount

                width: 1; height: 0
                x: (animation.width - width) * animation.currentFrame / frames
                y: animation.height
                color: "red"
            }}
        Rectangle {
            width: animation1.width; height: animation1.height + 8
            x:200
            y:200
            id:animationr2
            visible:false

            AnimatedImage { id: animation1; source: "fesla/Animation - 1714298250097.gif" }

            Rectangle {
                property int frames: animation1.frameCount

                width: 16; height: 32
                x: (animation1.width - width) * animation1.currentFrame / frames
                y: animation1.height
                color: "red"
            }}
      ////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////////
      //////////////////*Autonomous systems/////////////////////////////////////////////////////
        Rectangle{
            id:autosys
            visible:false
    ////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////
    //////////////////*operation systems/////////////////////////////////////////////////////

        Column{
            id: opeartion
            x:100
            y:130
            spacing:20
            visible: false
            Rectangle{
                id: b_power
                width: 80
                height: 80
                color: "#00ff00"
                border.color: color_b_bounder
                border.width: 3
                radius: 20
                Image {
                    id:i_power
                    source: "fesla/power.png"
                    anchors.centerIn:b_power
                    width: 60
                    height:60
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        b_power.color=color_b_pressed
                        b_stop.color="Red"
                        b_reboot.color=color_b
                        b_normalmode.visible=true
                        b_qrcodemode.visible=true
                        b_exit1.visible=false
                        mode.visible=true
                        i_stop_state.visible=false
                        b_power.visible=false
                        b_path.color="green"
                        b_localization.color="green"
                        b_control.color="green"
                        b_vision.color="green"
                        backend.sendClicked(55);
                        }

                    }
            }
            Rectangle{
                id: b_stop
                width: 80
                height: 80
                color: "Red"
                border.color: color_b_bounder
                border.width: 3
                radius: 20
                Image {
                    id:i_stop
                    source: "fesla/stop-button.png"
                    anchors.centerIn:b_stop
                    width: 60
                    height:60
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        mode.visible=false
                        b_power.color="#00ff00"
                        b_stop.color=color_b_pressed
                        b_reboot.color=color_b
                        b_normalmode.color=color_b
                        b_qrcodemode.color=color_b
                        b_normalmode.visible=false
                        b_qrcodemode.visible=false
                        b_stop.color=color_b_pressed
                        b_exit1.visible=true
                        animationr.visible=false
                        i_stop_state.visible=true
                        b_power.visible=true
                        b_path.color="red"
                        b_localization.color="red"
                        b_control.color="red"
                        b_vision.color="red"
                        backend.sendClicked(56);
                      }

                    }
            }
            Rectangle{
                id: b_reboot
                width: 80
                height: 80
                color: color_b
                border.color: color_b_bounder
                border.width: 3
                radius: 20
                Image {
                    id:i_reboot
                    source: "fesla/reboot.png"
                    anchors.centerIn:b_reboot
                    width: 60
                    height:60
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        mode.visible=true
                        b_power.color="#00ff00"
                        b_stop.color="Red"
                        b_reboot.color=color_b_pressed
                        b_normalmode.color=color_b
                        b_qrcodemode.color=color_b
                        b_normalmode.visible=true
                        b_qrcodemode.visible=true
                        b_exit1.visible=false
                        i_stop_state.visible=false
                        animationr.visible=false
                        b_power.visible=true
                        b_path.color="green"
                        b_localization.color="green"
                        b_control.color="green"
                        b_vision.color="green"
                        backend.sendClicked(57);

                      }

                    }
            }
          }
        ///////////////////////////////////////////////*modebutton//////////////////////////////////////
         ////////////////////////////////////////////////////////////////////////////////////////////////
         Row{
           id:mode
            x:300
            y:200
            spacing: 50
            visible:false
            Rectangle{
                id: b_normalmode
                width: 100
                height: 130
                color: color_b
                border.color: color_b_bounder
                border.width: 1
                radius: 5
                Image {
                    id:i_normalmode
                    source: "fesla/solution.png"
                    anchors.centerIn:b_normalmode
                    width: 60
                    height:60
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        b_normalmode.color="#00ff00"
                        animationr.visible=true
                        b_qrcodemode.visible=false
                        backend.sendClicked(59);
                        }
                    }
            }

            Rectangle{
                id: b_qrcodemode
                width: 100
                height: 130
                color: color_b
                border.color: color_b_bounder
                border.width: 1
                radius: 5
                Image {
                    id:i_qrcodemode
                    source: "fesla/box.png"
                    anchors.centerIn:b_qrcodemode
                    width: 60
                    height:60
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        //console.log("Clicked")
                       // i_forklift.visible=true
                       // i_way.visible=true
                        b_normalmode.visible=false
                        animationr.visible=true
                        //backend.sendClicked(15);
                        b_qrcodemode.color="#00ff00"
                        backend.sendClicked(60);

                        }

                    }
            }


         }

        Image{
            id:i_stop_state
            visible:false
           x:300
           y:200
           source: "fesla/stop.png"
           width:100
           height:100

        }}
    //     /////////////////////////////////////////////////////////////////////////////////////////////////
    //     //////////////////////////////////////////////////////////////////////////////////////////////////
    //     /////////////////////////////////////////*home page//////////////////////////////////////////////
        function performActions() {
               // home1.visible =false
               // home2.visible =false
               // manual_page.visible =false
               // text_normal.visible=false
               // text_GOAL.visible=false
               // text_QRGOAL.visible=false
               // b_exit1.visible=true
               // manual_page.visible=false
               // title30.visible=true
               // manual.visible=true
               // backend.sendClicked(21);
           }
        Rectangle{
            id:total
            //visible: (receivedMsg=="12" ? false : true);
            visible: false

        Rectangle{
            id:manual_page
            x:650
            y:220
            width: 200
            height: 130
            border.color: color_b_bounder
            radius: 60
            color: "White"
            border.width: 3
            visible: (receivedMsg=="13" ? false : true);
            Image {
                id:i_manual
                source: "fesla/OIP.jpeg"
                anchors.centerIn:manual_page
                width: 100
                height:100
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    // home1.visible =false
                    // home2.visible =false
                    // manual_page.visible =false
                    // text_normal.visible=false
                    // text_GOAL.visible=false
                    // text_QRGOAL.visible=false
                    // b_exit1.visible=true
                    // manual_page.visible=false
                    // title30.visible=true
                    // manual.visible=true
                    // backend.sendClicked(21);
                    addsetting.visible=true
                    home1.visible=false
                    home2.visible=false
                    displayparts.visible=true
                    df.visible=true
                    numbersend.visible=true

                  }

                }
            Timer {
                    interval: 1000
                    running: true
                    repeat: true
                    onTriggered: {
                        if (receivedMsg == "21") {
                            performActions();
                        }
                    }
                }
        }





        //stat:msg.data

        Row{
            x:80
            y:100
            spacing:80
            id:home1

        Rectangle{
            id: b_autonomous
            width:  200
            height: 130
            color: color_b
                //(msg == "4" ? "Red" : "White")
                //( stat=="4" ? "#8fe197" : "#c08fe1")


            border.color: color_b_bounder
            border.width: 3
            radius: 20
            Image {
                id:i_autonomous
                source: "fesla/start.png"
                anchors.centerIn:b_autonomous
                width: 120
                height:120
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    //console.log("Clicked")
                   //  opeartion.visible=true
                   //  b_location.visible=false

                   //  columnlocation.visible=false
                   //  b_exit1.visible=true
                    b_autonomous.color=color_b_pressed
                    b_location6.color="red"
                   b_userguide2.color=color_b

                    b_qrcode2.color=color_b

                   //  b_auto_status.color=color_b
                   //  b_autosetting.color=color_b

                   // // b_location.color=color_b
                   //  home1.visible=false
                   //  home2.visible=false
                   //  selected.visible=true
                   //  text_normal.visible=false

                   //  //statuspage.visible=false
                   //  locationsystem.visible=false
                   //  autosys.visible=true
                   //  iuserguide1.visible=false
                   //  text_GOAL.visible=false
                   //  text_QRGOAL.visible=false
                   //  manual_page.visible=false
                    //b_location.visible=false
                    backend.sendClicked(50);




                  }

                }
        }
        Rectangle{
            id: b_location6
            width:  200
            height: 130
            color: "Red"
            border.color: color_b_bounder
            border.width: 3
            radius: 20
            Image {
                id:i_location6
                source: "fesla/stop.png"
                //anchors.centerIn:b_location6
                x:60
                y:20
                width: 80
                height:80
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    //console.log("Clicked")
                  //   opeartion.visible=false
                  //   b_autocontrol.visible=false

                  //   columnlocation.visible=true
                  //   b_exit1.visible=true
                     b_location6.color=color_b_pressed
                     b_userguide2.color=color_b
                    b_autonomous.color=color_b

                    b_qrcode2.color=color_b


                  //   b_auto_status.color=color_b
                  //   b_autosetting.color=color_b
                  //  // b_userguide.color=color_b
                  //   b_location1.visible=true
                  //   b_location2.visible=true
                  //   b_location1.color=color_b
                  //   b_location2.color=color_b
                  //   home1.visible=false
                  //   home2.visible=false
                  //   selected.visible=true
                  //   text_normal.visible=false
                  //   //statuspage.visible=false
                  //   locationsystem.visible=true
                  //   autosys.visible=false
                  //   iuserguide1.visible=false
                  //   text_GOAL.visible=false
                  //   text_QRGOAL.visible=false
                  //   manual_page.visible=false
                  //   b_autocontrol.visible=false
                  //   b_location.visible=true
                    backend.sendClicked(51);




                  }

                }
        }
      }
        Text{
            id: text_normal
           // anchors.centerIn: parent
            x:120
            y:200


          //  text: "NORMAL"
            }

        Text{
            id: text_GOAL

           // anchors.centerIn: parent
            x:400
            y:205
            //visible:true


            //text: "FIXED LOCATIONS"
            }

        Image {
            id:i_qrcodetarget
            source: "fesla/scan.png"
            visible:false
            x:220
            y:80

            width: 250
            height:250
        }
        Text{
            id:i_codemode
           // text:"Hold Your QR Code In Front Of Camera"
            x:215
            y:330
            visible:false

        }

        Row{
            x:80
            y:300
            spacing:80
            id:home2
        Rectangle{
            id: b_qrcode2
            width:  200
            height: 130
            color: color_b
            border.color: color_b_bounder
            border.width: 3
            radius: 20
            Image {
                id:i_setting2
                source: "fesla/process.png"
               // anchors.centerIn:b_qrcode2
                x:60
                y:20
                width: 80
                height:80
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    //console.log("Clicked")
                  //   i_qrcodetarget.visible=true
                  //   home1.visible=false
                  //   home2.visible=false
                  //   b_exit1.visible =true
                  //   //i_siemens.visible=false
                  //  // i_asu.visible=false
                    b_qrcode2.color=color_b_pressed
                    b_location6.color="red"
                     b_userguide2.color=color_b
                    b_autonomous.color=color_b
                  //   text_normal.visible=false
                  //   //statuspage.visible=false
                  //   locationsystem.visible=false
                  //   autosys.visible=false
                  //   iuserguide1.visible=false
                  //   text_GOAL.visible=false
                  //   text_QRGOAL.visible=false
                  //   i_codemode.visible=true
                  // //  backend.sendClicked(19);
                  //   manual_page.visible=false
                    backend.sendClicked(52);



                  }

                }
        }
        Rectangle{
            id: b_userguide2
            width:  200
            height: 130
            color: color_b
            border.color: color_b_bounder
            border.width: 3
            radius: 20
            Image {
                id:b_userguide3
                source: "fesla/emergency-stop.png"
                anchors.centerIn:b_userguide2
                width: 120
                height:120
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    //console.log("Clicked")

                   //  b_exit1.visible=true
                   //  home1.visible=false
                   //  home2.visible=false

                   //  i_siemens.visible=false
                   //  i_asu.visible=false
                   //  text_normal.visible=false
                   //  //statuspage.visible=false
                   //  locationsystem.visible=false
                   //  autosys.visible=false
                   // iuserguide1.visible=true
                   //  text_GOAL.visible=false
                   //  text_QRGOAL.visible=false
                   //  manual_page.visible=false
                    backend.sendClicked(53);
                    b_userguide2.color=color_b_pressed
                    b_qrcode2.color=color_b
                    b_location6.color="red"
                    b_autonomous.color=color_b





                  }

                }
        }

            }
        Text{
            id: text_QRGOAL

           // anchors.centerIn: parent
            x:150
            y:405
            visible:true


            //text: "QR GOAL"




        }}






        //////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////*Location System/////////////////////////////////////
        Image {
            id:i_location100
            visible: false
            source: "fesla/maps.png"
            x:390
            y:200
            width:120
            height:120
        }
        Rectangle{
             id:locationsystem
             visible:false
        Column{
            id: columnlocation
            x:170
            y:150
            spacing:10


            visible: false
            Rectangle{
                id: b_power2
                width: 80
                height: 80
                color: "#00ff00"
                border.color: color_b_bounder
                border.width: 3
                radius:20
                Image {
                    id:i_power2
                    source: "fesla/power.png"
                    anchors.centerIn:b_power2
                    width: 60
                    height:60
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        //console.log("Clicked")

                        b_power2.color=color_b_pressed
                       // backend.sendClicked(16);
                        b_path.color="green"
                        b_localization.color="green"
                        b_control.color="green"
                        b_vision.color="green"

                       backend.sendClicked(61);





                        }

                    }
            }


            Rectangle{
                id: b_location1
                width: 80
                height: 80
                color: color_b
                border.color: color_b_bounder
                border.width: 3
                radius: 20
                Image {
                    id:i_location1
                    source: "fesla/letter-m.png"
                    anchors.centerIn:b_location1
                    width: 60
                    height:60
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        //console.log("Clicked")
                        b_location1.color=color_b_pressed
                        b_location2.color=color_b

                        b_location2.visible=false

                        i_location100.visible=true
                       // backend.sendClicked(17);
                        backend.sendClicked(65);


                        }

                    }
            }
            Rectangle{
                id: b_location2
                width: 80
                height: 80
                color: color_b
                border.color: color_b_bounder
                border.width: 3
                radius: 20
                Image {
                    id:i_location2
                    source: "fesla/letter-n.png"
                    anchors.centerIn:b_location2
                    width: 60
                    height:60
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        //console.log("Clicked")
                        b_location1.color=color_b
                        b_location2.color=color_b_pressed

                        b_location1.visible=false

                        i_location100.visible=true
                      //  backend.sendClicked(18);

                      }

                    }


            }

          }}




        /////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////*status//////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////////////////////
        Rectangle{
           id:currentTi
           width: 50
           height: 50
           x:190
           y:450
           color:(backend.currentStatus ? "Green" : "Red");
           radius:80
        }
        Rectangle
        {
            id:statuspage
            visible:(receivedMsg=="13" ? true : false);

          Column{
            id:packwork
             x:180
             y:220
             spacing: 10

             Rectangle{
                 id: b_pack
                 width: 90
                 height: 50
                 color: "grey"
                 border.color: "black"
                 border.width: 1
                 radius: 10
                 Image {
                     id:i_b_pack
                     source: "fesla/autopilot.png"
                     anchors.centerIn:b_pack
                     width: 40
                     height:40
                 }
                 MouseArea{
                     anchors.fill: parent
                     onClicked: {
                         }

                     }
             }
             Rectangle{
                 id: b_path
                 width: 90
                 height: 50

                 color: "Red"
                 border.color: "black"
                 border.width: 1
                 radius: 5
                 Image {
                     id:i_path
                     source: "fesla/pathway.png"
                     anchors.centerIn:b_path
                     width: 40
                     height:40
                 }
                 MouseArea{
                     anchors.fill: parent
                     onClicked: {
                         }

                     }

                 Timer {
                         interval: 1000
                         running: true
                         repeat: true
                         onTriggered: {
                             if (receivedMsg == "41") {
                                b_path.color="Red"
                             }
                             if (receivedMsg == "42") {
                                b_path.color="Green"
                             }
                         }
                     }

             }
             Rectangle{
                 id: b_vision
                 width: 90
                 height: 50
                 color: (receivedMsg=="3" ? "Green": "Red");
                 border.width: 1
                 radius: 5
                 Image {
                     id:i_qrcodemode2
                     source: "fesla/view.png"
                     anchors.centerIn: b_vision
                     width: 40
                     height:40
                 }
                 MouseArea{
                     anchors.fill: parent
                     onClicked: {
                         }
                     }
             }
             Rectangle{
                 id: b_localization
                 width: 90
                 height: 50
                 color: (receivedMsg=="3" ? "Green": "Red");
                 border.width: 1
                 radius: 5
                 Image {
                     id:i_localization
                     source: "fesla/location.png"
                     anchors.centerIn: b_localization
                     width: 40
                     height:40
                 }
                 MouseArea{
                     anchors.fill: parent
                     onClicked: {
                         }
                     }
             }
             Rectangle{
                 id: b_control
                 width: 90
                 height: 50
                 color: (receivedMsg=="3" ? "Green": "Red");
                 border.width: 1
                 radius: 5
                 Image {
                     id:i_control
                     source: "fesla/access-control.png"
                     anchors.centerIn: b_control
                     width: 40
                     height:40
                 }
                 MouseArea{
                     anchors.fill: parent
                     onClicked: {
                         }

                     }
             }


          }
          Image {
                id:i_vertical_line
                source: "fesla/line.png"
                x:260
                y:220


                width: 60
                height:300
                   }
          Column{
              x:350
              y:220
              spacing:20

          Row{


              spacing:20
              Rectangle{
                  id: b_unloading
                  width: 80
                  height: 80
                  color:(receivedMsg=="5" ? "Green": "Red");
                  border.width: 1
                  radius: 5
                  Image {
                      id:i_unloading
                      source: "fesla/container(1).png"
                      anchors.centerIn: b_unloading
                      width: 60
                      height:60
                  }
                  MouseArea{
                      anchors.fill: parent
                      onClicked: {
                          }

                      }
              }
              Rectangle{
                  id: b_loading
                  width: 80
                  height: 80
                  color:(receivedMsg=="6" ? "Green": "Red");
                  border.width: 1
                  radius: 5
                  Image {
                      id:i_loading
                      source: "fesla/container.png"
                      anchors.centerIn: b_loading
                      width: 60
                      height:60
                  }
                  MouseArea{
                      anchors.fill: parent
                      onClicked: {
                          }

                      }
              }
          }
          Row{



              spacing:20
              Rectangle{
                  id: b_speed
                  width: 80
                  height: 80
                  color: "Gray"
                  border.width: 1
                  radius: 5
                  Image {
                      id:i_speed
                      source: "fesla/speedometer.png"
                      anchors.centerIn: b_speed
                      width: 40
                      height:40
                  }
                  MouseArea{
                      anchors.fill: parent
                      onClicked: {
                          }

                      }
              }
              Rectangle{
                  id: b_speed2
                  width: 80
                  height: 80
                  color: "Gray"
                  border.width: 1
                  radius: 5
                  // Text {
                  //   anchors.centerIn: b_speed2
                  //   text:
                  //         "" + (mySubscriber.message ? mySubscriber.message.data+"m/s": "unknown") + "\n"
                  // }

                  MouseArea{
                      anchors.fill: parent
                      onClicked: {
                          }

                      }
              }
          }
          Row{

              spacing:20
              Rectangle{
                  id: b_camera
                  width: 80
                  height: 80
                  color: "Gray"
                  border.width: 1
                  radius: 5
                  Image {
                      id:i_camera
                      source: "fesla/objects.png"
                      anchors.centerIn: b_camera
                      width: 40
                      height:40
                  }
                  MouseArea{
                      anchors.fill: parent
                      onClicked: {
                          }

                      }
              }
              Rectangle{
                  id: b_camera2
                  width: 80
                  height: 80
                  color: "Gray"
                  border.width: 1
                  radius: 5
                  // Text {
                  //   anchors.centerIn: b_camera2
                  //   text:
                  //         "" + (mySubscriber.message ? mySubscriber.message.data +"m": "unknown") + "\n"
                  // }

                  MouseArea{
                      anchors.fill: parent
                      onClicked: {
                          }

                      }
              }
          }
          }





          Image {
                id:i_vertical_line2
                source: "fesla/line.png"
                x:550
                y:220
                width: 60
                height:300
                   }

          Column{
            id:status
            x:600
            y:220
             spacing: 40
             Row{
                spacing: 20

             Rectangle{
                 id: status1
                 width: 80
                 height: 80
                 color: (receivedMsg=="7" ? "Green": "Red");
                 border.color: "black"
                 border.width: 1
                 radius: 10
                 Image {
                     id:i_status1
                     source: "fesla/process.png"
                     anchors.centerIn:status1
                     width: 60
                     height:60
                 }
                 MouseArea{
                     anchors.fill: parent
                     onClicked: {
                         }

                     }
             }
             Rectangle{
                 id: status2
                 width: 80
                 height: 80
                 color: (receivedMsg=="8" ? "Green": "Red");
                 border.color: "black"
                 border.width: 1
                 radius: 10
                 Image {
                     id:i_status2
                     source: "fesla/work-in-progress.png"
                     anchors.centerIn:status2
                     width: 60
                     height:60
                 }
                 MouseArea{
                     anchors.fill: parent
                     onClicked: {
                         }

                     }
             }}
             Row{
                spacing: 20

             Rectangle{
                 id: status3
                 width: 80
                 height: 80
                 color: (receivedMsg=="9" ? "Green": "Red");
                 border.color: "black"
                 border.width: 1
                 radius: 10
                 Image {
                     id:i_status3
                     source: "fesla/undo.png"
                     anchors.centerIn:status3
                     width: 60
                     height:60
                 }
                 MouseArea{
                     anchors.fill: parent
                     onClicked: {
                         }

                     }
             }
             Rectangle{
                 id: status4
                 width: 80
                 height: 80
                 color: (receivedMsg=="10" ? "Green": "Red");
                 border.color: "black"
                 border.width: 1
                 radius: 10
                 Image {
                     id:i_status4
                     source: "fesla/arrival.png"
                     anchors.centerIn:status4
                     width: 60
                     height:60
                 }
                 MouseArea{
                     anchors.fill: parent
                     onClicked: {
                         }

                     }
             }}

          }
          }

        /////////////////////////////////////////////last status mode//////////////////////////////////////
        //////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////**numberpad//////////////////////////////////////////////////////////

        ColumnLayout {
                id: calculatorLayout
                anchors.centerIn: parent
                spacing: 10

                RowLayout {
                    spacing: 10
                    Rectangle {
                        width: 60
                        height: 60
                        color: "lightgray"
                        radius: 5
                        border.color: "gray"
                        border.width: 1
                        Text {
                            text: "1"
                            anchors.centerIn: parent
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("Button 1 clicked")
                            }
                        }
                    }
                    Rectangle {
                        width: 60
                        height: 60
                        color: "lightgray"
                        radius: 5
                        border.color: "gray"
                        border.width: 1
                        Text {
                            text: "2"
                            anchors.centerIn: parent
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("Button 2 clicked")
                            }
                        }
                    }
                    Rectangle {
                        width: 60
                        height: 60
                        color: "lightgray"
                        radius: 5
                        border.color: "gray"
                        border.width: 1
                        Text {
                            text: "3"
                            anchors.centerIn: parent
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("Button 3 clicked")
                            }
                        }
                    }
                }

                RowLayout {
                    spacing: 10
                    Rectangle {
                        width: 60
                        height: 60
                        color: "lightgray"
                        radius: 5
                        border.color: "gray"
                        border.width: 1
                        Text {
                            text: "4"
                            anchors.centerIn: parent
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("Button 4 clicked")
                            }
                        }
                    }
                    Rectangle {
                        width: 60
                        height: 60
                        color: "lightgray"
                        radius: 5
                        border.color: "gray"
                        border.width: 1
                        Text {
                            text: "5"
                            anchors.centerIn: parent
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("Button 5 clicked")
                            }
                        }
                    }
                    Rectangle {
                        width: 60
                        height: 60
                        color: "lightgray"
                        radius: 5
                        border.color: "gray"
                        border.width: 1
                        Text {
                            text: "6"
                            anchors.centerIn: parent
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("Button 6 clicked")
                            }
                        }
                    }
                }

                RowLayout {
                    spacing: 10
                    Rectangle {
                        width: 60
                        height: 60
                        color: "lightgray"
                        radius: 5
                        border.color: "gray"
                        border.width: 1
                        Text {
                            text: "7"
                            anchors.centerIn: parent
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("Button 7 clicked")
                            }
                        }
                    }
                    Rectangle {
                        width: 60
                        height: 60
                        color: "lightgray"
                        radius: 5
                        border.color: "gray"
                        border.width: 1
                        Text {
                            text: "8"
                            anchors.centerIn: parent
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("Button 8 clicked")
                            }
                        }
                    }
                    Rectangle {
                        width: 60
                        height: 60
                        color: "lightgray"
                        radius: 5
                        border.color: "gray"
                        border.width: 1
                        Text {
                            text: "9"
                            anchors.centerIn: parent
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("Button 9 clicked")
                            }
                        }
                    }
                }

                RowLayout {
                    spacing: 10
                    Rectangle {
                        width: 60
                        height: 60
                        color: "lightgray"
                        radius: 5
                        border.color: "gray"
                        border.width: 1
                        Text {
                            text: "0"
                            anchors.centerIn: parent
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("Button 0 clicked")
                            }
                        }
                    }
                    Rectangle {
                        width: 60
                        height: 60
                        color: "lightgray"
                        radius: 5
                        border.color: "gray"
                        border.width: 1
                        Text {
                            text: "Enter"
                            anchors.centerIn: parent
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("Enter button clicked")
                                total.visible=true;
                                calculatorLayout.visible=false;
                            }
                        }
                    }
                    Rectangle {
                        width: 60
                        height: 60
                        color: "lightgray"
                        radius: 5
                        border.color: "gray"
                        border.width: 1
                        Text {
                            text: "clear"
                            anchors.centerIn: parent
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {

                            }
                        }
                    }
                }
            }








        /////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////*return button//////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////////////////////
        Rectangle{
            x:300
            y:480
            id: b_exit1
            width: 100
            height: 50
            color: "gray"
            visible: false
            border.color: "black"
            border.width: 1
            radius: 20

            Image {
                id:i_exit_1
                source: "fesla/return.png"
                anchors.centerIn:b_exit1
                width: 40
                height:40
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    //console.log("Clicked")
                    backend.sendClicked(54);

                    b_exit1.visible= false
                    columnlocation.visible=false
                    opeartion.visible=false

                    b_autocontrol.visible=true
                   // b_location.visible=true


                    b_autocontrol.color=color_b
                    b_auto_status.color=color_b
                    b_autosetting.color=color_b
                  //  b_location.color=color_b

                    // i_way.visible=false
                    mode.visible=false

                    b_location1.visible=false
                    b_location2.visible=false
                    b_location1.color=color_b
                    b_location2.color=color_b
                    animationr.visible=false

                    b_reboot.color=color_b

                    animation1.visible=false
                    selected.visible=false
                    home1.visible=true
                    home2.visible=true

                    i_siemens.visible=true
                    i_asu.visible=true
                    i_qrcodetarget.visible=false
                    i_stop_state.visible=false
                    text_normal.visible=true
                    //statuspage.visible=false
                    iuserguide1.visible=false
                   i_location100.visible=false
                    b_power2.color="red"
                    text_GOAL.visible=true
                    text_QRGOAL.visible=true
                    i_codemode.visible=false
                   // backend.sendClicked(12);
                    manual_page.visible=true
                    title30.visible=false
                    manual.visible=false
                    statuspage.visible=false
                    total.visible=true








                  }

                }


        }


        //////////////////////////////////////////////////////////////////////////////////////////////
        //////////////////////////////////////////////////////////////////////////////////////////////
        //////////////////////////////////////////////////////////////////////////////////////////////
        //////////////////////////////////////////////////////////////////////////////////////////////
        //////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////*user guide(1) mode(home)////////////////////////

        Image {
            id:iuserguide1
            source: "fesla/Userguide(1).jpeg"


            visible:false
            x:50

            width: 800
            height:350
        }






        ////////////////////////////////botteam////////////////////////////////////////////////////////
        Rectangle{
            x:680
            y:430
            id: button51
            width: 100
            height: 10
           // color: "#b3b300"
            radius: 40
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    //console.log("Clicked")
                    }

                }
            Text{
                id: textId51
                anchors.centerIn: parent

                text: "Final Project Introduction To PLC Course
        Submitted To: Eng Mannar 🌹🌹"
                }
            }
        ///////////////////////////////////////////////////////////////////*Lights//////////////////////////////////////////////////
        Column{
            id: title30
            x:670
            y:140
            spacing:20
            visible:false
            Rectangle{

                id: button30
                width: 80
                height: 80
                color: "#cc8a00"
                border.color: "black"
                border.width: 1
                radius: 30
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                        backend.sendClicked(8);

                        if(textId30.text=="OFF"){
                        textId30.text="ON"
                        button30.color="#fff2d7"
                        }
                        else{
                        textId30.text="OFF"
                        button30.color="#cc8a00"

                        }
                        //console.log("Clicked ")


                    }
                    }
                Text{
                    id: textId30

                    anchors.topMargin:100
                    text: "OFF"
                    }
                Image {
                    id:i_frontlight
                    source: "fesla/headlamp.png"
                    anchors.centerIn:button30
                    width: 60
                    height:60
                }
                }
            Rectangle{

                id: button31
                width: 80
                height: 80
                color: "#cc8a00"
                border.color: "black"
                border.width: 1
                radius: 30
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        backend.sendClicked(9);
                        if(textId31.text=="OFF"){
                        textId31.text="ON"
                        button31.color="#fff2d7"
                        }
                        else{
                        textId31.text="OFF"
                        button31.color="#cc8a00"

                        }
                        //console.log("Clicked ")


                    }
                    }
                Text{
                    id: textId31
                    anchors.bottomMargin:10
                    text:"OFF"
                    }
                Image {
                    id:i_sidelight
                    source: "fesla/car.png"
                    anchors.centerIn:button31
                    width: 60
                    height:60
                }
                }

            Rectangle{

                id: button32
                width: 80
                height: 80
                color: "#cc8a00"
                border.color: "black"
                border.width: 1
                radius: 30
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        backend.sendClicked(10);
                        if(textId32.text=="OFF"){
                        textId32.text="ON"
                        button32.color="#fff2d7"

                        }
                        else{
                        textId32.text="OFF"
                        button32.color="#cc8a00"

                        }
                        //console.log("Clicked ")

                    }
                    }
                Text{
                    id: textId32
                    anchors.bottomMargin:10
                    text: "OFF"
                    }
                Image {
                    id:i_backlight
                    source: "fesla/back-light.png"
                    anchors.centerIn:button32
                    width: 60
                    height:60
                }
                }
        }
        ////////////////////////////////////////Front& back///////////////////////////
        Rectangle{
            id:manual
            visible:false
            Rectangle{
                x:80
                y:300

                id: button40
                width: 200
                height: 50
                color: "#cc8a00"
                border.color: "black"
                border.width: 5
                radius: 30
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                   //console.log("Clicked ")
                    }
                    }
                Text{
                    id: textId40
                    anchors.centerIn: parent
                    text: "Speed: unknown"
                    }
                }
        Rectangle{
            x:400
            y:100
            id: button24
            width: 80
            height: 80
            color: "#009900"
            border.color: "black"
            border.width: 5
            radius: 30
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    backend.sendClicked(1);
                    textId40.text="Speed: 50%"
                    flag1=1
                }
                }

            Image {
                id:i_frontm
                source: "fesla/up-arrow.png"
                anchors.centerIn:button24
                width: 60
                height:60
            }
            }
        Rectangle{
            x:400
            y:300
            id: button25
            width: 80
            height: 80
            color: "#009900"
            border.color: "black"
            border.width: 5
            radius: 30
            MouseArea{
                anchors.fill: parent // Telling the MouseArea element to fill the rectangle that contains it.
                onClicked: {
                    backend.sendClicked(3);
                    textId40.text="Speed: 50%"

                }
                }
            Image {
                id:i_backm
                source: "fesla/down-arrow.png"
                anchors.centerIn:button25
                width: 60
                height:60
            }
            }
        Row{

            x:50
            y:100
            spacing:10

            Rectangle{
                id: button27
                width: 100
                height: 100
                color: "#cc8a00"
                border.color: "black"
                border.width: 5
                radius: 15
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        textId40.text="Speed: 100%"
                        backend.sendClicked(7);
                    }
                    }
                Image {
                    id:i_speedupm
                    source: "fesla/level-up.png"
                    anchors.centerIn:button27
                    width: 60
                    height:60
                }

                }
            Rectangle{
                id: button28
                width: 100
                height: 100
                color: "#cc8a00"
                border.color: "black"
                border.width: 5
                radius: 15
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        textId40.text="Speed: 25%"
                        backend.sendClicked(6);
                    }
                    }
                Image {
                    id:i_speeddownm
                    source: "fesla/down-arrow(1).png"
                    anchors.centerIn:button28
                    width: 60
                    height:60
                }
                }
        }
        Row{
            x:300
            y:200
            spacing: 20

            Rectangle{
                id: button20
                width: 80
                height: 80
                color: "#009900"
                border.color: "black"
                border.width: 5
                radius: 15
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        backend.sendClicked(5);
                        }

                    }

                Image {
                    id:i_leftm
                    source: "fesla/back.png"
                    anchors.centerIn:button20
                    width: 60
                    height:60
                }


                }
            Rectangle{
                id: button21
                width: 80
                height: 80
                color: "#009900"
                border.color: "black"
                border.width: 5
                radius: 15
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        backend.sendClicked(2);
                        textId40.text="Speed:0%-Bracking"
                        }

                    }
                Image {
                    id:i_brakem
                    source: "fesla/brake.png"
                    anchors.centerIn:button21
                    width: 60
                    height:60
                }
                }

            Rectangle{
                id: button22
                width: 80
                height: 80
                color: "#009900"
                border.color: "black"
                border.width: 5
                radius: 15
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        backend.sendClicked(4);
                    }
                    }
                Image {
                    id:i_rightm
                    source: "fesla/right-arrow.png"
                    anchors.centerIn:button22
                    width: 60
                    height:60
                }
                }

            }


        }
///////////////////////////////////////////////////////////ll
        Rectangle {
            id:df
            width: 100
            height: 100
            x:80
            y:350
            visible:false
            color: "gray"
            border.width: 5
            radius: 15

            MouseArea {
                anchors.fill: parent
                onClicked: {

                }
            }
            Image {

                source: "fesla/car.png"
                anchors.centerIn: parent
                width: 60
                height: 60
            }
            Text {

                text:"   STOP ENABLE"
                font.weight: Font.Bold
            }}
        Column {
            id: addsetting
            spacing: 10
            x:280
            y:120
            visible:false
            Row {
                spacing: 10
                Rectangle {
                    id: button2234_500
                    width: 100
                    height: 100
                    color: "red"
                    border.width: 5
                    radius: 15

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {

                        }
                    }
                    Image {
                        id: i_fr_500
                        source: "fesla/motor.png"
                        anchors.centerIn: parent
                        width: 60
                        height: 60
                    }
                    Text {
                        id: status22e
                        text:"    Bases Conveyor"
                        font.weight: Font.Bold
                    }



                }
                Rectangle {
                    id: button2234_501
                    width: 100
                    height: 100
                    color: "red"
                    border.width: 5
                    radius: 15
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {

                        }
                    }
                    Image {
                        id: i_fr_501
                        source: "fesla/motor.png"
                        anchors.centerIn: parent
                        width: 60
                        height: 60
                    }
                    Text {
                        id: status22e2
                        text:"     Lids Conveyer"
                        font.weight: Font.Bold
                    }
                }
                Rectangle {
                    id: button2234_502
                    width: 100
                    height: 100
                    color: "red"
                    border.width: 5
                    radius: 15
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {

                        }
                    }
                    Image {
                        id: i_fr_502
                        source: "fesla/motor.png"
                        anchors.centerIn: parent
                        width: 60
                        height: 60
                    }
                    Text {

                        text:"     Bases Raise"
                        font.weight: Font.Bold
                    }
                }
            }

            Row {
                spacing: 10
                Rectangle {
                    id: button2234_503
                    width: 100
                    height: 100
                    color: "red"
                    border.width: 5
                    radius: 15
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {

                        }
                    }
                    Image {
                        id: i_fr_503
                        source: "fesla/motor.png"
                        anchors.centerIn: parent
                        width: 60
                        height: 60
                    }
                    Text {
                        text:"     Lids Raise"
                        font.weight: Font.Bold
                    }

                }
                Rectangle {
                    id: button2234_504
                    width: 100
                    height: 100
                    color: "red"
                    border.width: 5
                    radius: 15
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {

                        }
                    }
                    Image {
                        id: i_fr_504
                        source: "fesla/motor.png"
                        anchors.centerIn: parent
                        width: 60
                        height: 60
                    }
                    Text {
                        text:"     Clamp Lids"
                        font.weight: Font.Bold
                    }
                }
                Rectangle {
                    id: button2234_505
                    width: 100
                    height: 100
                    color: "red"
                    border.width: 5
                    radius: 15
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {

                        }
                    }
                    Image {
                        id: i_fr_505
                        source: "fesla/down-arrow.png"
                        anchors.centerIn: parent
                        width: 60
                        height: 60
                    }
                    Text {
                        text:"     MoveZ"
                        font.weight: Font.Bold
                    }
                }
            }

            Row {
                spacing: 10
                Rectangle {
                    id: button2234_506
                    width: 100
                    height: 100
                    color: "red"
                    border.width: 5
                    radius: 15
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {

                        }
                    }
                    Image {
                        id: i_fr_506
                        source: "fesla/motor.png"
                        anchors.centerIn: parent
                        width: 60
                        height: 60
                    }
                    Text {
                        text:"     Clamp Bases"
                        font.weight: Font.Bold
                    }
                }
                Rectangle {
                    id: button2234_507
                    width: 100
                    height: 100
                    color: "red"
                    border.width: 5
                    radius: 15
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {

                        }
                    }
                    Image {
                        id: i_fr_507
                        source: "fesla/solution.png"
                        anchors.centerIn: parent
                        width: 60
                        height: 60
                    }
                    Text {
                        text:"        Grap"
                        font.weight: Font.Bold
                    }
                }
                Rectangle {
                    id: button2234_508
                    width: 100
                    height: 100
                    color: "red"
                    border.width: 5
                    radius: 15
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {

                        }
                    }
                    Image {
                        id: i_fr_508
                        source: "fesla/right-arrow.png"
                        anchors.centerIn: parent
                        width: 60
                        height: 60
                    }
                    Text {
                        text:"      Move X"
                        font.weight: Font.Bold
                    }
                }
            }

            Row {
                spacing: 10
                Rectangle {
                    id: button2234_509
                    width: 100
                    height: 80
                    border.width: 5
                    radius: 15
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                           addsetting.visible=false
                            home1.visible=true
                            home2.visible=true
                            displayparts.visible=false
                            df.visible=false
                            numbersend.visible=false
                        }
                    }
                    Image {
                        id: i_fr_509
                        source: "fesla/undo.png"
                        anchors.centerIn: parent
                        width: 60
                        height: 60
                    }
                }
                Rectangle {
                    id: button2234_510
                    width:200
                    height: 80
                    color: "red"
                    border.width: 5
                    radius: 15
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                        addsetting.visible
                        }
                    }
                    Image {
                        id: i_fr_510
                        source: "fesla/project-status.png"
                        anchors.centerIn: parent
                        width: 60
                        height: 60
                    }
                    Text {
                        text:"      Auto-Manual"
                        font.weight: Font.Bold
                    }
                }
            }

            Timer {
                interval: 1
                running: true
                repeat: true
                onTriggered: {
                    //510 is auto manunal
                    if (receivedMsg == 510) {
                       button2234_510.color="green";
                    }
                    if (receivedMsg == 520) {
                       button2234_510.color="red";
                    }
                    //500->bases conveyer
                    if (receivedMsg == 501) {
                       button2234_500.color="green";
                    }
                    if (receivedMsg == 512) {
                       button2234_500.color="red";
                    }
                    //501-> Lids Conveyor
                    if (receivedMsg == 502) {
                       button2234_501.color="green";
                    }
                    if (receivedMsg == 513) {
                       button2234_501.color="red";
                    }
                    //502->raise base
                    if (receivedMsg == 503) {
                       button2234_502.color="green";
                    }
                    if (receivedMsg == 514) {
                       button2234_502.color="red";
                    }
                    //503->raise lid
                    if (receivedMsg == 504) {
                       button2234_503.color="green";
                    }
                    if (receivedMsg == 515) {
                       button2234_503.color="red";
                    }
                    //504-> clamp lid
                    if (receivedMsg == 505) {
                       button2234_504.color="green";
                    }
                    if (receivedMsg == 516) {
                       button2234_504.color="red";
                    }
                    //505-> Move Z
                    if (receivedMsg == 506) {
                       button2234_505.color="green";
                    }
                    if (receivedMsg == 517) {
                       button2234_505.color="red";
                    //506-> clamp base
                    }
                    if (receivedMsg == 507) {
                       button2234_506.color="green";
                    }
                    if (receivedMsg == 518) {
                       button2234_506.color="red";
                    }
                    //507->GRAP
                    if (receivedMsg == 508) {
                       button2234_507.color="green";
                    }
                    if (receivedMsg == 519) {
                       button2234_507.color="red";
                    }
                    //508-> MOVE X
                    if (receivedMsg == 509) {
                       button2234_508.color="green";
                    }
                    if (receivedMsg == 520) {
                       button2234_508.color="red";
                    }
                    if (receivedMsg == 50) {
                       df.color="red";
                    }
                    if (receivedMsg == 51) {
                       df.color="red";
                    }


                    // //509-> PUSHER1
                    // if (receivedMsg == 530) {
                    //    button2234_509.color="green";
                    // }
                    // if (receivedMsg == 521) {
                    //    button2234_509.color="red";
                    // }
                }




                        }
                    }


////////////////////////////////////////////////////////////////////////////////////////////////////uu/////////////////
        Column {
                spacing: 10
                padding: 10
                x:30
                y:140
                id:displayparts
                visible:false
                Rectangle {
                    width: 200
                    height: 50
                    border.width: 2
                    radius: 5
                    color: "lightgray"
                    Column {
                        anchors.centerIn: parent
                        Text {
                            id: qd38_text
                            text: "Mixed Parts: "
                            font.pixelSize: 16
                        }
                    }
                }
                Rectangle {
                    width: 200
                    height: 50
                    border.width: 2
                    radius: 5
                    color: "lightgray"
                    Column {
                        anchors.centerIn: parent
                        Text {
                            id: qd34_text
                            text: "Green Parts: "
                            font.pixelSize: 16
                        }
                    }
                }
                Rectangle {
                    width: 200
                    height: 50
                    border.width: 2
                    radius: 5
                    color: "lightgray"
                    Column {
                        anchors.centerIn: parent
                        Text {
                            id: qd30_text
                            text: "Blue Parts: "
                            font.pixelSize: 16
                        }
                    }
                }

                Timer {
                    interval: 1000
                    running: true
                    repeat: true
                    onTriggered: {
                        // Parse the receivedMsg and update the text values accordingly
                        var msg = receivedMsg.split('\n')
                        for (var i = 0; i < msg.length; i++) {
                            var parts = msg[i].split(': ')
                            if (parts.length == 2) {
                                var key = parts[0]
                                var value = parts[1]
                                if (key === "QD38") {
                                    qd38_text.text = "Mixed Parts: " + value
                                } else if (key === "QD34") {
                                    qd34_text.text = "Green Parts: " + value
                                } else if (key === "QD30") {
                                    qd30_text.text = "Blue Parts : " + value
                                }
                            }
                        }
                    }
                }
            }




    /////////////////////////////////////////////////////////////////////////////////////////////


    Backend {
        id: backend


        onStatusChanged: {
            //console.log(currentStatus);
            ti.append(addMsg(newStatus));
            if (currentStatus !== true)
            {
                btn_connect.enabled = true;
            }
        }
        onSomeMessage: {
            ti.append(addMsg(msg));
        }
        onSomeError: {
            ti.append(addMsg("Error! " + err));
            if (currentStatus !== true)
            {
                backend.disconnectClicked();
            }
            btn_connect.enabled = true;
        }
    }


    ColumnLayout
    {

        anchors.fill: parent
        anchors.margins: 10


        LayoutSection {
            height: status.height + 15
            color: backend.currentStatus ? "#CAF5CF" : "#EA9FA9"

            Text {
                id: status22
                anchors.centerIn: parent
              //  text: backend.currentStatus ? "************>>>> CONNECTED TO WAFL" : "************>>>> DISCONNECTED "
                font.weight: Font.Bold
            }
        }

        RowLayout {
            anchors.horizontalCenter: parent.horizontalCenter

            BetterButton {
                id: btn_connect
                anchors.left: parent.left
                text: "Connect to PLC Server"
                color: enabled ? this.down ? "#78C37F" : "#87DB8D" : "gray"
                border.color: "#78C37F"
                onClicked: {
                    ////////////////////client///////////////////
                    ti.append(addMsg("Connecting to server..."));
                    backend.connectClicked();
                    this.enabled = false;
                    ///////////////////////server////////////////
                    ti2.append(addMsg(backend2.startClicked()));
                    this.enabled = false;
                    /////////////


                }
            }
            BetterButton {
                id: btn_disconnect
                enabled: !btn_connect.enabled
                anchors.right: parent.right
                text: "Disconnect from PLC Server"
                color: enabled ? this.down ? "#DB7A74" : "#FF7E79" : "gray"
                border.color: "#DB7A74"
                onClicked: {
                    ////////////////////////client/////////////////////
                    ti.append(addMsg("Disconnecting from server..."));
                    backend.disconnectClicked();
                    btn_connect.enabled = true;
                    /////////////////////////server///////////////////
                    ti2.append(addMsg(backend2.stopClicked()));
                    btn_start.enabled = true;
                }
            }
        }

        LayoutSection {
            Layout.fillHeight: true

            ScrollView {
                id: scrollView
                anchors.fill: parent

                TextArea {
                    id: ti
                    readOnly: true
                    selectByMouse : true
                    font.pixelSize: 14
                    wrapMode: TextInput.WrapAnywhere
                }
            }
        }


        RowLayout {
            Layout.leftMargin: 15
            Layout.rightMargin: 15
            Layout.topMargin: 5
            Layout.bottomMargin: 5

            Rectangle {
                // Layout.fillWidth: true
                // height: btn_send.height
                // color: "#F4F2F5"
                // border.color: "gray"
                // border.width: 1

                TextInput {
                    id: msgToSend
                    anchors.verticalCenter: parent.verticalCenter
                    //leftPadding: 10
                   // rightPadding: 10
                    width: parent.width
                    font.pixelSize: 14
                    clip: true
                }
            }


            // BetterButton {
            //     id: btn_send
            //     enabled: !btn_connect.enabled
            //     text: "Send"
            //     color: enabled ? this.down ? "#6FA3D2" : "#7DB7E9" : "gray"
            //     border.color: "#6FA3D2"
            //     onClicked: {
            //         ti.append(addMsg("Sending message..."));
            //         //backend.sendClicked(msgToSend.text);
            //         backend.sendClicked(3);
            //     }

            // }
        }
    }
    //////////////////server//////////receive option//////////////////////servers////////////////////

    property string receivedMsg: ""
    Backend {
        id: backend2
        onSmbConnected: {
            ti2.append(addMsg("Somebody has connected"));
        }
        onSmbDisconnected: {
            ti2.append(addMsg("Somebody has disconnected"));
        }
        onNewMessage: {
           ti2.append((msg == "3" ? msg + "666" : msg));
            receivedMsg = msg;


        }
    }
    Connections {
        target: yourPythonClientObject // Replace with the actual object name
        onHasReadSome: {
            handleMessage(msg); // Call a function with the parameter
        }
    }

    function handleMessage(msg) {
        console.log("Received message:", msg);
        // Handle the message here
    }





    Rectangle{
         id:test2
         x:400
         y:400
         border.color: "#78C37F"
         MouseArea{
             anchors.fill: parent
             onClicked: {
                 ti2.append(addMsg(backend2.startClicked()));
                 this.enabled = false;

                 }

             }

    }
    ColumnLayout
    {
        anchors.fill: parent
        anchors.margins: 10

        RowLayout {
            anchors.horizontalCenter: parent.horizontalCenter

            // BetterButton2 {
            //     id: btn_start
            //     anchors.left: parent.left
            //     text: "Activate Status Mode"
            //     color: enabled ? this.down ? "#78C37F" : "#87DB8D" : "gray"
            //     border.color: "#78C37F"
            //     onClicked: {
            //         ti2.append(addMsg(backend2.startClicked()));
            //         this.enabled = false;
            //     }
            }
            // BetterButton2 {
            //     enabled: !btn_start.enabled
            //     anchors.right: parent.right
            //     text: "Disactivate Status Mode"
            //     color: enabled ? this.down ? "#DB7A74" : "#FF7E79" : "gray"
            //     border.color: "#DB7A74"
            //     onClicked: {
            //         ti2.append(addMsg(backend2.stopClicked()));
            //         btn_start.enabled = true;
            //     }
            // }
       // }

        LayoutSection2 {
           // Layout.fillHeight: true
            x:100
            y:300

            width: 60
            height: 60

            ScrollView {
                id: scrollView2
                anchors.fill: parent

                TextArea {
                    id: ti2
                    readOnly: true
                    selectByMouse : true
                    font.pixelSize: 14
                    wrapMode: TextInput.WrapAnywhere
                }
            }
        }

        // BetterButton {
        //     anchors.horizontalCenter: parent.horizontalCenter
        //     text: "Test connection"
        //     color: this.down ? "#6FA3D2" : "#7DB7E9"
        //     border.color: "#6FA3D2"
        //     onClicked: {
        //         ti2.append(addMsg(backend.testClicked()));
        //     }
        // }
    }
    Component.onCompleted: {
        if (receivedMsg == "21") {
            performActions();
        }
    }

    // Component.onCompleted: {
    //     ti.text = addMsg("Application started\n- - - - - -", false);
    // }

    function addMsg(someText)
    {
        //return "[" + currentTime() + "] " + someText;
        return "[" + someText;
    }

    function currentTime()
    {
        var now = new Date();
        var nowString = ("0" + now.getHours()).slice(-2) + ":"
                + ("0" + now.getMinutes()).slice(-2) + ":"
                + ("0" + now.getSeconds()).slice(-2);
        return nowString;
    }
}
