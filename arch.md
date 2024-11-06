# Clean Architecture 
Clean Architecture is designed to separate responsibilities into three main layers: Data, Domain, and Presentation.

# `call Flow`
=> Presentation -> Domain -> Data


## `Presentation Layer (Statemanagement tool, Widgets)`
- Think of this layer as the front entrance of a house where guests (users) arrive and interact with what
  they see. It’s like the living room filled with furniture and decor that they can see and touch. This is where users see various widgets and interact with them.

   - Example: When a guest arrives, they can sit on the couch, turn on the lights, or adjust the thermostat. Similarly, in your app, users interact with buttons, sliders, and other widgets.

 - Behind the scenes, a state management tool acts like a butler, constantly listening to the user’s requests and updating the state. If a user makes a request (like turning up the heat), the butler (state management) coordinates this by getting updated information from the rest of the house (Data and Domain layers).

- The Presentation logic Holder is where the state management tool decides what’s displayed on the screen, such as a loading spinner or actual data.
- When it needs data, it contacts the Domain layer for that information.

  

## `Domain (Usecase , Entity , Repositories)`
- It is like the internal planning of the house like a blueprint
- it outline what has to be done but does not get involved in the specfic on how it is done 
  ### UseCase
- `UseCase : instruction or action which are need to be taken when something happen in presentation layer`
- usecase : it contain single class or single function that can be called in the Presentation logic holder
-  Think of them as instructions given to the house staff for specific tasks.
  
```
  example :
  class Signupusecase implements Usecase<Either, CreateUser> {
  @override
  Future<Either> call({CreateUser? parmas}) {
    return sl<AuthRepo>().signUp(parmas!);
  }
}

call in presentation layer:
 onPressed: () async {
         var result = await sl<Signupusecase>().call(
           parmas: CreateUser(
               email: _email.text,
               fullName: _fullName.text,
               password: _password.text),
            )};

```
- we can have multiple usecase like signup,signIn,getCurrentUserData etc.. but one usecase would only perform one task
  
 ### `Entity:` 
- it is the standard rule of the house that does not get change much (for example like rod ,bearing , wall in the house). 
- It is the core concept and object we are dealing with and they do not change much no matter what contains the structure of the main state of our application so for example if you're fetching a list of blogs the blog is going to be the main data in our application so entity is going to contain the structure of a Blog so it's going to be a simple class that will contain all the properties of a Blog 
  
 ### `Repositories` 
-  A repository in the Domain layer is like a set of instructions for the house staff, specifying what needs to be done without detailing how.
- Purpose: Defines interfaces for tasks that will be implemented in the Data layer. It’s like saying, “Deliver the mail,” without specifying how the staff should handle it.
- this is the layer which outlines what needs to be done but doesn't get involved with the specifics of how it's done so with the repository layer we specifying what needs to be done but we're not actually doing  it's just an interface
```
example:
abstract class AuthRepo {
  Future<Either> signIN(Signinuserreq signIN);
  Future<Either> signUp(CreateUser createUser);
}
```
 



## `Data (Repositories , Models , DataBase)`
- The Data layer is the basement where all the essential behind-the-scenes work happens. This layer includes the actual implementation for each repository, managing the data sources and converting raw data into app-ready formats.
### `Repositories: ` 
- Repositories here act like the storeroom staff who know exactly where every item is stored, fetched, and how to prepare it for use.
  Example: When the Domain layer requests user information, the Data layer retrieves it from the API, cleans it up, and provides it in a format the Domain layer understands.
```
example:
class AuthRepoImp extends AuthRepo {
  @override
  Future<Either> signIN(Signinuserreq signIN) async {
    return await sl<AuthFirebaseService>().signIn(signIN);
  }

  @override
  Future<Either> signUp(CreateUser createuser) async {
    return await sl<AuthFirebaseService>().signup(createuser);
  }
}
```



Models
- Models are like the recipe cards in the storeroom, converting raw ingredients (data) from their original forms into user-friendly formats.

    Example: If we fetch a blog post from a remote source, we might receive it in JSON format. The model will translate this raw JSON data into a structured Blog object, which can then be displayed in the app.

- Data Sources: There are two main data sources:

- Remote (API calls, e.g., fetching blog posts from a server).
- Local (Databases, e.g., storing data locally for offline access).
  



# now you might think that hey models is just the entity right
- that's true model is an entity because entity also contains the state of the main data in your application and model also does that the only reason we're not using entity in data layer is because it's present in the domain layer and domain layer needs to be independent of the data layer.
-  The whole system is designed in such a way so that each part does its job staying out of each other's way but they work together to ensure that the application runs smoothly

- `repository interface in the domain layer` and `repository implementation in the data layer` 

- The domain layer must remain independent of the data layer. Therefore, a repository should not directly communicate with a remote data source. Instead, we need a repository interface in the domain layer and an implementation in the data layer that interacts with the remote data source.

# `Summary`

- `Presentation Layer`: Manages what users see and interact with, relying on state management to sync the view.
- `Domain Layer`: Serves as the blueprint, defining core tasks without specifying how they’re carried out.
- `Data Layer`: Implements the actual data fetching and transformation.

This clean structure ensures each layer completes its tasks independently, enhancing flexibility and making the app easier to maintain.


# Folder Structure
```
lib/
├── common/
├── core/
├── data/
│   ├── models/
│   ├── repository/
│   └── sources/
├── domain/
│   ├── entities/
│   ├── repositary/
│   └── useCases/
└── presentation/
    ├── pages/
    └── cubit/
```

Each layer stays independent, fulfilling its role without interfering with others. This way, we achieve a clean, modular architecture that makes future updates and maintenance smooth and predictable.