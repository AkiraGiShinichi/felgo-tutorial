import QtQuick 2.0
import Felgo 3.0

Item {
    // actions
    signal fetchTodos()
    signal fetchTodoDetails(int id)
    signal fetchDraftTodos()
    signal storeTodo(var todo)
    signal clearCache()
    signal login(string username, string password)
    signal logout()

    // function to store a new todo
    function addTodo(title) {
        var draft = {
            completed: false,
            title: title,
            userId: 1
        }

        storeTodo(draft)
    }
}
