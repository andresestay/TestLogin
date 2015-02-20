package testbd

class User {

    String userName
    String password
    String fullName
    String toString (){
        "${fullName}"
    }

    static constraints = {
        fullName()
        userName (username:true,unique:true)
        password (blank:false,password:true)
    }
}
