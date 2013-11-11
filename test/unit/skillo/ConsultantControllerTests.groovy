package skillo

import grails.test.mixin.*
import skillo.ConsultantController

@TestFor(ConsultantController)
@Mock(Consultant)
class ConsultantControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/consultant/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.consultantInstanceList.size() == 0
        assert model.consultantInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.consultantInstance != null
    }

    void testSave() {
        controller.save()

        assert model.consultantInstance != null
        assert view == '/consultant/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/consultant/show/1'
        assert controller.flash.message != null
        assert Consultant.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/consultant/list'

        populateValidParams(params)
        def consultant = new Consultant(params)

        assert consultant.save() != null

        params.id = consultant.id

        def model = controller.show()

        assert model.consultantInstance == consultant
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/consultant/list'

        populateValidParams(params)
        def consultant = new Consultant(params)

        assert consultant.save() != null

        params.id = consultant.id

        def model = controller.edit()

        assert model.consultantInstance == consultant
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/consultant/list'

        response.reset()

        populateValidParams(params)
        def consultant = new Consultant(params)

        assert consultant.save() != null

        // test invalid parameters in update
        params.id = consultant.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/consultant/edit"
        assert model.consultantInstance != null

        consultant.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/consultant/show/$consultant.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        consultant.clearErrors()

        populateValidParams(params)
        params.id = consultant.id
        params.version = -1
        controller.update()

        assert view == "/consultant/edit"
        assert model.consultantInstance != null
        assert model.consultantInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/consultant/list'

        response.reset()

        populateValidParams(params)
        def consultant = new Consultant(params)

        assert consultant.save() != null
        assert Consultant.count() == 1

        params.id = consultant.id

        controller.delete()

        assert Consultant.count() == 0
        assert Consultant.get(consultant.id) == null
        assert response.redirectedUrl == '/consultant/list'
    }
}
