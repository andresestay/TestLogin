package testbd

class UserController {

    def index() {
    redirect (action: "testLogin")
    }

    def testRegistro={}
    def testLogin ={}

    def authenticate ={

        def user=User.findByUserNameAndPassword(params.userName,params.password)
        //def user = new User (userName: "James Patterson", password: "ja", fullName: "lihlhd")

        if(user){
            session.user = user
            flash.message = "Hello ${user.fullName}"
            redirect(action:"testLogin")
        }else{
            flash.message = "Sorry, ${params.userName}. Please try again"
            redirect(action:"testLogin")
        }
    }

    def logout ={
        flash.message = "Goodbye ${session.user.fullName}"
        session.user = null
        redirect(action:"testLogin")
    }

    def registro(){
        def user = new User(userName:params.userName,password:params.password,fullName:params.fullName)
        user.save()
        flash.message = "${params.fullName} has sido registrado exitosamente."
        redirect(action:"testRegistro")
    }
}
