# Felgo Camera

>

## Reference Source:
 - [Navigation + Passing data](https://felgo.com/doc/felgo-navigationstack/):
```
var properties = { title: "Page " + (page.navigationStack.depth + 1) }
page.navigationStack.push(pageComponent, properties)
```
 - [QML Date Time](http://qt.shoutwiki.com/wiki/Get_current_Date_and_Time_in_Qt) + [Felgo Date Time](https://felgo.com/doc/qt/qdatetime/#currentDateTime)
```
text: Qt.formatDateTime(new Date(), "yyyyMMdd_hhmmss")
```