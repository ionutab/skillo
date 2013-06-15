package skilloo



import org.junit.*
import grails.test.mixin.*

@TestFor(ContactController)
@Mock(Contact)
class ContactControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/clientContact/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.clientContactInstanceList.size() == 0
        assert model.clientContactInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.clientContactInstance != null
    }

    void testSave() {
        controller.save()

        assert model.clientContactInstance != null
        assert view == '/clientContact/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/clientContact/show/1'
        assert controller.flash.message != null
        assert Contact.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/clientContact/list'

        populateValidParams(params)
        def clientContact = new Contact(params)

        assert clientContact.save() != null

        params.id = clientContact.id

        def model = controller.show()

        assert model.clientContactInstance == clientContact
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/clientContact/list'

        populateValidParams(params)
        def clientContact = new Contact(params)

        assert clientContact.save() != null

        params.id = clientContact.id

        def model = controller.edit()

        assert model.clientContactInstance == clientContact
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/clientContact/list'

        response.reset()

        populateValidParams(params)
        def clientContact = new Contact(params)

        assert clientContact.save() != null

        // test invalid parameters in update
        params.id = clientContact.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/clientContact/edit"
        assert model.clientContactInstance != null

        clientContact.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/clientContact/show/$clientContact.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        clientContact.clearErrors()

        populateValidParams(params)
        params.id = clientContact.id
        params.version = -1
        controller.update()

        assert view == "/clientContact/edit"
        assert model.clientContactInstance != null
        assert model.clientContactInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/clientContact/list'

        response.reset()

        populateValidParams(params)
        def clientContact = new Contact(params)

        assert clientContact.save() != null
        assert Contact.count() == 1

        params.id = clientContact.id

        controller.delete()

        assert Contact.count() == 0
        assert Contact.get(clientContact.id) == null
        assert response.redirectedUrl == '/clientContact/list'
    }
}
