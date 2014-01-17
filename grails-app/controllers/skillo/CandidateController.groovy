package skillo

import skillo.Address
import skillo.Candidate
import skillo.CandidateQualification
import skillo.Consultant
import skillo.Payroll
import skillo.PostCode
import skillo.Qualification
import skillo.User

import java.text.DateFormat

class CandidateController {

    def scaffold = true
    def springSecurityService

    def index() {
        redirect(action: "list")
    }

	def list() {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)

		def candidateList = Candidate.createCriteria().list(params){
			if(params.firstName){
				ilike("firstName", "%{params.firstName}%")
			}
		}

		[CandidateList: candidateList, CandidateTotal: Candidate.count()]
	}

	def create() {
		def candidate = new Candidate(params)
		candidate.driver = true
		candidate.carOwner = true
        candidate.active = true

        def availableMainTrades = Qualification.findAllByCanBeMainTrade(true)

		[candidateInstance: candidate, AvailableMainTrades: availableMainTrades as grails.converters.JSON]
	}

    def save() {

        def candidate = new Candidate(params["candidate"])
        def address = new Address(params["address"])
        def postCode = PostCode.get(params["postCode"].id)
        def mainTrade = Qualification.get(params["candidateMainTrade"].id)
        def user = User.get(springSecurityService.principal.id)

        if (params["candidate.birthDate"]) {
            params["candidate.birthDate"] = new Date(params["candidate.birthDate"])
            candidate.birthDate = params["candidate.birthDate"]
        }

        address.postCode = postCode
        candidate.address = address

        if(mainTrade != null){

            def candidateQualification = new CandidateQualification()
            candidateQualification.qualification = mainTrade
            candidateQualification.isMainTrade = true

            candidate.addToCandidateQualifications(candidateQualification)

        }

        if(user != null){
            def consultant = Consultant.findByUser(user)
            candidate.consultant = consultant
        }

        candidate.clearErrors()
        if(!candidate.save(deepvalidate:true, flush: true)){
            if(candidate.hasErrors()){
                candidate.errors.each {
                    println "fielderrors: " + it
                }
            }

            def availableMainTrades = Qualification.findAllByCanBeMainTrade(true)
            render(view: "create", model: [candidateInstance: candidate, AvailableMainTrades: availableMainTrades as grails.converters.JSON ])
            return
        }
        candidate.addInsertEvent()

        def availableMainTrades = Qualification.findAllByCanBeMainTrade(true)
        flash.message = message(code: 'default.created.message', args: [message(code: 'candidate.label', default: 'Candidate'), candidate.firstName + " " + candidate.lastName])
        redirect(action: "edit", id: candidate.id )

    }

    def edit() {
        def candidate = Candidate.get(params.id)
        if (!candidate) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'candidate.label', default: 'Candidate'), params.id])
            redirect(action: "list")
            return
        }

        def newCandidateQualification = new CandidateQualification()
        newCandidateQualification.setCandidate(candidate)

        def availableMainTrades = Qualification.findAllByCanBeMainTrade(true)
        def availableQualifications = Qualification.findAll()
        def availablePayRollCompanies = PayrollCompany.findAll()

        [candidateInstance: candidate, newCandidateQualification: newCandidateQualification , AvailableMainTrades: availableMainTrades , AvailableQualifications: availableQualifications , AvailablePayrollCompanies: availablePayRollCompanies as grails.converters.JSON  ]
    }

    def update(){

        def candidate = Candidate.get(params.id)
        def user = User.get(springSecurityService.principal.id)

        if(!candidate){
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'candidate.label', default: 'Candidate'), params.id])
            redirect(action: "list")
            return
        }

        candidate.address.properties = params["address"]
        if(params["postCode.code"] && !params["postCode.code"].equals(candidate.address.postCode.code)){
            candidate.address.postCode = PostCode.findByCode(params["postCode.code"])
        }

        if (params["candidate.birthDate"]) {
            params["candidate.birthDate"] = new Date(params["candidate.birthDate"])
            candidate.birthDate = params["candidate.birthDate"]
        }

        candidate.payroll.properties = params["payroll"]
        candidate.properties = params["candidate"]

        if(candidate.checkVersion(Long.parseLong(params.version))){
            if (!candidate.save(deepvalidate:true, flush: true)) {
                if(candidate.hasErrors()){
                    candidate.errors.each {
                        println "fielderrors: " + it
                    }
                }
                def availablePayRollCompanies = PayrollCompany.findAll()
                render(view: "edit", model: [candidateInstance: candidate , AvailablePayrollCompanies: availablePayRollCompanies as grails.converters.JSON ])
                return
            }
        }

        if(user != null){
            def consultant = Consultant.findByUser(user)
            candidate.consultant = consultant
        }

        if(user != null){
            def consultant = Consultant.findByUser(user)
            candidate.addUpdateEvent(consultant)
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'candidate.label', default: '${className}'), candidate.id])
        redirect(action: "list")
    }

	def show() {
		def candidate = Candidate.get(params.id)
		if (!candidate) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'candidate.label', default: 'Candidate'), params.id])
			redirect(action: "list")
			return
		}

		[candidateInstance: candidate]
	}

}
