package skillo.controller

import grails.test.mixin.*
import skillo.candidate.Candidate
import skillo.candidate.CandidateController

@TestFor(CandidateController)
@Mock(Candidate)
class CandidateControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/candidate/list" == response.redirectedUrl
    }

    void testListIsEmpty() {
        def model = controller.list()
        assert model.candidateInstanceList == null
    }

    void testCreate() {
        def model = controller.create()

        assert model.candidateInstance != null
    }

    void testSave() {
        controller.save()

        assert model.candidateInstance != null
        assert view == '/candidate/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/candidate/show/1'
        assert controller.flash.message != null
        assert Candidate.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/candidate/list'

        populateValidParams(params)
        def candidate = new Candidate(params)

        assert candidate.save() != null

        params.id = candidate.id

        def model = controller.show()

        assert model.candidateInstance == candidate
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/candidate/list'

        populateValidParams(params)
        def candidate = new Candidate(params)

        assert candidate.save() != null

        params.id = candidate.id

        def model = controller.edit()

        assert model.candidateInstance == candidate
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/candidate/list'

        response.reset()

        populateValidParams(params)
        def candidate = new Candidate(params)

        assert candidate.save() != null

        // test invalid parameters in update
        params.id = candidate.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/candidate/edit"
        assert model.candidateInstance != null

        candidate.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/candidate/show/$candidate.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        candidate.clearErrors()

        populateValidParams(params)
        params.id = candidate.id
        params.version = -1
        controller.update()

        assert view == "/candidate/edit"
        assert model.candidateInstance != null
        assert model.candidateInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/candidate/list'

        response.reset()

        populateValidParams(params)
        def candidate = new Candidate(params)

        assert candidate.save() != null
        assert Candidate.count() == 1

        params.id = candidate.id

        controller.delete()

        assert Candidate.count() == 0
        assert Candidate.get(candidate.id) == null
        assert response.redirectedUrl == '/candidate/list'
    }
}
