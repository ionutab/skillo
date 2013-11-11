package skillo

import grails.test.mixin.*
import skillo.PayrollCompanyController

@TestFor(PayrollCompanyController)
@Mock(PayrollCompany)
class PayrollCompanyControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/payrollCompany/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.payrollCompanyInstanceList.size() == 0
        assert model.payrollCompanyInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.payrollCompanyInstance != null
    }

    void testSave() {
        controller.save()

        assert model.payrollCompanyInstance != null
        assert view == '/payrollCompany/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/payrollCompany/show/1'
        assert controller.flash.message != null
        assert PayrollCompany.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/payrollCompany/list'

        populateValidParams(params)
        def payrollCompany = new PayrollCompany(params)

        assert payrollCompany.save() != null

        params.id = payrollCompany.id

        def model = controller.show()

        assert model.payrollCompanyInstance == payrollCompany
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/payrollCompany/list'

        populateValidParams(params)
        def payrollCompany = new PayrollCompany(params)

        assert payrollCompany.save() != null

        params.id = payrollCompany.id

        def model = controller.edit()

        assert model.payrollCompanyInstance == payrollCompany
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/payrollCompany/list'

        response.reset()

        populateValidParams(params)
        def payrollCompany = new PayrollCompany(params)

        assert payrollCompany.save() != null

        // test invalid parameters in update
        params.id = payrollCompany.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/payrollCompany/edit"
        assert model.payrollCompanyInstance != null

        payrollCompany.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/payrollCompany/show/$payrollCompany.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        payrollCompany.clearErrors()

        populateValidParams(params)
        params.id = payrollCompany.id
        params.version = -1
        controller.update()

        assert view == "/payrollCompany/edit"
        assert model.payrollCompanyInstance != null
        assert model.payrollCompanyInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/payrollCompany/list'

        response.reset()

        populateValidParams(params)
        def payrollCompany = new PayrollCompany(params)

        assert payrollCompany.save() != null
        assert PayrollCompany.count() == 1

        params.id = payrollCompany.id

        controller.delete()

        assert PayrollCompany.count() == 0
        assert PayrollCompany.get(payrollCompany.id) == null
        assert response.redirectedUrl == '/payrollCompany/list'
    }
}
