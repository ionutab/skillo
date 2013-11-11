package skillo

import grails.test.mixin.*
import skillo.ClientController

@TestFor(ClientController)
@Mock(Client)
class ClientControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/clientCompany/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.clientCompanyInstanceList.size() == 0
        assert model.clientCompanyInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.clientCompanyInstance != null
    }

    void testSave() {
        controller.save()

        assert model.clientCompanyInstance != null
        assert view == '/clientCompany/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/clientCompany/show/1'
        assert controller.flash.message != null
        assert Client.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/clientCompany/list'

        populateValidParams(params)
        def clientCompany = new Client(params)

        assert clientCompany.save() != null

        params.id = clientCompany.id

        def model = controller.show()

        assert model.clientCompanyInstance == clientCompany
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/clientCompany/list'

        populateValidParams(params)
        def clientCompany = new Client(params)

        assert clientCompany.save() != null

        params.id = clientCompany.id

        def model = controller.edit()

        assert model.clientCompanyInstance == clientCompany
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/clientCompany/list'

        response.reset()

        populateValidParams(params)
        def clientCompany = new Client(params)

        assert clientCompany.save() != null

        // test invalid parameters in update
        params.id = clientCompany.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/clientCompany/edit"
        assert model.clientCompanyInstance != null

        clientCompany.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/clientCompany/show/$clientCompany.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        clientCompany.clearErrors()

        populateValidParams(params)
        params.id = clientCompany.id
        params.version = -1
        controller.update()

        assert view == "/clientCompany/edit"
        assert model.clientCompanyInstance != null
        assert model.clientCompanyInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/clientCompany/list'

        response.reset()

        populateValidParams(params)
        def clientCompany = new Client(params)

        assert clientCompany.save() != null
        assert Client.count() == 1

        params.id = clientCompany.id

        controller.delete()

        assert Client.count() == 0
        assert Client.get(clientCompany.id) == null
        assert response.redirectedUrl == '/clientCompany/list'
    }
}
