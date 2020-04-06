import QtQuick 2.0
import Felgo 3.0

Page {
    id: page
    title: qsTr("Todo List")

    // when a todo is added, we open the detail page for it
    Connections {
      target: dataModel
      onTodoStored: {
        page.navigationStack.popAllExceptFirstAndPush(detailPageComponent, { todoId: todo.id })
      }
    }

    // JsonListModel
    // A ViewModel for JSON data that offers best integration and performance with list views
    JsonListModel {
      id: listModel
      source: dataModel.todos // show todos from data model
      keyField: "id"
      fields: ["id", "title", "completed"]
    }


}
