package skillo.document

import core.util.DocumentUtil
import grails.transaction.Transactional
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.commons.CommonsMultipartFile
import skillo.Document
import skillo.Qualification
import skillo.candidate.Candidate

/**
 * DocumentService
 * A service class encapsulates the core business logic of a Grails application
 */
@Transactional
class DocumentService {

    /**
     * Service method logic to uplaod a document for a candidate
     * If there is an error while store a document, that document will be returned. If null is returned all documents were uploaded successfuly
     *
     * @param candidate
     * @param files
     * @return
     */
    def boolean uploadDocument(Candidate candidate, List files) {

        for (CommonsMultipartFile file : files) {
            if (file.empty) {
                log.info("file cannot be empty")
            } else {
                def documentInstance = new Document()
                documentInstance.type = file.getContentType()
                documentInstance.filename = file.originalFilename
                documentInstance.filedata = file.getBytes()
                documentInstance.candidateId = candidate.id
                documentInstance.fileSize = file.size
                documentInstance.humanReadableSize = DocumentUtil.bytesToHuman(file.size)

                // verify if document type is permitted to be uploaded
                if (!DocumentUtil.isDocumentValidForUpload(file)) {
                    documentInstance.errors.rejectValue("filedata", "type.invalid")
                    return documentInstance;
                }

                // save the document
                if (!documentInstance.save()) {
                    if (documentInstance.hasErrors()) {
                        documentInstance.errors.each {
                            log.info "FE" + it.fieldError.code
                        }
                    }

                    return documentInstance;
                }
            }
        }

        return null

    }

    /**
     * Return all documents uploaded for a candidate
     * @param id
     * @return
     */
    def listDocuments(Long id) {
        def candidate = Candidate.get(id)
        def documentList = Document.findAll("from Document as d where d.candidateId=:candidateId", [candidateId: candidate.id])
        return documentList

    }
}
