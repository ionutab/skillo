package skilloo



import org.junit.*
import grails.test.mixin.*

@TestFor(AddressController)
@Mock(Address)
class AddressControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/candidateAddress/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.candidateAddressInstanceList.size() == 0
        assert model.candidateAddressInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.candidateAddressInstance != null
    }

    void testSave() {
        controller.save()

        assert model.candidateAddressInstance != null
        assert view == '/candidateAddress/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/candidateAddress/show/1'
        assert controller.flash.message != null
        assert Address.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/candidateAddress/list'

        populateValidParams(params)
        def candidateAddress = new Address(params)

        assert candidateAddress.save() != null

        params.id = candidateAddress.id

        def model = controller.show()

        assert model.candidateAddressInstance == candidateAddress
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/candidateAddress/list'

        populateValidParams(params)
        def candidateAddress = new Address(params)

        assert candidateAddress.save() != null

        params.id = candidateAddress.id

        def model = controller.edit()

        assert model.candidateAddressInstance == candidateAddress
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/candidateAddress/list'

        response.reset()

        populateValidParams(params)
        def candidateAddress = new Address(params)

        assert candidateAddress.save() != null

        // test invalid parameters in update
        params.id = candidateAddress.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/candidateAddress/edit"
        assert model.candidateAddressInstance != null

        candidateAddress.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/candidateAddress/show/$candidateAddress.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        candidateAddress.clearErrors()

        populateValidParams(params)
        params.id = candidateAddress.id
        params.version = -1
        controller.update()

        assert view == "/candidateAddress/edit"
        assert model.candidateAddressInstance != null
        assert model.candidateAddressInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/candidateAddress/list'

        response.reset()

        populateValidParams(params)
        def candidateAddress = new Address(params)

        assert candidateAddress.save() != null
        assert Address.count() == 1

        params.id = candidateAddress.id

        controller.delete()

        assert Address.count() == 0
        assert Address.get(candidateAddress.id) == null
        assert response.redirectedUrl == '/candidateAddress/list'
    }
}
