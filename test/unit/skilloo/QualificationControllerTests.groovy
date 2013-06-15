package skilloo



import org.junit.*
import grails.test.mixin.*

@TestFor(QualificationController)
@Mock(Qualification)
class QualificationControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/qualification/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.qualificationInstanceList.size() == 0
        assert model.qualificationInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.qualificationInstance != null
    }

    void testSave() {
        controller.save()

        assert model.qualificationInstance != null
        assert view == '/qualification/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/qualification/show/1'
        assert controller.flash.message != null
        assert Qualification.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/qualification/list'

        populateValidParams(params)
        def qualification = new Qualification(params)

        assert qualification.save() != null

        params.id = qualification.id

        def model = controller.show()

        assert model.qualificationInstance == qualification
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/qualification/list'

        populateValidParams(params)
        def qualification = new Qualification(params)

        assert qualification.save() != null

        params.id = qualification.id

        def model = controller.edit()

        assert model.qualificationInstance == qualification
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/qualification/list'

        response.reset()

        populateValidParams(params)
        def qualification = new Qualification(params)

        assert qualification.save() != null

        // test invalid parameters in update
        params.id = qualification.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/qualification/edit"
        assert model.qualificationInstance != null

        qualification.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/qualification/show/$qualification.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        qualification.clearErrors()

        populateValidParams(params)
        params.id = qualification.id
        params.version = -1
        controller.update()

        assert view == "/qualification/edit"
        assert model.qualificationInstance != null
        assert model.qualificationInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/qualification/list'

        response.reset()

        populateValidParams(params)
        def qualification = new Qualification(params)

        assert qualification.save() != null
        assert Qualification.count() == 1

        params.id = qualification.id

        controller.delete()

        assert Qualification.count() == 0
        assert Qualification.get(qualification.id) == null
        assert response.redirectedUrl == '/qualification/list'
    }
}
