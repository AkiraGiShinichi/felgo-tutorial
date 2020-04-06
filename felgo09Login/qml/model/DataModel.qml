import QtQuick 2.0
import Felgo 3.0

Item {
    // property to configure target dispatcher / logic
    property alias dispatcher: logicConnection.target

    // whether api is busy (ongoing network requests)
    readonly property bool isBusy: api.busy // Q: How is "readonly"(limits)?

    // whether a user is logged in
    readonly property bool userLoggedIn: _.userLoggedIn

    // model data properties
    readonly property alias todos: _.todos
    readonly property alias todoDetails: _.todoDetails

    // action success signals
    signal todoStored(var todo)

    // action error signals
    signal fetchTodosFailed(var error)
    signal fetchTodoDetailsFailed(int id, var error)
    signal storeTodoFailed(var todo, var error)

    // listen to actions from dispatcher
    Connections {
        id: logicConnection

        // action 1 - fetchTodos
        onFetchTodos: {
            var cached = cache.getValue("todos")
            if (cached) _.todos = cached

            api.getTodos(
                        function(data) {
                            // cache data before updating model property
                            cache.setValue("todos", data)
                            _.todos = data
                        },
                        function(error) {
                            // action failed if no cached data
                            if (!cached) fetchTodosFailed(error)
                        })
        }

        // action 2 - fetchTodoDetails
        onFetchTodoDetails: {
            var cached = cache.getValue("todo_" + id)
            if (cached) {
                _.todoDetails[id] = cached
                todoDetailsChanged()
            }

            api.getTodoById(id,
                            function(data) {
                                cache.setValue("todo_" + id, data)
                                _.todoDetails[id] = data
                                todoDetailsChanged() // Q: Where is this?
                            },
                            function(error) {
                                if (!cached) {
                                    fetchTodoDetailsFailed(id, error)
                                }
                            })
        }

        // action 3 - storeTodo
        onStoreTodo: {
            api.addTodo(todo,
                        function(data) {
                            data.id = _.todos.length + 1
                            cache.setValue("todo_" + data.id, data)
                            _.todos.unshift(data)
                            cache.setValue("todos", _.todos)
                            todosChanged()  // Q: Where is this?
                            todoStored(data)
                        },
                        function(error) {
                            storeTodoFailed(todo, error)
                        })
        }

        // action 4 - clearCache
        onClearCache: {
            cache.clearAll()
        }

        // action 5 - login
        onLogin: _.userLoggedIn = true

        // action 6 - logout
        onLogout: _.userLoggedIn = false
    }

    // rest api for data access
    RestAPI {
        id: api
        maxRequestTimeout: 3000
    }

    // storage for caching
    Storage {
        id: cache
    }

    // private
    Item {
        id: _

        // data properties
        property var todos: [] // Q: What is this Array?
        property var todoDetails: ({}) // Q: What is this Map?

        // auth
        property bool userLoggedIn: false
    }
}
