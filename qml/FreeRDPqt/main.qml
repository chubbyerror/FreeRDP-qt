import QtQuick 1.0
import "../colibri"

Rectangle {
    id: launcher
    width: 380
    height: 490
    color: "#000000"
    opacity: 1
    MouseArea {
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        onClicked: {
            Qt.quit();
        }
    }

    signal launchSignal(variant argList)
    function gatherValues() {
        if (text_input_server.text != "")
        {
            var argList = new Array();
            if (text_input_username.text != "")
            {
                argList.push("-u");
                argList.push(text_input_username.text);
            }
            if (text_input_domain.text != "")
            {
                argList.push("-d");
                argList.push(text_input_domain.text);
            }
            if (text_input_password.text != "")
            {
                argList.push("-p");
                argList.push(text_input_password.text);
            }
            if (clcheckbox_console.checked)
            {
                argList.push("-0");
            }
            /*
            if (clcombobox_geometry.getSelected().length != 0)
            {
                argList.push("-g");
                argList.push((clcombobox_geometry.getSelected())[0]);
            }
            if (clcombobox_bpp.getSelected().length != 0)
            {
                argList.push("-a");
                argList.push((clcombobox_bpp.getSelected())[0]);
            }
            */
            if (clcheckbox_compression.checked)
            {
                argList.push("-z");
            }
            if (clcheckbox_fullscreen.checked)
            {
                argList.push("-f");
            }
            /*
            if (clcombobox_experience.getSelected().length != 0)
            {
                argList.push("-x");
                argList.push((clcombobox_experience.getSelected())[0]);
            }
            */

            var serverString = text_input_server.text;
            // Add port if non-standard
            if (text_input_port.text != "3389")
            {
                serverString += ":" + text_input_port;
            }
            argList.push(serverString);

            launchSignal(argList);
        }
    }

    Text {
        id: apptitle
        color: "#ffffff"
        text: "FreeRDP"
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 20
        font.pixelSize: 20
    }

    Text {
        id: text_server
        height: 20
        color: "#ffffff"
        text: "Server"
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: apptitle.bottom
        anchors.topMargin: 20
        //font.pixelSize: 14
    }

    FocusScope {
        id: focusscope_server
        property alias text: text_input_server.text
        width: 160
        height: 30
        anchors.left: parent.left
        anchors.leftMargin: 195
        anchors.top: apptitle.bottom
        anchors.topMargin: 15
        BorderImage {
            source: "images/lineedit.sci"
            anchors.fill: parent
        }
        TextInput {
            id: text_input_server
            width: 150
            text: ""
            anchors.centerIn: parent
            //font.pixelSize: 14
            focus: true
        }
    }

    Text {
        id: text_port
        height: 20
        color: "#ffffff"
        text: "Port"
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: text_server.bottom
        anchors.topMargin: 10
        //font.pixelSize: 14
    }

    FocusScope {
        id: focusscope_port
        property alias text: text_input_port.text
        width: 80
        height: 30
        anchors.left: parent.left
        anchors.leftMargin: 195
        anchors.top: focusscope_server.bottom
        anchors.topMargin: 0
        BorderImage {
            source: "images/lineedit.sci"
            anchors.fill: parent
        }
        TextInput {
            id: text_input_port
            text: "3389"
            width: 70
            anchors.centerIn: parent
            //font.pixelSize: 14
            focus: true
        }
    }

    Text {
        id: text_username
        height: 20
        color: "#ffffff"
        text: "Username"
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: text_port.bottom
        anchors.topMargin: 10
        //font.pixelSize: 14
    }

    FocusScope {
        id: focusscope_username
        property alias text: text_input_username.text
        width: 160
        height: 30
        anchors.left: parent.left
        anchors.leftMargin: 195
        anchors.top: focusscope_port.bottom
        anchors.topMargin: 0
        BorderImage {
            source: "images/lineedit.sci"
            anchors.fill: parent
        }
        TextInput {
            id: text_input_username
            text: ""
            width: 150
            anchors.centerIn: parent
            //font.pixelSize: 14
            focus: true
        }
    }

    Text {
        id: text_domain
        height: 20
        color: "#ffffff"
        text: "Domain"
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: text_username.bottom
        anchors.topMargin: 10
        //font.pixelSize: 14
    }

    FocusScope {
        id: focusscope_domain
        property alias text: text_input_domain.text
        width: 160
        height: 30
        anchors.left: parent.left
        anchors.leftMargin: 195
        anchors.top: focusscope_username.bottom
        anchors.topMargin: 0
        BorderImage {
            source: "images/lineedit.sci"
            anchors.fill: parent
        }
        TextInput {
            id: text_input_domain
            text: ""
            width: 150
            anchors.centerIn: parent
            //font.pixelSize: 14
            focus: true
        }
    }

    Text {
        id: text_password
        height: 20
        color: "#ffffff"
        text: "Password"
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: text_domain.bottom
        anchors.topMargin: 10
        //font.pixelSize: 14
    }

    FocusScope {
        id: focusscope_password
        property alias text: text_input_password.text
        width: 160
        height: 30
        anchors.left: parent.left
        anchors.leftMargin: 195
        anchors.top: focusscope_domain.bottom
        anchors.topMargin: 0
        BorderImage {
            source: "images/lineedit.sci"
            anchors.fill: parent
        }
        TextInput {
            id: text_input_password
            text: ""
            echoMode: TextInput.Password
            width: 150
            anchors.centerIn: parent
            //font.pixelSize: 14
            focus: true
        }
    }

    Text {
        id: text_console
        height: 20
        color: "#ffffff"
        text: "Console session"
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: text_password.bottom
        anchors.topMargin: 10
        //font.pixelSize: 14
    }

    CLCheckBox {
        id: clcheckbox_console
        width: 20
        height: 20
        color: "#ffffff"
        anchors.left: parent.left
        anchors.leftMargin: 200
        anchors.top: focusscope_password.bottom
        anchors.topMargin: 5
        colorWhenDefault: "#ffffff"

    }

    Text {
        id: text_displayoptions
        color: "#ffffff"
        text: "Display Options:"
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: text_console.bottom
        anchors.topMargin: 20
        font.pixelSize: 18
    }

    Text {
        id: text_geometry
        height: 20
        color: "#ffffff"
        text: "Resolution"
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: text_displayoptions.bottom
        anchors.topMargin: 20
        //font.pixelSize: 14
    }

    // All CLComboBox items return 3x "QFont::setPointSizeF: Point size <= 0 (0.000000), must be greater than 0" errors when running
    // Seems to be a bug in the Colibri library
    /*
    CLComboBox {
        id: clcombobox_geometry
        width: 150
        height: 20
        dropDown: true
        itemHeight: 20
        items: geometryModel
        anchors.left: parent.left
        anchors.leftMargin: 200
        anchors.top: text_displayoptions.bottom
        anchors.topMargin: 20
    }
    */
    Text {
        id: clcombobox_geometry
        width: 150
        height: 20
        color: "#ffffff"
        text: "<ComboBox placeholder>"
        anchors.left: parent.left
        anchors.leftMargin: 200
        anchors.top: text_displayoptions.bottom
        anchors.topMargin: 20
    }

    ListModel {
        id: geometryModel
        ListElement {
            selected: false
            label: "640x480"
            value: "640x480"
        }
        ListElement {
            selected: false
            label: "800x600"
            value: "800x600"
        }
        ListElement {
            selected: false
            label: "1024x768"
            value: "1024x768"
        }
        ListElement {
            selected: false
            label: "1280x720"
            value: "1280x720"
        }
        ListElement {
            selected: false
            label: "1280x768"
            value: "1280x768"
        }
        ListElement {
            selected: false
            label: "1280x1024"
            value: "1280x1024"
        }
        ListElement {
            selected: false
            label: "1440x900"
            value: "1440x900"
        }
        ListElement {
            selected: false
            label: "1680x1050"
            value: "1680x1050"
        }
        ListElement {
            selected: false
            label: "1600x1200"
            value: "1600x1200"
        }
        ListElement {
            selected: false
            label: "1920x1080"
            value: "1920x1080"
        }
        ListElement {
            selected: false
            label: "Fit to device"
            value: "fit"
        }
        ListElement {
            selected: false
            label: "custom"
            value: "custom"
        }
    }

    Text {
        id: text_bpp
        height: 20
        color: "#ffffff"
        text: "Color Depth"
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: text_geometry.bottom
        anchors.topMargin: 10
        //font.pixelSize: 14
    }

    /*
    CLComboBox {
        id: clcombobox_bpp
        width: 50
        height: 20
        dropDown: true
        anchors.top: clcombobox_geometry.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 200
        itemHeight: 20
    }
    */
    Text {
        id: clcombobox_bpp
        width: 150
        height: 20
        color: "#ffffff"
        text: "<ComboBox placeholder>"
        anchors.left: parent.left
        anchors.leftMargin: 200
        anchors.top: clcombobox_geometry.bottom
        anchors.topMargin: 10
    }

    ListModel {
        id: bppModel
        ListElement {
            selected: false
            label: "8"
            value: "8"
        }
        ListElement {
            selected: false
            label: "15"
            value: "15"
        }
        ListElement {
            selected: false
            label: "16"
            value: "16"
        }
        ListElement {
            selected: false
            label: "24"
            value: "24"
        }
        ListElement {
            selected: false
            label: "32"
            value: "32"
        }
    }

    Text {
        id: text_fullscreen
        height: 20
        color: "#ffffff"
        text: "Full Screen"
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: text_bpp.bottom
        anchors.topMargin: 10
        //font.pixelSize: 14
    }

    CLCheckBox {
        id: clcheckbox_fullscreen
        width: 20
        height: 20
        anchors.left: parent.left
        anchors.leftMargin: 200
        anchors.top: clcombobox_bpp.bottom
        anchors.topMargin: 10
    }

    Text {
        id: text_compression
        height: 20
        color: "#ffffff"
        text: "Compression"
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: text_fullscreen.bottom
        anchors.topMargin: 10
        //font.pixelSize: 14
    }

    CLCheckBox {
        id: clcheckbox_compression
        width: 20
        height: 20
        anchors.left: parent.left
        anchors.leftMargin: 200
        anchors.top: clcheckbox_fullscreen.bottom
        anchors.topMargin: 10
    }

    Text {
        id: text_experience
        height: 20
        color: "#ffffff"
        text: "Experience"
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: text_compression.bottom
        anchors.topMargin: 10
        //font.pixelSize: 14
    }

    /*
    CLComboBox {
        id: clcombobox_experience
        width: 150
        height: 20
        dropDown: true
        anchors.left: parent.left
        anchors.leftMargin: 200
        anchors.top: clcheckbox_compression.bottom
        anchors.topMargin: 10
        itemsVisible: 4
        itemHeight: 20
    }
    */
    Text {
        id: clcombobox_experience
        width: 150
        height: 20
        color: "#ffffff"
        text: "<ComboBox placeholder>"
        anchors.left: parent.left
        anchors.leftMargin: 200
        anchors.top: clcheckbox_compression.bottom
        anchors.topMargin: 10
    }

    ListModel {
        id: experienceModel
        ListElement {
            selected: true
            label: "Modem"
            value: "modem"
        }
        ListElement {
            selected: false
            label: "Broadband"
            value: "broadband"
        }
        ListElement {
            selected: false
            label: "LAN"
            value: "lan"
        }
    }

    CLButton {
        id: clbutton_connect
        text: "Connect"
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        borderColorWhenSelected: "#ffffff"
        borderColorWhenPressed: "#ffffff"
        borderColorWhenHovered: "#ffffff"
        borderColor: "#ffffff"
        colorWhenDefault: "#ffffff"

        onClicked:  {
            launcher.gatherValues()
        }
    }
}

