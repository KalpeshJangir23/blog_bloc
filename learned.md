# Converting a Variable into a function
- A simple variable 
```
static final _border= OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      );
 ```
- Changed into function which would take default parameters passed in square brackets `[]` and if user passes the value to the function the it use that value 
example if we want the textfield border to be grey and if we hover over it change to other color we can do this by using this reusable func
```  
we can call this func focus border property of textfield

static _border([Color color = AppColor.borderColor]) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      );
```



# Custom Exceptions
- In Dart, the Exception class is used as a base class for defining custom exceptions. 
  When you write class ServerException implements Exception, it means you are creating a custom exception    class named ServerException that follows the behavior of the Exception 

```
class ServerException implements Exception {
  final String message;
  const ServerException(this.message);
}
  example: 
      if (response.user == null) {
        throw const ServerException('User not found');
      }

```

