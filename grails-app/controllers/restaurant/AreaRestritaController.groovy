package restaurant

class AreaRestritaController {

    def index() { }

    def logar() {
        render(view: "/areaRestrita/logar")
    }

    def admin() {
        render(view: "/areaRestrita/admin")
    }

    def logout() {
        redirect(action: logar())
    }
}
