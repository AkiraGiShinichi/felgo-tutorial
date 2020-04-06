import QtQuick 2.0

Item {
    function formatTitle(todo) {
        if(!todo)
            return ""

        return qsTr("Todo") + " " + todo.id
    }
}
